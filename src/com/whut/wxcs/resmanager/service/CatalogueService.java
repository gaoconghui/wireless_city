package com.whut.wxcs.resmanager.service;

import java.util.List;

import com.whut.wxcs.resmanager.model.Catalogue;
import com.whut.wxcs.resmanager.model.Template;


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

	/*
	 * 保存模板及其属性
	 */
	public void saveTemplate(Template model);

	/*
	 * 查询返回一个template以及属性
	 */
	public Template getTemplate(long id);

	/*
	 * 查找返回一个template以及其属性和catalogue
	 */
	public Template getTemplateWithAll(long id);

	/*
	 * 修改template
	 */
	public void updateTemplate(Template model);



}