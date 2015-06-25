package com.whut.wxcs.resmanager.action;

import java.util.HashSet;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.whut.wxcs.resmanager.model.Attribute;
import com.whut.wxcs.resmanager.model.Catalogue;
import com.whut.wxcs.resmanager.model.Template;
import com.whut.wxcs.resmanager.service.CatalogueService;

@Controller
@Scope("prototype")
public class TemplateAction extends BaseAction<Template> {

	private static final long serialVersionUID = -3611810669887247642L;

	@Resource
	private CatalogueService catalogueService;

	private long cid;

	List<Attribute> attr;

	public List<Attribute> getAttr() {
		return attr;
	}

	public void setAttr(List<Attribute> attr) {
		this.attr = attr;
	}

	public void setCid(long cid) {
		this.cid = cid;
	}

	public long getCid() {
		return cid;
	}

	/*
	 * 跳转到新建模板页面
	 */
	public String toNewTemplatePage() {
		return "toNewTemplatePage";
	}

	/*
	 * 新建一个模板
	 */
	public String newTemplate() {
		System.out.println(attr.size());
		System.out.println(model.getDescription());
		System.out.println(cid);
		
		Catalogue catalogue = new Catalogue();
		catalogue.setId(cid);
		
		model.setCatalogue(catalogue);
		model.setAttributes(new HashSet<Attribute>(attr));
		
		catalogueService.saveTemplate(model);
		System.out.println(model.getId());
		
		return "newTemplate";
	}
	
	/*
	 * 跳转到模板详情页面
	 */
	public String toTemplateDetailPage(){
		
		return "toTemplateDetailPage";
	}

}
