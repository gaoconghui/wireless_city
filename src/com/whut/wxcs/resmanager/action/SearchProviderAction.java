package com.whut.wxcs.resmanager.action;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.whut.wxcs.resmanager.model.Page;
import com.whut.wxcs.resmanager.model.Provider;
import com.whut.wxcs.resmanager.model.web.CriteriaProvider;
import com.whut.wxcs.resmanager.service.ProviderService;
import com.whut.wxcs.resmanager.service.SearchProviderService;
import com.whut.wxcs.resmanager.util.ValidateUtil;

@Controller
@Scope("prototype")
public class SearchProviderAction extends BaseAction<CriteriaProvider>
		implements SessionAware {

	private static final long serialVersionUID = 1L;

	/*
	 * 查询标识符
	 */
	private String psid;

	public String getPsid() {
		return psid;
	}

	public void setPsid(String psid) {
		this.psid = psid;
	}

	@Resource
	private ProviderService providerService;
	@Resource
	private SearchProviderService searchProviderService;

	// 页面内基本信息
	private Page<Provider> page;

	public Page<Provider> getPage() {
		return page;
	}

	public void setPage(Page<Provider> page) {
		this.page = page;
	}

	// 用于接收session
	private Map<String, Object> sessionMap;

	/**
	 * 获得全部的provider信息，按默认方式排序，第一页，每页20个
	 */
	public String getAllProviders() {
		CriteriaProvider cr = checkpsidAndGetCR();

		this.page = searchProviderService.searchByCriteria(cr);

		System.out.println(cr);
		this.model = cr;

		return "providerlist";
	}

	/**
	 * 根据关键字进行搜索
	 */
	public String inFindByKeyWord() {
		CriteriaProvider cr = checkpsidAndGetCR();

		initPageNum(cr);

		cr.setKeyWord(model.getKeyWord());
		this.page = searchProviderService.searchByCriteria(cr);
		System.out.println(cr);
		this.model = cr;

		return "providerlist";
	}

	/**
	 * 修改排序方式
	 */
	public String changeOrder() {
		CriteriaProvider cr = checkpsidAndGetCR();

		initPageNum(cr);

		// 如果排序名称一样，则改变排序方式
		if (cr.getOrderName() == model.getOrderName()) {
			cr.setOrderSequence((cr.getOrderSequence() + 1) % 2);
		} else {
			// 如果排序名称不相同，则使用新的排序名称，且默认排序方式0
			cr.setOrderName(model.getOrderName());
			cr.setOrderSequence(0);
		}

		this.page = searchProviderService.searchByCriteria(cr);
		this.model = cr;

		System.out.println(cr);
		return "providerlist";
	}

	/**
	 * 上一页/下一页/首页/末页/到某一页
	 */
	public String changePageNo() {
		CriteriaProvider cr = checkpsidAndGetCR();
		cr.setPageNum(model.getPageNum());

		this.page = searchProviderService.searchByCriteria(cr);
		this.model = cr;

		System.out.println(cr);
		return "providerlist";
	}

	/**
	 * 修改一页显示的数量
	 */
	public String changePageSize() {
		CriteriaProvider cr = checkpsidAndGetCR();

		initPageNum(cr);

		cr.setPageSize(model.getPageSize());

		this.page = searchProviderService.searchByCriteria(cr);
		this.model = cr;

		System.out.println(cr);
		return "providerlist";
	}

	/**
	 * 在某些操作后页面页码恢复为初始值
	 */
	private void initPageNum(CriteriaProvider cr) {
		cr.setPageNum(1);
	}

	/**
	 * s 从session 中获取搜索信息，不存在则返回model
	 */
	private CriteriaProvider checkpsidAndGetCR() {
		CriteriaProvider oldcr;

		if (getPsid() != null && sessionMap.containsKey(getPsid())) {
			oldcr = (CriteriaProvider) sessionMap.get(getPsid());
			return oldcr;
		} else {
			this.psid = System.nanoTime() + "";
			sessionMap.put(getPsid(), model);
			return model;
		}
	}

	/**
	 * 处理session 中的搜索信息，有的话就重置，没有则新增
	 */
	private CriteriaProvider clearAndInitRS() {
		if (ValidateUtil.isVaild(getPsid())) {
			sessionMap.remove(getPsid());
		}
		this.psid = System.nanoTime() + "";
		sessionMap.put(getPsid(), model);
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
