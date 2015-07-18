package com.whut.wxcs.resmanager.struts.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.whut.wxcs.resmanager.model.Catalogue;
import com.whut.wxcs.resmanager.model.Provider;
import com.whut.wxcs.resmanager.model.Resource;
import com.whut.wxcs.resmanager.service.CatalogueService;
import com.whut.wxcs.resmanager.service.ProviderService;
import com.whut.wxcs.resmanager.service.ResourceService;
import com.whut.wxcs.resmanager.util.DataUtils;

@Controller
@Scope("prototype")
public class ProviderAction extends BaseAction<Provider> implements
		SessionAware {

	private static final long serialVersionUID = 1L;

	@javax.annotation.Resource
	private ProviderService providerService;
	@javax.annotation.Resource
	private ResourceService resourceService;
	@javax.annotation.Resource
	private CatalogueService catalogueService;
	private InputStream inputStream;
	private Provider provider=new Provider();
	private Map<String, Object> session;
	private Catalogue catalogue;
	private List<Resource> resources;
	private List<Catalogue> catalogues;

	// providerList 页面中，对服务商执行操作后转发psid，重定向时使用
	private long psid;

	public long getPsid() {
		return psid;
	}

	public void setPsid(long psid) {
		this.psid = psid;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setCatalogue(Catalogue catalogue) {
		this.catalogue = catalogue;
	}

	public Catalogue getCatalogue() {
		return catalogue;
	}

	/**
	 * 判断获取的的服务商审核状态 1--审核的服务商 2-未审核的服务商
	 */
	private int state;

	public void setState(int state) {
		this.state = state;
	}

	public int getState() {
		return state;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	@Override
	public Provider getModel() {
		return provider;
	}

	/**
	 * 服务商登陆,并验证
	 */
	public String login() {
		System.out.println("11111111111111111111");
		provider = providerService.isLogin(provider);
		if (provider == null) {
			try {
				inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			//zhengzai shenhe 
		}else if (provider.getCheckState() == 2) {
			try {
				inputStream = new ByteArrayInputStream("2".getBytes("UTF-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		else if (provider.getCheckState() == 0) {
		//wei tong guo 
			try {
				inputStream = new ByteArrayInputStream("3".getBytes("UTF-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		else if (provider.getCheckState() == 1) {
			session.put("provider", provider);
			resources = resourceService.getProviderResource(provider);
			catalogues = resourceService.getProviderCatalogue(resources);
			for (Catalogue catalogue : catalogues) {
				System.out.println(catalogue.getName());
			}
			try {
				inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));

			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		return "ajax-success";

	}

	/**
	 * 验证服务商登陆账号
	 */
	public String validateProvider() {
		if (providerService.isLoginNameExit(provider.getLoginName())) {
			try {
				inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		} else {
			try {
				inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		return "ajax-success";
	}

	/**
	 * 服务商注册,并审核
	 */
	public String reg() {
		provider.setRegisterTime(new Date());
		provider.setLoginPwd(DataUtils.MD5(provider.getLoginPwd()));
		provider.setCheckState(2);
		providerService.saveEntity(provider);
		try {
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "ajax-success";
	}

	/**
	 * 跳转到服务商注册页面
	 */
	public String toRegPage() {
		return "provider_regPage";
	}

	/**
	 * 跳转到服务商登陆页面
	 */
	public String toLoginPage() {
		return "provider_loginPage";
	}

	/**
	 * 服务商管理页面
	 */
	public String manager() {
		List<Provider> providers;
		if (state == 1) {
			providers = providerService.getCheckedProviders();
			session.put("providers", providers);
			System.out.println(providers.size());
		}
		if (state == 2) {
			providers = providerService.getUncheckedProviders();
			System.out.println(providers.size());
			session.put("providers", providers);
		}
		return "provider_manager";
	}

	/**
	 * 使服务商账号通过审核
	 */
	public String passCheck() {
		System.out.println(provider.getId());
		provider = providerService.getEntity(provider.getId());
		provider.setCheckState(1);
		providerService.saveOrUpdateEntity(provider);
		return "providerListAction";
	}

	/**
	 * 使服务商账号下架
	 */
	public String offCheck() {
		System.out.println(provider.getId());
		provider = providerService.getEntity(provider.getId());
		provider.setCheckState(0);
		providerService.saveOrUpdateEntity(provider);
		return "providerListAction";
	}

}