package com.whut.wxcs.resmanager.struts.action;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;

import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.util.ServletContextAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.whut.wxcs.resmanager.action.BaseAction;
import com.whut.wxcs.resmanager.model.Catalogue;
import com.whut.wxcs.resmanager.model.Provider;
import com.whut.wxcs.resmanager.model.Resource;
import com.whut.wxcs.resmanager.model.ResourceAttribute;
import com.whut.wxcs.resmanager.model.Template;
import com.whut.wxcs.resmanager.service.CatalogueService;
import com.whut.wxcs.resmanager.service.ResourceService;
import com.whut.wxcs.resmanager.struts2.ProviderAware;
import com.whut.wxcs.resmanager.util.ValidateUtil;

@Controller
@Scope("prototype")
public class AddResourceAction extends BaseAction<Resource> implements
		ProviderAware, SessionAware, ServletContextAware {
   
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

	private Provider provider;

	private InputStream inputStream;

	private List<ResourceAttribute> resourceAttrs = new ArrayList<ResourceAttribute>();

	// 注入
	private ServletContext servletContext;
	
	private File logoPhoto;
	private String logoPhotoFileName;
	private String logoPhotoContentType;

	public File getLogoPhoto() {
		return logoPhoto;
	}

	public void setLogoPhoto(File logoPhoto) {
		this.logoPhoto = logoPhoto;
	}

	public String getLogoPhotoFileName() {
		return logoPhotoFileName;
	}

	public void setLogoPhotoFileName(String logoPhotoFileName) {
		this.logoPhotoFileName = logoPhotoFileName;
	}

	public String getLogoPhotoContentType() {
		return logoPhotoContentType;
	}

	public void setLogoPhotoContentType(String logoPhotoContentType) {
		this.logoPhotoContentType = logoPhotoContentType;
	}
	
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
	 */
	public String showTemplate() {
		System.out.println(cid);
		template = catalogueService.getTemplate(cid);
		return "template";
	}

	/**
	 * 得到某个服务商的具体资源
	 */
	public String getConcreteResource() {
		session.put("cid", cid);
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

	// 整合的时候要从session取出Provider 到时候还要修改
	public String addResource() {
		Set<ResourceAttribute> resourceAttributes = new HashSet<ResourceAttribute>(
				resourceAttrs);
		model.setAttributes(resourceAttributes);
		Catalogue catalogue = new Catalogue();
		catalogue.setId(cid);
		model.setCatalogue(catalogue);
		model.setCreate_time(new Date());
		model.setProvider(provider);
		
		long id = resourceService.addResource(model);
		resetCatalogue();
		try {
			inputStream = new ByteArrayInputStream((id + "").getBytes("UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "ajax-success";
	}
    /**
     * 修改某服务商的图片资源
     */
	public String uploadPicture() {
		if (ValidateUtil.isVaild(logoPhotoFileName)) {
			String dir = servletContext.getRealPath("/upload");
			String ext = logoPhotoFileName.substring(logoPhotoFileName
					.lastIndexOf("."));
			long l = System.nanoTime();
			File newFile = new File(dir, l + ext);
			// 文件另存为
			logoPhoto.renameTo(newFile);
			resourceService.updateResourcePicturePath(newFile.getName(),
					model.getId());
		}
		try {
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "ajax-success";
	}

	private void resetCatalogue() {
		resources = resourceService.getProviderResource(provider);
		catalogues = resourceService.getProviderCatalogue(resources);
		session.put("catalogues", catalogues);
	}

	public String toShowResourcePage() {
		catalogues = catalogueService.getAllCatalogue();
		System.out.println(catalogues.size());
		return "resourcePage";
	}

	public String deleteResource() {
		resourceService.delete(rid);
		resetCatalogue();
		try {
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "ajax-success";
	}

	/**
	 * 得到某个具体的服务资源
	 */
	public String getResource() {
		model = resourceService.getResource(model.getId());
		return "resource";
	}

	/**
	 * 到达更新资源的页面
	 */
	public String toUpdateResource() {
		model = resourceService.getResource(model.getId());
		return "updatePage";
	}

	/**
	 * 更新服务资源
	 */
	public String updateResource() {
		Set<ResourceAttribute> resourceAttributes = new HashSet<ResourceAttribute>(
				resourceAttrs);
		model.setAttributes(resourceAttributes);
		model.setCheckState(2);
		resourceService.updateResource(model);
		return "sss";
	}

	@Override
	public void setProvider(Provider provider) {
		this.provider = provider;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}

}
