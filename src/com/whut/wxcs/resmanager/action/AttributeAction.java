package com.whut.wxcs.resmanager.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.HashSet;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.Validateable;
import com.whut.wxcs.resmanager.model.Attribute;
import com.whut.wxcs.resmanager.model.Catalogue;
import com.whut.wxcs.resmanager.model.Template;
import com.whut.wxcs.resmanager.service.CatalogueService;
import com.whut.wxcs.resmanager.util.ValidateUtil;

@Controller
@Scope("prototype")
public class AttributeAction extends BaseAction<Attribute> {

	private static final long serialVersionUID = -3611810669887247642L;

	@Resource
	private CatalogueService catalogueService;

	private InputStream inputStream;

	//template 的id
	private int tid;

	public void setTid(int tid) {
		this.tid = tid;
	}

	public int getTid() {
		return tid;
	}

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
		} catch (UnsupportedEncodingException e) {
		}
		return "ajax-success";
	}

	/*
	 * AJAX删除Attribute,要传入id 以及要修改的内容
	 */
	public String deleteAttributeUseAJAX() {
		try {
			catalogueService.deleteAttribute(getTid(), model.getId());
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		} catch (UnsupportedEncodingException e) {
		}
		return "ajax-success";
	}

	/*
	 * AJAX添加Attribute,传入template的id（即catalogue的id）,传入attribute
	 * 的name和description, 同时使attribute 与当前模板以及其子节点全部关联
	 */
	public String saveAttributeUseAJAX() {
		try {
			if(getTid() != 0 ){
				catalogueService.saveSingleAttribute(model, getTid());
				inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
			}else{
				inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
			}
		} catch (UnsupportedEncodingException e) {
		}
		return "ajax-success";
	}

}
