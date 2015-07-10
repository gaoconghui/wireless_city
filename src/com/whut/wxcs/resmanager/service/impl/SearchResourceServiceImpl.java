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
import com.whut.wxcs.resmanager.model.CriteriaResource;
import com.whut.wxcs.resmanager.model.Resource;
import com.whut.wxcs.resmanager.model.ResourceAttribute;
import com.whut.wxcs.resmanager.model.ResourcePage;
import com.whut.wxcs.resmanager.service.CatalogueService;
import com.whut.wxcs.resmanager.service.SearchResourceService;
import com.whut.wxcs.resmanager.util.ValidateUtil;

@Service("searchResourceService")
public class SearchResourceServiceImpl implements SearchResourceService {

	@javax.annotation.Resource
	BaseDao<Resource> resourceDao;

	@javax.annotation.Resource
	CatalogueService catalogueService;

	@Override
	public ResourcePage searchByCriteria(CriteriaResource model) {

		ResourcePage page = new ResourcePage(model.getPageNum());
		page.setPageSize(model.getPageSize());

		Criteria criteria = resourceDao.getCriteria();

		// 增加类目查询
		addCriteriaCatalogue(model, criteria);

		// 增加关键字查询
		addCriteriaKeyword(model, criteria);

		// 增加全局关键字查询
		addCriteriaFrontKeyword(model, criteria);

		// 根据属性进行查询
		addCriteriaAttribute(model, criteria);

		// 增加排序
		addCriteriaOrder(model, criteria);

		// 未分页前查询获得总页数
		List<Resource> reosourceList = criteria.list();
		long size = reosourceList.size();
		page.setTotalItemNumber(size);

		// 增加给page赋值属性
		long tid = 1;
		if (model.getCatalogueId() != 0) {
			tid = model.getCatalogueId();
		} else if (ValidateUtil.isVaild(model.getFrontKey()) && size > 0) {
			tid = getTidByResourceList(reosourceList);
		}
		page.setAttrList(catalogueService.getEnumAttributesByTid(tid));
		page.setCatalogue(catalogueService.initCatalogueById(tid));

		// 增加分页
		addCriteriaPaging(model, criteria);

		page.setList(criteria.list());
		return page;
	}

	/**
	 * 分页操作
	 * 
	 * @param model
	 * @param criteria
	 */
	private void addCriteriaPaging(CriteriaResource model, Criteria criteria) {
		criteria.setFirstResult((model.getPageNum() - 1) * model.getPageSize())
				.setMaxResults(model.getPageSize());
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

	/**
	 * 在criteria 里增加类目拦截
	 * 
	 * @param model
	 * @param criteria
	 */
	private void addCriteriaCatalogue(CriteriaResource model, Criteria criteria) {
		if (model.getCatalogueId() != 0) {
			criteria.add(Restrictions
					.sqlRestriction("this_.CATALOGUE_ID like '"
							+ model.getCatalogueId() + "%'"));

		}
	}

	/**
	 * 在criteria 里增加关键字拦截
	 */
	private void addCriteriaKeyword(CriteriaResource model, Criteria criteria) {
		if (ValidateUtil.isVaild(model.getKeyWord())) {
			Disjunction disjunction;
			// 使用 or 连接
			disjunction = Restrictions.disjunction();
			disjunction.add(Restrictions.like("resource_name",
					model.getKeyWord(), MatchMode.ANYWHERE));
			disjunction.add(Restrictions.like("description",
					model.getKeyWord(), MatchMode.ANYWHERE));
			criteria.add(disjunction);
		}
	}

	/**
	 * 增加全局关键字拦截
	 * 
	 * @param model
	 * @param criteria
	 */
	private void addCriteriaFrontKeyword(CriteriaResource model,
			Criteria criteria) {
		if (ValidateUtil.isVaild(model.getFrontKey())) {
			Disjunction disjunction;
			// 使用 or 连接
			disjunction = Restrictions.disjunction();
			disjunction.add(Restrictions.like("resource_name",
					model.getFrontKey(), MatchMode.ANYWHERE));
			disjunction.add(Restrictions.like("description",
					model.getFrontKey(), MatchMode.ANYWHERE));
			criteria.add(disjunction);
		}
	}

	/**
	 * 在criteria 里增加排序
	 */
	private void addCriteriaOrder(CriteriaResource model, Criteria criteria) {
		if (model.getOrderSequence() == CriteriaResource.ORDER_ASC) {
			criteria.addOrder(Order.asc(CriteriaResource.getOrderMap().get(
					model.getOrderName())));
		} else if (model.getOrderSequence() == CriteriaResource.ORDER_DESC) {
			criteria.addOrder(Order.desc(CriteriaResource.getOrderMap().get(
					model.getOrderName())));
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

	/**
	 * 根据传入的resource的list 返回一组Attribute
	 */
	private Long getTidByResourceList(List<Resource> list) {

		List rids = new ArrayList();
		for (Resource r : list) {
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

	// 传入包含tid和count 的map 以及总数sum，返回tid
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

}
