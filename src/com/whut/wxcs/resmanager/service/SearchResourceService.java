package com.whut.wxcs.resmanager.service;

import java.util.List;

import com.whut.wxcs.resmanager.model.CriteriaResource;
import com.whut.wxcs.resmanager.model.Page;
import com.whut.wxcs.resmanager.model.Resource;

/**
 * 搜索用的service
 */
public interface SearchResourceService {

	/**
	 * 根据封装好的参数来查找资源
	 */
	Page<Resource> searchByCriteria(CriteriaResource model);

}
