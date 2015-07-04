package com.whut.wxcs.resmanager.struts.action;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.whut.wxcs.resmanager.model.Attribute;
import com.whut.wxcs.resmanager.model.Catalogue;
import com.whut.wxcs.resmanager.model.Resource;
import com.whut.wxcs.resmanager.model.Template;
import com.whut.wxcs.resmanager.service.CatalogueService;

@Controller
@Scope("prototype")
public class AddResourceAction extends BaseAction<Resource> {

	private static final long serialVersionUID = 1L;
	@javax.annotation.Resource
	private CatalogueService catalogueService;
	private Integer cid;
	private Template template;

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public Integer getCid() {
		return cid;
	}

	public void setTemplate(Template template) {
		this.template = template;
	}

	public Template getTemplate() {
		return template;
	}

	private List<Catalogue> catalogues;

	private Resource model = new Resource();

	public List<Catalogue> getCatalogues() {
		return catalogues;
	}

	public void setCatalogues(List<Catalogue> catalogues) {
		this.catalogues = catalogues;
	}

	@Override
	public Resource getModel() {
		return model;
	}

	public String toAddResource() {
		catalogues = catalogueService.getRootCatalogue();
		System.out.println(catalogues.size());
		return "toAddPage";
	}

	/**
	 * 模板属性 接受参数cid (种类的id)
	 * 
	 */
	public String showTemplate() {
		// 查询template并返回属性
		template = catalogueService.getTemplate(cid);
		System.out.println(template.getAttributes().size());
		return "template";
	}

}
