package com.whut.wxcs.resmanager.service.impl;

import java.util.List;

import org.eclipse.core.internal.runtime.FindSupport;
import org.springframework.stereotype.Service;

import com.whut.wxcs.resmanager.dao.BaseDao;
import com.whut.wxcs.resmanager.model.Provider;
import com.whut.wxcs.resmanager.model.Resource;
import com.whut.wxcs.resmanager.model.ResourceAttribute;
import com.whut.wxcs.resmanager.service.ResourceService;

@Service("resourceService")
public class ResourceServiceImpl implements ResourceService {

	@javax.annotation.Resource(name = "resourceAttributeDao")
	private BaseDao<ResourceAttribute> resourceAttributeDao;
	@javax.annotation.Resource(name = "resourceDao")
	private BaseDao<Resource> resourceDao;

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
		String hql = "from Resource r where r.provider.id = ? and r.catalogue.id = ?";
		List<Resource> resources = resourceDao.findEntityByHql(hql, cid,
				provider.getId());
		return resources;
	}

}
