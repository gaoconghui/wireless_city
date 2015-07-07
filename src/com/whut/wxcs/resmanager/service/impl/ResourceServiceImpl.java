package com.whut.wxcs.resmanager.service.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.criterion.Subqueries;
import org.springframework.stereotype.Service;

import com.whut.wxcs.resmanager.dao.BaseDao;
import com.whut.wxcs.resmanager.model.Catalogue;
import com.whut.wxcs.resmanager.model.Provider;
import com.whut.wxcs.resmanager.model.Resource;
import com.whut.wxcs.resmanager.model.ResourceAttribute;
import com.whut.wxcs.resmanager.service.ResourceService;

@Service("resourceService")
public class ResourceServiceImpl implements ResourceService {

	@javax.annotation.Resource(name = "resourceAttribute")
	private BaseDao<ResourceAttribute> resourceAttributeDao;
	@javax.annotation.Resource(name = "resourceDao")
	private BaseDao<Resource> resourceDao;
	@javax.annotation.Resource(name = "catalogueDao")
	private BaseDao<Catalogue> catalogueDao;

	@Override
	public void addResource(Resource model) {
		resourceDao.saveEntity(model);
		for (ResourceAttribute resourceAttribute : model.getAttributes()) {
			resourceAttributeDao.saveEntity(resourceAttribute);
		}
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

/*	@Override
	public List<Catalogue> getChildCatalogues(long cid) {
		String hql = "from Catalogue c where c.id = ?";
		Catalogue catalogue = catalogueDao.getEntity(cid);

		return (List<Catalogue>) catalogue.getChild();
	}*/

	/*
	 * @Override public Page<Resource> getPageResource() { Criteria criteria =
	 * resourceDao.getCriteria();
	 * criteria.setFirstResult(1).setMaxResults(2).list(); return null; }
	 */
}
