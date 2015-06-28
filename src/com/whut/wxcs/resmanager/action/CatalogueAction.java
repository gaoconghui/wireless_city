package com.whut.wxcs.resmanager.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.google.gson.Gson;
import com.whut.wxcs.resmanager.model.Catalogue;
import com.whut.wxcs.resmanager.service.CatalogueService;

@Controller
@Scope("prototype")
public class CatalogueAction extends BaseAction<Catalogue> {

	private static final long serialVersionUID = -3611810669887247642L;

	private InputStream inputStream;

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	@Resource
	private CatalogueService catalogueService;

	private List<Catalogue> rootCatalogues;

	private long parentid;

	private Catalogue root;

	public void setParentid(long parentid) {
		this.parentid = parentid;
	}

	public long getParentid() {
		return parentid;
	}

	public Catalogue getRoot() {
		return root;
	}

	public List<Catalogue> getRootCatalogues() {
		return rootCatalogues;
	}

	/*
	 * 跳转到增加类目页面 权限验证之后再加 还要改！！！！！到时候是加入ajax，返回根目录选择
	 */
	public String toDesginCataloguePage() {
		rootCatalogues = catalogueService.getAllCatalogue();
		return "toDesignCataloguePage";
	}

	/*
	 * 执行类目添加
	 */
	public String dddCatalogue() {
		Catalogue parent = new Catalogue();
		parent.setId(parentid);
		model.setParent(parent);
		catalogueService.saveCatalogue(model);
		return "catalogueManagerAction";
	}

	/*
	 * 到类目管理页面（可能要改成只返回根目录的结构）
	 */
	public String toCatalogueManagerPage() {
		root = catalogueService.getRootCatalogueWithAllChild();
		return "toCatalogueManagerPage";
	}

	/*
	 * 删除类目以及其所有的子类目
	 */
	public String deleteCatalogue() {
		catalogueService.deleteCatalogueWithChild(model.getId());
		return "catalogueManagerAction";
	}

	/*
	 * 更新类目
	 */
	public String updateCatalogue() {
		model = catalogueService.getCatalogueById(model.getId());
		setParentid(model.getParent().getId());
		rootCatalogues = catalogueService.getAllCatalogue();
		return "toDesignCataloguePage";
	}

	/*
	 * AJAX 通过 id 获取子类目
	 */
	public String getChildUseAJAX() {

		try {
			rootCatalogues = catalogueService.getChildCatalogueByParentId(1);
			for (Catalogue c : rootCatalogues) {
				c.setChild(null);
				c.setTemplate(null);
				c.setParent(null);
			}
			Gson gson = new Gson();
			String str = gson.toJson(rootCatalogues);
			System.out.println(str);
			inputStream = new ByteArrayInputStream(str.getBytes("UTF-8"));
		} catch (UnsupportedEncodingException e) {
		}
		return "ajax-success";
	}

	/**
	 * 跳转到增加资源的页面
	 */
	public String toAddResourcePage() {
		root = catalogueService.getRootCatalogueWithAllChild();
		Set<Catalogue> catalogues = root.getChild();
		for (Catalogue c : catalogues) {
			System.out.println(c.getName());
			Set<Catalogue> catalogues2 = c.getChild();
			for (Catalogue c2 : catalogues2) {
				System.out.println(c2.getName());
			}
		}
		return "add_resource";
	}

}
