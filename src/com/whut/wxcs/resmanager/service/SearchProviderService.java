package com.whut.wxcs.resmanager.service;

import com.whut.wxcs.resmanager.model.Page;
import com.whut.wxcs.resmanager.model.Provider;
import com.whut.wxcs.resmanager.model.web.CriteriaProvider;

/**
 * 搜索用的service
 */
public interface SearchProviderService {

	/**
	 * 根据封装好的参数来查找资源
	 */
	public Page<Provider> searchByCriteria(CriteriaProvider model);

}
