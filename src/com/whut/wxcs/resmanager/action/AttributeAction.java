package com.whut.wxcs.resmanager.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
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
public class AttributeAction extends BaseAction<Attribute> {

	private static final long serialVersionUID = -3611810669887247642L;

	@Resource
	private CatalogueService catalogueService;


	List<Attribute> attr;

	InputStream inputStream;

	public InputStream getInputStream() {
		return inputStream;
	}



	/*
	 * AJAX更新Attribute,要传入id 以及要修改的内容
	 */
	public String updateAttributeUseAJAX() {
		try {
			catalogueService.updateAttribute(model);
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		} catch (UnsupportedEncodingException e) {}
		return "ajax-success";
	}
	
	/*
	 * AJAX删除Attribute,要传入id 以及要修改的内容
	 */
	public String deleteAttributeUseAJAX() {
		try {
			catalogueService.deleteAttribute(model);
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		} catch (UnsupportedEncodingException e) {}
		return "ajax-success";
	}

}
