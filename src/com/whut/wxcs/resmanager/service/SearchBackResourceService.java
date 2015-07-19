package com.whut.wxcs.resmanager.service;

import com.whut.wxcs.resmanager.model.Page;
import com.whut.wxcs.resmanager.model.Resource;
import com.whut.wxcs.resmanager.model.web.CriteriaBackResource;

/**
 * 搜索用的service
 */
public interface SearchBackResourceService {

	/**
	 * 根据封装好的参数来查找资源
	 */
	public Page<Resource> searchByCriteria(CriteriaBackResource model);

}
