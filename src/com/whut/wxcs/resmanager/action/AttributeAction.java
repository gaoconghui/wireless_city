 package com.whut.wxcs.resmanager.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.apache.struts2.interceptor.ParameterAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.google.gson.Gson;
import com.whut.wxcs.resmanager.model.Attribute;
import com.whut.wxcs.resmanager.service.CatalogueService;
import com.whut.wxcs.resmanager.util.ValidateUtil;

@Controller
@Scope("prototype")
public class AttributeAction extends BaseAction<Attribute> implements
		ParameterAware {

	private static final long serialVersionUID = -3611810669887247642L;

	@Resource
	private CatalogueService catalogueService;

	private InputStream inputStream;

	List<Attribute> attributes = new ArrayList<Attribute>();

	public List<Attribute> getAttributes() {
		return attributes;
	}

	public void setAttributes(List<Attribute> attributes) {
		this.attributes = attributes;
	}

	// template 的id
	private long tid;

	// 用于接收传入的参数
	private Map<String, String[]> paramMap;

	public void setTid(long tid) {
		this.tid = tid;
	}

	public long getTid() {
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
		} catch (Exception e) {
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
		} catch (Exception e) {
		}
		return "ajax-success";
	}

	/*
	 * AJAX添加Attribute,传入template的id（即catalogue的id）,传入attribute
	 * 的name和description, 同时使attribute 与当前模板以及其子节点全部关联
	 */
	public String saveAttributeUseAJAX() {
		try {
			if (getTid() != 0) {
				catalogueService.saveSingleAttribute(model, getTid());
				inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
			} else {
				inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
			}
		} catch (Exception e) {
		}
		return "ajax-success";
	}

	/*
	 */
	public String testAJAX() {
		try {
			for (Entry<String, String[]> entry : paramMap.entrySet()) {
				System.out.println(entry.getKey() + ":"
						+ Arrays.asList(entry.getValue()));
			}
			System.out.println(getTid());
			System.out.println(attributes);
			inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
		} catch (Exception e) {
		}
		return "ajax-success";
	}

	/*
	 * 对属性进行更新/添加/删除操作
	 */
	public String doAttributesByAJAX() {
		try {
			if (ValidateUtil.isVaild(attributes)) {
				for (Attribute attribute : attributes) {
					// 删除操作
					if (attribute.getId() < 0) {
						// name里存着id值
						catalogueService.deleteAttribute(tid,
								-attribute.getId());
					} else if (attribute.getId() == 0) {
						// 添加操作
						catalogueService.saveSingleAttribute(attribute, tid);
						;
					} else if (attribute.getId() > 0) {
						// 更新操作
						catalogueService.updateAttribute(attribute);
					}
				}
			}

			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		} catch (Exception e) {
			try {
				inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		return "ajax-success";
	}

	/*
	 * 根据模板id 或者类目id 获取所有的attribute
	 */
	public String getAttributesByAJAX() {
		try {
			attributes = catalogueService.getAttributesByTid(tid);
			if (ValidateUtil.isVaild(attributes)) {
				Gson gson = new Gson();
				String str = gson.toJson(attributes);
				inputStream = new ByteArrayInputStream(str.getBytes("UTF-8"));
				}else{
					inputStream = new ByteArrayInputStream("[]".getBytes("UTF-8"));
				}
		} catch (Exception e) {
			e.printStackTrace();
			try {
				inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
		return "ajax-success";
	}

	@Override
	public void setParameters(Map<String, String[]> arg0) {
		this.paramMap = arg0;
	}

}
