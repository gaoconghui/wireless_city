package com.whut.wxcs.resmanager.service;

import java.util.List;

import com.whut.wxcs.resmanager.model.Catalogue;


public interface CatalogueService extends BaseService<Catalogue>{

	/*
	 * 获取所有的根目录
	 */
	public List<Catalogue> getRootCatalogue();

	/*
	 * 获取全部的目录
	 */
	public List<Catalogue> getAllCatalogue();

	/*
	 * 增加目录
	 */
	public void saveCatalogue(Catalogue model);

	/*
	 * 获取包含所有子目录的根目录
	 */
	public Catalogue getRootCatalogueWithAllChild();

	/*
	 * 删除类目及child节点
	 */
	public void deleteCatalogueWithChild(long id);

	/*
	 * 获取单个类目
	 */
	public Catalogue getCatalogueById(long id);



}
