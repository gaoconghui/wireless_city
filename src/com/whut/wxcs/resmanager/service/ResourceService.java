package com.whut.wxcs.resmanager.service;

import java.util.List;

import com.whut.wxcs.resmanager.model.Catalogue;
import com.whut.wxcs.resmanager.model.CriteriaResource;
import com.whut.wxcs.resmanager.model.Provider;
import com.whut.wxcs.resmanager.model.Resource;
import com.whut.wxcs.resmanager.model.ResourcePage;

public interface ResourceService extends BaseService<Resource>{

	/**
     *  增加资源 
     */
	public long addResource(Resource model);
    /**
     *  验证资源名称的唯一性 
     */
	public boolean isResourceNameUnique(String resource_name);
    /**
     * 得到某一个服务商下的所有资源 
     */
	public List<Resource> getProviderResource(Provider provider);
     
	public List<Resource> getCatalogueProviderResource(Integer cid,
			Provider provider);
    /**
     * 得到某一个具体的资源
     */
	public Resource getResource(long rid);
    /**
     * 更新资源 
     */
	public void updateResource(Resource model);
    /**
     * 删除资源 
     */
	public void delete(long rid);

	/**
	 * 资源按照创建时间排序
	 */
	public List<Resource> orderByTime(long pid, long cid);

	/**
	 * 某个服务资源商的全局查询
	 */
	public List<Resource> getResourcesByKeyWord(long pid, String keyWord);

	/**
	 * 根据封装好的属性进行查询
	 */
	public ResourcePage searchByCriteria(long pid, CriteriaResource model);

	/**
	 * 通过服务商所选的资源判断服务商的类目
	 */
	public List<Catalogue> getProviderCatalogue(List<Resource> resources);

	/**
	 * 批量通过审查
	 */
	public void passListCheck(String ids);

	/**
	 * 批量下架
	 */
	public void offListCheck(String ids);

}
