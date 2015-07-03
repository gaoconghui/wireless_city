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
import com.whut.wxcs.resmanager.model.Catalogue;
import com.whut.wxcs.resmanager.service.CatalogueService;
import com.whut.wxcs.resmanager.util.ValidateUtil;

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

	private List<Catalogue> childCatalogues;

	private long parentid;

	private Catalogue root;

	public void setChildCatalogues(List<Catalogue> childCatalogues) {
		this.childCatalogues = childCatalogues;
	}

	public List<Catalogue> getChildCatalogues() {
		return childCatalogues;
	}

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
	public String addCatalogue() {
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
	 * 获取根目录的AJAX
	 */
	public String getRootCatalogueByAJAX() {

		try {
			rootCatalogues = catalogueService.getRootCatalogue();
			for (Catalogue c : rootCatalogues) {
				c.setChild(null);
				c.setTemplate(null);
				c.setParent(null);
			}
			Gson gson = new Gson();
			String str = gson.toJson(rootCatalogues);
			inputStream = new ByteArrayInputStream(str.getBytes("UTF-8"));
		} catch (Exception e) {
			try {
				inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
			} catch (Exception e1) {}
		}
		return "ajax-success";
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
		} catch (Exception e) {
			try {
				inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
			} catch (Exception e1) {}
		}
		return "ajax-success";
	}

	/*
	 * AJAX 增加一个新的类目
	 */
	public String addCatalogueByAJAX() {

		try {
			
			Catalogue parent = new Catalogue();
			parent.setId(parentid);
			model.setParent(parent);
			String newid = catalogueService.saveCatalogue(model) + "";

			inputStream = new ByteArrayInputStream(newid.getBytes("UTF-8"));
		} catch (Exception e) {
			e.printStackTrace();
			try {
				inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
			} catch (Exception e1) {}
		}
		return "ajax-success";
	}

	/*
	 * AJAX 删除一个类目
	 */
	public String deleteCatalogueByAJAX() {

		try {
			catalogueService.deleteCatalogueWithChild(model.getId());
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		} catch (Exception e) {
			try {
				inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
			} catch (Exception e1) {}
		}
		return "ajax-success";
	}

	/*
	 * AJAX 获取一个类目详情（name 和description） 传入id
	 */
	public String getCatalogueDetailByAJAX() {

		try {
			model = catalogueService.getEntity(model.getId());
			
			Map<String,String> map = new HashMap<String, String>();
			map.put("id", model.getId()+"");
			map.put("description", model.getDescription());
			map.put("name", model.getName());
			
			Gson gson = new Gson();
			String str = gson.toJson(map);
			if (ValidateUtil.isVaild(str)) {
				inputStream = new ByteArrayInputStream(str.getBytes("UTF-8"));
			}else{
				inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
			}
		} catch (Exception e) {
			try {
				inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
			} catch (Exception e1) {}
		}
		return "ajax-success";
	}

	/*
	 * AJAX 更新一个类目（name 和description） 传入id name desctiption
	 */
	public String UpdateCataloguelByAJAX() {

		try {
			catalogueService.updateCatalogue(model);
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		} catch (Exception e) {
			try {
				inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
			} catch (Exception e1) {}
		}
		return "ajax-success";
	}

	/**
	 * 跳转到增加资源的页面 通过JS 来选择类目
	 */
	public String toAddResourcePage() {
		rootCatalogues = catalogueService.getRootCatalogue();
		return "add_resource";
	}

	/**
	 * 获得子目录
	 */
	public String chooseChild() {
		System.out.println(parentid);
		childCatalogues = catalogueService
				.getChildCatalogueByParentId(parentid);
		return "add_resource";
	}
}
