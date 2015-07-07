package com.whut.wxcs.resmanager.service;

import java.util.List;

import com.whut.wxcs.resmanager.model.Catalogue;
import com.whut.wxcs.resmanager.model.Page;
import com.whut.wxcs.resmanager.model.Provider;
import com.whut.wxcs.resmanager.model.Resource;

public interface ResourceService {

	public void addResource(Resource model);

	public boolean isResourceNameUnique(String resource_name);

	public List<Resource> getProviderResource(Provider provider);

	public List<Resource> getCatalogueProviderResource(Integer cid,
			Provider provider);

	public Resource getResource(Integer rid);

	public void updateResource(Resource model);

	public void delete(long rid);

	/**
	 * 资源按照创建时间排序
	 * @param cid
	 * @param pid
	 */
	public List<Resource> orderByTime(long pid, long cid);

	/* public List<Catalogue> getChildCatalogues(long cid); */

	/* public Page<Resource> getPageResource(); */

}
