package com.whut.wxcs.resmanager.service;

import java.util.List;

import com.whut.wxcs.resmanager.model.Attribute;
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
	 * 增加目录,model 里面有parent.id 和name 以及description
	 */
	public void saveCatalogue(Catalogue model);

	/*
	 * 获取包含所有子目录的根目录
	 */
	public Catalogue getRootCatalogueWithAllChild();

	/*
	 * 通过id 获取所有的子节点
	 */
	public List<Catalogue> getChildCatalogueByParentId(long id);
	
	/*
	 * 删除类目及child节点
	 */
	public void deleteCatalogueWithChild(long id);

	/*
	 * 获取单个类目
	 */
	public Catalogue getCatalogueById(long id);
	

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

	/*
	 * 更新Attribute
	 */
	public void updateAttribute(Attribute model);

	/*
	 * 移除Attribute，以及其子节点
	 */
	public void deleteAttribute(long tid, long aid );

	/*
	 * 添加单个Attribute(templateid以及arrtibute属性)，同时给添加模板的所有子类目模板上同样添加
	 */
	public void saveSingleAttribute(Attribute attribute,long tId);

	

}
