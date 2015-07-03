package com.whut.wxcs.resmanager.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.google.gson.Gson;
import com.whut.wxcs.resmanager.model.Attribute;
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

	InputStream inputStream;

	public InputStream getInputStream() {
		return inputStream;
	}

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
	 * 跳转到模板详情页面
	 */
	public String toTemplateDetailPage() {
		model = catalogueService.getTemplateWithAll(model.getId());
		return "toTemplateDetailPage";
	}

	/*
	 * AJAX更新模板的名字和描述
	 */
	public String updateTemplateByAJAX() {
		try {
			catalogueService.updateTemplate(model);
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		} catch (Exception e) {
			try {
				inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
			} catch (Exception e1) {}
		}
		return "ajax-success";
	}
	
	/*
	 * AJAX获取模板的名字和描述
	 */
	public String getTemplateDetailByAJAX() {
		try {
			model = catalogueService.getTemplate(model.getId());
			
			Map<String,String> map = new HashMap<String, String>();
			map.put("id", model.getId()+"");
			map.put("description", model.getDescription());
			map.put("name", model.getTemplateName());
			
			Gson gson = new Gson();
			String str = gson.toJson(map);
			
			inputStream = new ByteArrayInputStream(str.getBytes("UTF-8"));
		} catch (Exception e) {
			try {
				inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
			} catch (Exception e1) {}
		}
		return "ajax-success";
	}

}
