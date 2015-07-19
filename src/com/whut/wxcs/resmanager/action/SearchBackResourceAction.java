package com.whut.wxcs.resmanager.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.whut.wxcs.resmanager.model.Page;
import com.whut.wxcs.resmanager.model.Resource;
import com.whut.wxcs.resmanager.model.web.CriteriaBackResource;
import com.whut.wxcs.resmanager.service.ResourceService;
import com.whut.wxcs.resmanager.service.SearchBackResourceService;
import com.whut.wxcs.resmanager.util.ValidateUtil;

@Controller
@Scope("prototype")
public class SearchBackResourceAction extends BaseAction<CriteriaBackResource>
		implements SessionAware {

	private static final long serialVersionUID = 1L;

	/*
	 * 查询标识符
	 */
	private String brsid;


	public String getBrsid() {
		return brsid;
	}

	public void setBrsid(String brsid) {
		this.brsid = brsid;
	}

	@javax.annotation.Resource
	private ResourceService resourceService;
	@javax.annotation.Resource
	private SearchBackResourceService searchBackResourceService;

	// 页面内基本信息
	private Page<Resource> page;

	public Page<Resource> getPage() {
		return page;
	}

	public void setPage(Page<Resource> page) {
		this.page = page;
	}

	// 用于接收session
	private Map<String, Object> sessionMap;

	/**
	 * 获得全部的resource信息，按默认方式排序，第一页，每页20个
	 */
	public String getAllResources() {
		CriteriaBackResource cr = checkbrsidAndGetCR();

		this.page = searchBackResourceService.searchByCriteria(cr);

		System.out.println(cr);
		this.model = cr;

		return "resourcelist";
	}

	/**
	 * 根据关键字进行搜索
	 */
	public String inFindByKeyWord() {
		CriteriaBackResource cr = checkbrsidAndGetCR();

		initPageNum(cr);

		cr.setKeyWord(model.getKeyWord());
		this.page = searchBackResourceService.searchByCriteria(cr);
		System.out.println(cr);
		this.model = cr;

		return "resourcelist";
	}

	/**
	 * 修改排序方式
	 */
	public String changeOrder() {
		CriteriaBackResource cr = checkbrsidAndGetCR();

		initPageNum(cr);

		// 如果排序名称一样，则改变排序方式
		if (cr.getOrderName() == model.getOrderName()) {
			cr.setOrderSequence((cr.getOrderSequence() + 1) % 2);
		} else {
			// 如果排序名称不相同，则使用新的排序名称，且默认排序方式0
			cr.setOrderName(model.getOrderName());
			cr.setOrderSequence(0);
		}

		this.page = searchBackResourceService.searchByCriteria(cr);
		this.model = cr;

		System.out.println(cr);
		return "resourcelist";
	}

	/**
	 * 上一页/下一页/首页/末页/到某一页
	 */
	public String changePageNo() {
		CriteriaBackResource cr = checkbrsidAndGetCR();
		cr.setPageNum(model.getPageNum());

		this.page = searchBackResourceService.searchByCriteria(cr);
		this.model = cr;

		System.out.println(cr);
		return "resourcelist";
	}

	/**
	 * 修改一页显示的数量
	 */
	public String changePageSize() {
		CriteriaBackResource cr = checkbrsidAndGetCR();

		initPageNum(cr);

		cr.setPageSize(model.getPageSize());

		this.page = searchBackResourceService.searchByCriteria(cr);
		this.model = cr;

		System.out.println(cr);
		return "resourcelist";
	}

	/**
	 * 在某些操作后页面页码恢复为初始值
	 */
	private void initPageNum(CriteriaBackResource cr) {
		cr.setPageNum(1);
	}

	/**
	 * s 从session 中获取搜索信息，不存在则返回model
	 */
	private CriteriaBackResource checkbrsidAndGetCR() {
		CriteriaBackResource oldcr;

		if (getBrsid() != null && sessionMap.containsKey(getBrsid())) {
			oldcr = (CriteriaBackResource) sessionMap.get(getBrsid());
			return oldcr;
		} else {
			this.brsid = System.nanoTime() + "";
			sessionMap.put(getBrsid(), model);
			return model;
		}
	}

	/**
	 * 处理session 中的搜索信息，有的话就重置，没有则新增
	 */
	private CriteriaBackResource clearAndInitRS() {
		if (ValidateUtil.isVaild(getBrsid())) {
			sessionMap.remove(getBrsid());
		}
		this.brsid = System.nanoTime() + "";
		sessionMap.put(getBrsid(), model);
		return model;
	}

	/*
	 * 接收session
	 */
	@Override
	public void setSession(Map<String, Object> session) {
		this.sessionMap = session;
	}

}
