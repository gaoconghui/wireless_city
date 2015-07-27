package com.whut.wxcs.resmanager.action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.whut.wxcs.resmanager.model.Catalogue;
import com.whut.wxcs.resmanager.model.CriteriaResource;
import com.whut.wxcs.resmanager.model.ResourcePage;
import com.whut.wxcs.resmanager.service.CatalogueService;
import com.whut.wxcs.resmanager.service.SearchResourceService;
import com.whut.wxcs.resmanager.util.ValidateUtil;

@Controller
@Scope("prototype")
public class SearchResourceAction extends BaseAction<CriteriaResource>
		implements SessionAware {

	private static final long serialVersionUID = 1L;

	/*
	 * 查询标识符
	 */
	private String rsid;

	public void setRsid(String rsid) {
		this.rsid = rsid;
	}

	public String getRsid() {
		return rsid;
	}

	@Resource
	private CatalogueService catalogueService;
	@Resource
	private SearchResourceService searchResourceService;

	// 显示所有的类目以供选择 以后要删除
	private List<Catalogue> catalogues;

	// 数值属性Id
	private long attrId;
	// 页面选择属性 或者是数值属性的名称
	private String attrStr;
	// 页面属性标签
	private String attrLab;

	// 数值属性范围
	private String min;
	private String max;

	public void setMin(String min) {
		this.min = min;
	}

	public void setMax(String max) {
		this.max = max;
	}

	// 页面内基本信息
	private ResourcePage page;

	public ResourcePage getPage() {
		return page;
	}

	public void setPage(ResourcePage page) {
		this.page = page;
	}

	public void setAttrId(long attrId) {
		this.attrId = attrId;
	}

	public void setAttrLab(String attrLab) {
		this.attrLab = attrLab;
	}

	public void setAttrStr(String attrStr) {
		this.attrStr = attrStr;
	}

	// 用于接收session
	private Map<String, Object> sessionMap;

	public List<Catalogue> getCatalogues() {
		return catalogues;
	}

	/**
	 * 列出所有的catalogue 以后是要删除的
	 */
	public String listAllCatalogue() {
		this.catalogues = catalogueService.getAllCatalogue();
		return "listCatalogue";
	}

	/**
	 * 根据传入的参数查询出资源 , 根据类目查询资源，不管是什么情况下，都是新建一个搜索，重置rsid
	 */
	public String searchResourceByCatalogue() {

		clearAndInitRS();

		this.page = searchResourceService.searchByCriteria(model);

		System.out.println(model);

		return "resourcelist";
	}

	/**
	 * 在已经有搜索内容的情况下，根据关键字进行搜索
	 */
	public String inFindByKeyWord() {
		CriteriaResource cr = checkRsidAndGetCR();

		initPageNum(cr);

		cr.setKeyWord(model.getKeyWord());
		this.page = searchResourceService.searchByCriteria(cr);
		System.out.println(cr);
		this.model = cr;

		return "resourcelist";
	}

	/**
	 * 修改排序方式
	 */
	public String changeOrder() {
		CriteriaResource cr = checkRsidAndGetCR();

		initPageNum(cr);

		// 如果排序名称一样，则改变排序方式
		if (cr.getOrderName() == model.getOrderName()) {
			cr.setOrderSequence((cr.getOrderSequence() + 1) % 2);
		} else {
			// 如果排序名称不相同，则使用新的排序名称，且默认排序方式1
			cr.setOrderName(model.getOrderName());
			cr.setOrderSequence(1);
		}

		this.page = searchResourceService.searchByCriteria(cr);
		this.model = cr;

		System.out.println(cr);
		return "resourcelist";
	}

	/**
	 * 上一页/下一页/首页/末页/到某一页
	 */
	public String changePageNo() {
		CriteriaResource cr = checkRsidAndGetCR();
		cr.setPageNum(model.getPageNum());

		this.page = searchResourceService.searchByCriteria(cr);
		this.model = cr;

		System.out.println(cr);
		return "resourcelist";
	}

	/**
	 * 修改一页显示的数量
	 */
	public String changePageSize() {
		CriteriaResource cr = checkRsidAndGetCR();

		initPageNum(cr);

		cr.setPageSize(model.getPageSize());

		this.page = searchResourceService.searchByCriteria(cr);
		this.model = cr;

		System.out.println(cr);
		return "resourcelist";
	}

	/**
	 * 增加属性筛选
	 */
	public String handleAttribute() {
		CriteriaResource cr = checkRsidAndGetCR();

		initPageNum(cr);

		if (cr.getAttrMap().containsKey(attrStr)) {
			cr.getAttrMap().remove(attrStr);
		} else {
			try {
				for (String attributeStr : cr.getAttrMap().keySet()) {
					if (attributeStr.startsWith(attrStr.substring(0,
							attrStr.indexOf("_") + 1))) {
						cr.getAttrMap().remove(attributeStr);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			cr.getAttrMap().put(attrStr, attrLab);
		}

		this.page = searchResourceService.searchByCriteria(cr);
		this.model = cr;

		System.out.println(cr);

		return "resourcelist";
	}

	/**
	 * 增加数值属性筛选
	 */
	public String handleNumAttribute() {
		CriteriaResource cr = checkRsidAndGetCR();

		String numAttrParam = attrStr + "_" + min + "_" + max;
		cr.getNumMap().put(attrId, numAttrParam);

		this.page = searchResourceService.searchByCriteria(cr);
		this.model = cr;

		System.out.println(cr);

		return "resourcelist";
	}

	/**
	 * 全局搜索
	 */
	public String frontFindByKeyWord() {

		CriteriaResource cr = clearAndInitRS();

		this.page = searchResourceService.searchByCriteria(cr);
		System.out.println(cr);

		return "resourcelist";
	}

	/**
	 * 在某些操作后页面页码恢复为初始值
	 */
	private void initPageNum(CriteriaResource cr) {
		cr.setPageNum(1);
	}

	/**
	 * 从session 中获取搜索信息，不存在则返回model
	 */
	private CriteriaResource checkRsidAndGetCR() {
		CriteriaResource oldcr = null ;
		if (sessionMap.containsKey(getRsid())) {
			oldcr = (CriteriaResource) sessionMap.get(getRsid());
		}
		if (oldcr != null) {
			return oldcr;
		} else {
			this.rsid = System.nanoTime() + "";
			sessionMap.put(getRsid(), model);
			return model;
		}
	}

	/**
	 * 处理session 中的搜索信息，有的话就重置，没有则新增
	 * 
	 * @return
	 */
	private CriteriaResource clearAndInitRS() {
		if (ValidateUtil.isVaild(getRsid())) {
			sessionMap.remove(getRsid());
		}
		this.rsid = System.nanoTime() + "";
		sessionMap.put(getRsid(), model);
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
