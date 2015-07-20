package com.whut.wxcs.resmanager.struts.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.whut.wxcs.resmanager.model.Catalogue;
import com.whut.wxcs.resmanager.model.CriteriaResource;
import com.whut.wxcs.resmanager.model.Provider;
import com.whut.wxcs.resmanager.model.Resource;
import com.whut.wxcs.resmanager.model.ResourcePage;
import com.whut.wxcs.resmanager.service.CatalogueService;
import com.whut.wxcs.resmanager.service.ResourceService;
import com.whut.wxcs.resmanager.struts2.ProviderAware;
import com.whut.wxcs.resmanager.util.ValidateUtil;

@Controller
@Scope("prototype")
public class SearchProviderResourceAction extends BaseAction<CriteriaResource>
		implements SessionAware, ProviderAware {

	private static final long serialVersionUID = 1L;

	private CriteriaResource model = new CriteriaResource();

	private List<Resource> resources;
	private ResourcePage page;

	private List<Catalogue> catalogues;
	// 融合时进行权限控制的时候注入
	private Provider provider;

	private Map<String, Object> session;
	@javax.annotation.Resource
	private ResourceService resourceService;
	@javax.annotation.Resource
	private CatalogueService catalogueService;

	// 页面选择属性
	private String attrStr;
	// 页面属性标签
	private String attrLab;

	public String getAttrStr() {
		return attrStr;
	}

	public void setAttrStr(String attrStr) {
		this.attrStr = attrStr;
	}

	public String getAttrLab() {
		return attrLab;
	}

	public void setAttrLab(String attrLab) {
		this.attrLab = attrLab;
	}

	private String rsid;

	public void setPage(ResourcePage page) {
		this.page = page;
	}

	public ResourcePage getPage() {
		return page;
	}

	public void setCatalogues(List<Catalogue> catalogues) {
		this.catalogues = catalogues;
	}

	public List<Catalogue> getCatalogues() {
		return catalogues;
	}

	public List<Resource> getResources() {
		return resources;
	}

	public void setResources(List<Resource> resources) {
		this.resources = resources;
	}

	public void setRsid(String rsid) {
		this.rsid = rsid;
	}

	public String getRsid() {
		return rsid;
	}

	@Override
	public CriteriaResource getModel() {
		return model;
	}

	/**
	 * 根据属性搜索
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
		int pid = 1;// TODO
		page = resourceService.searchByCriteria(pid, cr);
		model = cr;
		System.out.println(page);

		return "resource";
	}

	// 初始化页码为1
	private void initPageNum(CriteriaResource cr) {
		cr.setPageNum(1);
	}

	/**
	 * 根据类目搜索 根据类目搜索不管在任何情况下，都要将session中的搜索信息重置
	 */
	public String searchResourceBycatalogue() {
		clearAndInitRS();
		CriteriaResource cr = checkRsidAndGetCR();
		int pid = 1;// 后期改为provider.getId()
		page = resourceService.searchByCriteria(pid, cr);
		model = cr;
		/*
		 * System.out.println(page.getCatalogue().getParent().getChild().size());
		 */
		return "resource";
	}

	/**
	 * 根据全局关键字搜索:重置搜索条件
	 */
	public String keyWordSearch() {
		clearAndInitRS();
		int pid = 1;// 后期改为provider.getId()
		page = resourceService.searchByCriteria(pid, model);
		System.out.println("------------" + model.getFrontKey());
		// System.out.println("------------" + resources.size());
		return "resource";
	}

	/**
	 * 在已有筛选内容的情况下，关键词搜索
	 */
	public String nextKeyWordSearch() {
		CriteriaResource cr = checkRsidAndGetCR();
		int pid = 1;// 后期改为provider.getId()
		cr.setKeyWord(model.getKeyWord());
		System.out.println(cr.getKeyWord());
		System.out.println(cr.getCatalogueId());
		page = resourceService.searchByCriteria(pid, cr);
		return "resource";
	}

	/**
	 * 分页查询，带条件或者不带的分页查询
	 */
	public String changePageNo() {
		CriteriaResource cr = checkRsidAndGetCR();
		int pid = 1;// 后期改为provider.getId()
		cr.setPageNum(model.getPageNum());
		page = resourceService.searchByCriteria(pid, cr);

		return "resource";
	}

	/**
	 * 通过服务资源的审核状态查询
	 */
	public String changeState() {
		CriteriaResource cr = checkRsidAndGetCR();
		int pid = 1;// TODO
		cr.setState(cr.getState() + 1);
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+cr.getState());
		if (cr.getState() > 2) {
			cr.setState(cr.getState() - 3);
		}
		resourceService.searchByCriteria(pid, cr);
		return "resource";
	}

	/**
	 * 改变排序方式
	 */
	public String changeOrder() {
		CriteriaResource cr = checkRsidAndGetCR();
		// 名字一样，改变排序方式
		if (model.getOrderName() == cr.getOrderName()) {
			cr.setOrderSequence((cr.getOrderSequence() + 1) % 2);
		} else {
			cr.setOrderName(model.getOrderName());
			cr.setOrderSequence(1);
		}
		int pid = 1;// 后期改为provider.getId();
		page = resourceService.searchByCriteria(pid, cr);
		return "resource";
	}

	/**
	 * 从session 中获取搜索信息，不存在则返回model
	 */
	private CriteriaResource checkRsidAndGetCR() {
		CriteriaResource oldcr = (CriteriaResource) session.get(getRsid());
		if (oldcr != null) {
			return oldcr;
		} else {
			this.rsid = System.nanoTime() + "";
			session.put(getRsid(), model);
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
			session.remove(getRsid());
		}
		this.rsid = System.nanoTime() + "";
		session.put(getRsid(), model);
		return model;
	}

	/**
	 * 接受session
	 */
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	@Override
	public void setProvider(Provider provider) {
		this.provider = provider;
	}

}
