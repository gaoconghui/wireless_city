package com.whut.wxcs.resmanager.struts.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.whut.wxcs.resmanager.model.Catalogue;
import com.whut.wxcs.resmanager.model.Provider;
import com.whut.wxcs.resmanager.model.Resource;
import com.whut.wxcs.resmanager.model.ResourceAttribute;
import com.whut.wxcs.resmanager.model.Template;
import com.whut.wxcs.resmanager.service.CatalogueService;
import com.whut.wxcs.resmanager.service.ResourceService;
import com.whut.wxcs.resmanager.struts2.ProviderAware;

@Controller
@Scope("prototype")
public class AddResourceAction extends BaseAction<Resource> implements
		ProviderAware, SessionAware {

	private static final long serialVersionUID = 1L;
	@javax.annotation.Resource
	private CatalogueService catalogueService;
	private int cid;
	private Template template;
	private List<Catalogue> catalogues;
	private List<Resource> resources;
	private Resource model = new Resource();
	@javax.annotation.Resource
	private ResourceService resourceService;
	private Map<String, Object> session;

	private int rid;

	private Provider provider = new Provider();

	private InputStream inputStream;

	private List<ResourceAttribute> resourceAttrs = new ArrayList<ResourceAttribute>();

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public int getRid() {
		return rid;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public void setResources(List<Resource> resources) {
		this.resources = resources;
	}

	public List<Resource> getResources() {
		return resources;
	}

	public List<ResourceAttribute> getResourceAttrs() {
		return resourceAttrs;
	}

	public void setResourceAttrs(List<ResourceAttribute> resourceAttrs) {
		this.resourceAttrs = resourceAttrs;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public Integer getCid() {
		return cid;
	}

	public void setTemplate(Template template) {
		this.template = template;
	}

	public Template getTemplate() {
		return template;
	}

	public List<Catalogue> getCatalogues() {
		return catalogues;
	}

	public void setCatalogues(List<Catalogue> catalogues) {
		this.catalogues = catalogues;
	}

	@Override
	public Resource getModel() {
		return model;
	}

	public String toAddResource() {
		catalogues = catalogueService.getAllCatalogue();
		System.out.println(catalogues.size());
		return "toAddPage";
	}

	/**
	 * 模板属性 接受参数cid (种类的id)
	 * 
	 */
	public String showTemplate() {
		// 查询template并返回属性
		template = catalogueService.getTemplate(cid);
		System.out.println(template.getAttributes().size());
		return "template";
	}

	/**
	 * 得到服务商下的所有服务资源
	 */
	public String getAllResource() {
		System.out.println("getProviderResource方法被调用");
		resources = resourceService.getProviderResource(provider);
		return "";
	}

	/**
	 * 获得某服务商某类目下的所有服务资源
	 */
	public String getConcreteResource() {
		// 实验~~~后期删除
		session.put("cid", cid);
		// catalogues = resourceService.getChildCatalogues(cid);
		provider.setId(1);
		resources = resourceService.getCatalogueProviderResource(cid, provider);
		return "resourcePage";
	}

	/**
	 * 输入服务资源名称，检查服务资源名称的唯一性
	 */
	public String resourceNameUnique() {
		if (resourceService.isResourceNameUnique(model.getResource_name())) {
			try {
				inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		} else {
			try {
				inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		return "ajax-success";
	}

	/**
	 * 整合的时候要从session取出Provider 到时候还要修改
	 */
	public String addResource() {
		Set<ResourceAttribute> resourceAttributes = new HashSet<ResourceAttribute>(
				resourceAttrs);
		System.out.println(model.getResource_name());
		model.setAttributes(resourceAttributes);
		Catalogue catalogue = new Catalogue();
		catalogue.setId(cid);
		model.setCatalogue(catalogue);
		model.setCreate_time(new Date());
		long id = resourceService.addResource(model);
		System.out.println("---------" + id + "-----------------");
		return "addResource";
	}

	public String toShowResourcePage() {
		catalogues = catalogueService.getAllCatalogue();
		System.out.println(catalogues.size());
		return "resourcePage";
	}

	public String showResource() {
		resources = resourceService.getCatalogueProviderResource(cid, provider);
		return "";
	}

	public String deleteResource() {
		resourceService.delete(rid);
		return "delete_success";
	}

	/**
	 * 资源按照创建时间排序
	 */
	public String orderByTime() {
		int pid = 1;
		resources = resourceService.orderByTime(pid, cid);
		System.out.println("ACTION" + resources.size());
		return "order";
	}

	public String toUpdateResource() {
		model = resourceService.getResource(rid);
		for (ResourceAttribute resourceAttribute : model.getAttributes()) {
			System.out.println(resourceAttribute.getValue());
		}
		return "updatePage";
	}

	public String updateResource() {
		resourceService.updateResource(model);
		return "resourceAction";
	}

	@Override
	public void setProvider(Provider provider) {
		this.provider = provider;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

}
