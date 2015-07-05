package com.whut.wxcs.resmanager.service;

import java.util.List;

import com.whut.wxcs.resmanager.model.Provider;
import com.whut.wxcs.resmanager.model.Resource;

public interface ResourceService {

	public void addResource(Resource model);

	public boolean isResourceNameUnique(String resource_name);

	public List<Resource> getProviderResource(Provider provider);

	public List<Resource> getCatalogueProviderResource(Integer cid,
			Provider provider);

}
