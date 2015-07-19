package com.whut.wxcs.resmanager.service.impl;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.hibernate.Criteria;
import org.hibernate.criterion.Conjunction;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

import com.whut.wxcs.resmanager.dao.BaseDao;
import com.whut.wxcs.resmanager.model.Attribute;
import com.whut.wxcs.resmanager.model.Catalogue;
import com.whut.wxcs.resmanager.model.CriteriaResource;
import com.whut.wxcs.resmanager.model.Provider;
import com.whut.wxcs.resmanager.model.Resource;
import com.whut.wxcs.resmanager.model.ResourceAttribute;
import com.whut.wxcs.resmanager.model.ResourcePage;
import com.whut.wxcs.resmanager.service.CatalogueService;
import com.whut.wxcs.resmanager.service.ResourceService;
import com.whut.wxcs.resmanager.util.DataUtils;
import com.whut.wxcs.resmanager.util.ValidateUtil;

@Service("resourceService")
public class ResourceServiceImpl implements ResourceService {

	@javax.annotation.Resource(name = "resourceAttributeDao")
	private BaseDao<ResourceAttribute> resourceAttributeDao;
	@javax.annotation.Resource(name = "resourceDao")
	private BaseDao<Resource> resourceDao;
	@javax.annotation.Resource(name = "catalogueService")
	private CatalogueService catalogueService;

	@Override
	public long addResource(Resource model) {
		for (ResourceAttribute resourceAttribute : model.getAttributes()) {
			resourceAttributeDao.saveEntity(resourceAttribute);
		}
		return resourceDao.saveEntity(model);
	}

	@Override
	public boolean isResourceNameUnique(String resource_name) {
		String hql = "from Resource r where r.resource_name = ?";
		List<Resource> resources = resourceDao.findEntityByHql(hql,
				resource_name);
		if (resources != null && resources.size() != 0) {
			return false;
		}
		return true;
	}

	@Override
	public List<Resource> getProviderResource(Provider provider) {
		String hql = "from Resource r where r.provider.id = ?";
		List<Resource> resources = resourceDao.findEntityByHql(hql,
				provider.getId());
		for (Resource resource : resources) {
			resource.getCatalogue();
		}
		return resources;
	}

	@Override
	public List<Resource> getCatalogueProviderResource(Integer cid,
			Provider provider) {
		/*
		 * String hql =
		 * "from Resource r where r.provider.id = ? and r.catalogue.id LIKE ?";
		 */
		String sql = "SELECT * FROM resource WHERE PROVIDER_ID =? AND CATALOGUE_ID LIKE ? ";
		/*
		 * List<Resource> resources = resourceDao.findEntityByHql(hql, cid +
		 * "%", provider.getId());
		 */
		List<Resource> resources = resourceDao.findEntityBySql(sql,
				provider.getId(), cid + "%");
		for (Resource resource : resources) {
			// 强行在服务层对catalogue进行初始化
			System.out.println(resource.getCatalogue().getName());
		}
		return resources;
	}

	@Override
	public Resource getResource(Integer rid) {
		Resource resource = resourceDao.getEntity(rid);
		System.out.println(resource.getCatalogue().getName());
		System.out.println(resource.getAttributes().size());
		return resource;
	}

	@Override
	public void updateResource(Resource model) {
		for (ResourceAttribute resourceAttribute : model.getAttributes()) {
			resourceAttributeDao.saveEntity(resourceAttribute);
		}
		resourceDao.saveEntity(model);
	}

	@Override
	public void delete(long rid) {
		// 先删除关联的外键部分，在删除本表的部分
		String hql = "delete from ResourceAttribute ra where ra.resource.id = ?";
		resourceAttributeDao.batchEntityByHql(hql, rid);
		hql = "delete from Resource r where r.id = ?";
		resourceDao.batchEntityByHql(hql, rid);
	}

	/*
	 * @Override public List<Resource> orderByTime() { Criteria criteria =
	 * resourceDao.getCriteria(); criteria.addOrder(Order.desc("create_time"));
	 * List<Resource> resources = criteria.list();
	 * System.out.println(resources.size()); return resources; }
	 */

	@Override
	public List<Resource> orderByTime(long pid, long cid) {
		Criteria criteria = resourceDao.getCriteria();
		criteria.addOrder(Order.asc("create_time"));
		criteria.createCriteria("provider").add(Restrictions.eq("id", pid));
		criteria.createCriteria("catalogue").add(Restrictions.eq("id", cid));
		List<Resource> resources = criteria.list();
		System.out.println(resources.size());
		return resources;
	}

	@Override
	public List<Resource> getResourcesByKeyWord(long pid, String keyWord) {
		if (ValidateUtil.isVaild(keyWord)) {
			Criteria criteria = resourceDao.getCriteria();
			criteria.createCriteria("provider").add(Restrictions.eq("id", pid));
			criteria.addOrder(Order.asc("create_time"));
			Disjunction disjunction = Restrictions.disjunction();
			disjunction.add(Restrictions.like("resource_name", keyWord,
					MatchMode.ANYWHERE));
			disjunction.add(Restrictions.like("description", keyWord,
					MatchMode.ANYWHERE));
			criteria.add(disjunction);
			return criteria.list();
		}
		return null;
	}

	@Override
	public ResourcePage searchByCriteria(long pid, CriteriaResource model) {
		ResourcePage page = new ResourcePage(model.getPageNum());
		page.setPageSize(model.getPageSize());

		Criteria criteria = resourceDao.getCriteria();

		// 增加服务商的查询条件
		criteria.createCriteria("provider").add(Restrictions.eq("id", pid));
		// 增加类目查询条件
		addCriteriaCatalogue(model, criteria);
		// 增加关键字查询
		addCriteriaKeyword(model, criteria);
		// 增加全局的关键字查询
		addCriteriaFrontKey(model, criteria);
		// 增加排序方式
		addCriteriaOrderByTime(model, criteria);
		//根据审核状态排序,默认状况下优先查询审核状态下的服务资源
		addCriteriaState(model,criteria);
		// 增加属性进行查询
		addCriteriaAttribute(model, criteria);
		
		
		// 初始化page
		List<Resource> resources = criteria.list();

		page.setList(resources);
		page.setTotalItemNumber(resources.size());

		// 增加分页查询
		// tid模板ID，和Catalogue的ID一样
		long tid = 1;
		if (model.getCatalogueId() != 0) {
			tid = model.getCatalogueId();
		} else if (ValidateUtil.isVaild(model.getFrontKey())
				&& resources.size() > 0) {
			tid = getTidByResourceList(resources);
		}

		page.setAttrList(catalogueService.getEnumAttributesByTid(tid));
		page.setCatalogue(catalogueService.initCatalogueById(tid));

		// 分页查询
		addPaging(model, criteria);
		page.setList(criteria.list());

		return page;
	}

	private void addCriteriaState(CriteriaResource model, Criteria criteria) {
            criteria.add(Restrictions.eq("checkState", model.getState()));
	}

	private long getTidByResourceList(List<Resource> resources) {
		List rids = new ArrayList();
		for (Resource r : resources) {
			rids.add(r.getId());
		}

		String sql = "SELECT  CATALOGUE_ID,COUNT(*) FROM RESOURCE WHERE RESOURCE_ID IN (:list) GROUP BY CATALOGUE_ID";
		// 得到模板/数量的list
		List countList = resourceDao.findBySql(sql, "list", rids.toArray());

		// 记录总得数量
		Long sum = 0L;

		Map<Long, Long> countMap = new HashMap<Long, Long>();

		BigInteger bg0;
		BigInteger bg1;
		// 生成<templaeid,count>的map
		for (Iterator it = countList.iterator(); it.hasNext();) {
			Object[] row = (Object[]) it.next();
			bg0 = (BigInteger) row[0];
			bg1 = (BigInteger) row[1];
			countMap.put(bg0.longValue(), bg1.longValue());
			sum = sum + bg1.longValue();
		}

		Long tid = getTidFromCountMap(countMap, sum);
		System.out.println(tid);

		return tid;

	}

	private Long getTidFromCountMap(Map<Long, Long> countMap, Long sum) {
		for (Entry<Long, Long> entry : countMap.entrySet()) {
			if (entry.getValue() > sum / 2) {
				return entry.getKey();
			}
		}
		Map<Long, Long> newMap = new HashMap<Long, Long>();
		Long newTid, newCount;
		for (Entry<Long, Long> entry : countMap.entrySet()) {
			newTid = entry.getKey() / 100;
			if (newMap.containsKey(newTid)) {
				newMap.put(newTid, newMap.get(newTid) + entry.getValue());
			} else {
				newMap.put(newTid, entry.getValue());
			}
		}

		return getTidFromCountMap(newMap, sum);
	}

	/**
	 * 在criteria 里增加属性拦截 相同的属性不同值用或连接，不同属性之间用且连接
	 * 
	 * @param model
	 * @param criteria
	 */
	private void addCriteriaAttribute(CriteriaResource model, Criteria criteria) {
		if (model.getAttrMap().size() != 0) {

			Conjunction conjunction;
			Attribute attribute;
			DetachedCriteria detachedCriteria;

			// 遍历 给每个限定的attribute 增加拦截
			for (String attr : model.getAttrMap().keySet()) {

				conjunction = Restrictions.conjunction();
				conjunction.add(Restrictions.eq("value", getValue(attr)));
				conjunction.add(Restrictions.eq("attribute.id",
						getAttributeId(attr)));

				detachedCriteria = DetachedCriteria
						.forClass(ResourceAttribute.class).add(conjunction)
						.setProjection(Property.forName("resource.id"));
				criteria.add(Property.forName("id").in(detachedCriteria));
			}

		}
	}

	// 传入string 获取出value 如传入25_3 取出3
	private String getValue(String attr) {
		return attr.substring(attr.indexOf("_") + 1, attr.length());
	}

	// 传入string 获取出attributeid 如传入25_3 取出25
	private long getAttributeId(String attr) {
		return Long.parseLong(attr.substring(0, attr.indexOf("_")));
	}

	private void addCriteriaOrderByTime(CriteriaResource model,
			Criteria criteria) {
		if (model.getOrderSequence() == CriteriaResource.ORDER_ASC) {
			criteria.addOrder(Order.asc(CriteriaResource.getOrderMap().get(
					model.getOrderName())));
		} else if (model.getOrderSequence() == CriteriaResource.ORDER_DESC) {
			criteria.addOrder(Order.desc(CriteriaResource.getOrderMap().get(
					model.getOrderName())));
		}
	}

	private void addPaging(CriteriaResource model, Criteria criteria) {
		criteria.setFirstResult((model.getPageNum() - 1) * model.getPageSize())
				.setMaxResults(model.getPageSize());
	}

	private void addCriteriaFrontKey(CriteriaResource model, Criteria criteria) {
		if (ValidateUtil.isVaild(model.getFrontKey())) {
			Disjunction disjunction;
			disjunction = Restrictions.disjunction();
			disjunction.add(Restrictions.like("resource_name",
					model.getFrontKey(), MatchMode.ANYWHERE));
			disjunction.add(Restrictions.like("description",
					model.getFrontKey(), MatchMode.ANYWHERE));
			criteria.add(disjunction);
		}
	}

	/*
	 * 增加关键字查询
	 */
	private void addCriteriaKeyword(CriteriaResource model, Criteria criteria) {
		if (ValidateUtil.isVaild(model.getKeyWord())) {
			Disjunction disjunction;
			disjunction = Restrictions.disjunction();
			disjunction.add(Restrictions.like("resource_name",
					model.getKeyWord(), MatchMode.ANYWHERE));
			disjunction.add(Restrictions.like("description",
					model.getKeyWord(), MatchMode.ANYWHERE));
			criteria.add(disjunction);
		}

	}

	/**
	 * 增加类目查询
	 */
	private void addCriteriaCatalogue(CriteriaResource model, Criteria criteria) {
		if (model.getCatalogueId() != 0) {
			criteria.add(Restrictions
					.sqlRestriction("this_.CATALOGUE_ID like '"
							+ model.getCatalogueId() + "%'"));
		}
	}
	
	@Override
	public List<Catalogue> getProviderCatalogue(List<Resource> resources) {
		List<Catalogue> catalogues = new ArrayList<Catalogue>();
		//将resource中catalogue为3位数的ID  踢出出来
		for (Resource resource : resources) {
			if (DataUtils.isTrible(resource.getCatalogue().getId())) {
				Catalogue catalogue = catalogueService
						.initCatalogueById(resource.getCatalogue().getId());
			     if(!catalogues.contains(catalogue)){
			    	 catalogues.add(catalogue);
			     }
			}
		}
		return catalogues;
	}

}
