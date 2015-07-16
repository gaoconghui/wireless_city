package com.whut.wxcs.resmanager.service;

import java.util.List;

import com.whut.wxcs.resmanager.model.Catalogue;
import com.whut.wxcs.resmanager.model.CriteriaResource;
import com.whut.wxcs.resmanager.model.Page;
import com.whut.wxcs.resmanager.model.Provider;
import com.whut.wxcs.resmanager.model.Resource;
import com.whut.wxcs.resmanager.model.ResourcePage;

public interface ResourceService {

	public long addResource(Resource model);

	public boolean isResourceNameUnique(String resource_name);

	public List<Resource> getProviderResource(Provider provider);

	public List<Resource> getCatalogueProviderResource(Integer cid,
			Provider provider);

	public Resource getResource(Integer rid);

	public void updateResource(Resource model);

	public void delete(long rid);

	/**
	 * 资源按照创建时间排序
	 * 
	 * @param cid
	 * @param pid
	 */
	public List<Resource> orderByTime(long pid, long cid);

	/**
	 * 某个服务资源商的全局查询
	 */
	public List<Resource> getResourcesByKeyWord(long pid, String keyWord);

	/* public List<Catalogue> getChildCatalogues(long cid); */

	/* public Page<Resource> getPageResource(); */

	/**
	 * 根据封装好的属性进行查询
	 */
	public ResourcePage searchByCriteria(long pid, CriteriaResource model);

	/**
	 * 通过服务商所选的资源判断服务商的类目
	 */
	public List<Catalogue> getProviderCatalogue(List<Resource> resources);

}
