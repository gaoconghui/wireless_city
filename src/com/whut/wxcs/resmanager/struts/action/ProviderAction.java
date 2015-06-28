package com.whut.wxcs.resmanager.struts.action;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.whut.wxcs.resmanager.model.Catalogue;
import com.whut.wxcs.resmanager.model.Provider;
import com.whut.wxcs.resmanager.service.CatalogueService;
import com.whut.wxcs.resmanager.service.ProviderService;
import com.whut.wxcs.resmanager.util.DataUtils;
import com.whut.wxcs.resmanager.util.ValidateUtil;

@Controller
@Scope("prototype")
public class ProviderAction extends BaseAction<Provider> implements
		SessionAware{

	private static final long serialVersionUID = 1L;

	@Resource
	private ProviderService providerService;
	@Resource
	private CatalogueService catalogueService;
	private Provider provider = new Provider();
	private String confirmPwd;
	private Map<String, Object> session;
	private Catalogue catalogue;

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

	public void setConfirmPwd(String confirmPwd) {
		this.confirmPwd = confirmPwd;
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
	 * 验证
	 */
	public void validateReg() {
		if (!ValidateUtil.isVaild(provider.getName())) {
			addFieldError("name", "服务商名称不能位空");
		}
		if (!ValidateUtil.isVaild(provider.getLoginName())) {
			addFieldError("loginName", "登陆账号不能位空");
		}
		if (!ValidateUtil.isVaild(provider.getLoginPwd())) {
			addFieldError("loginPwd", "密码不能位空");
		}
		if (!ValidateUtil.isVaild(provider.getTelephone())) {
			addFieldError("phoneNumber", "联系电话不能为空");
		}
		if (!ValidateUtil.isVaild(provider.getEmail())) {
			addFieldError("email", "邮箱账号不能位空");
		}
		if (hasErrors()) {
			return;
		}
		if (!ValidateUtil.phoneNumberValid(provider.getTelephone())) {
			addFieldError("phoneNumber", "请输入正确的手机号码");
			return;
		}
		if (!provider.getLoginPwd().equals(confirmPwd)) {
			addFieldError("confirmPassword", "密码必须一致");
			return;
		}
		if (providerService.isLoginNameExit(provider.getLoginName())) {
			addFieldError("loginName", "该账号已存在");
			return;
		}
	}

	/**
	 * 服务商登陆,并验证
	 */
	public String login() {
		provider = providerService.isLogin(provider);
		if (provider == null) {
			addActionError("账户名密码错误");
			return "login_fail";
		}
		if (provider.getCheckState() == 2) {
			addActionError("账户正在审核");
			return "login_fail";
		}
		if (provider.getCheckState() == 0) {
			addActionError("审核未通过");
			return "login_fail";
		}
		session.put("provider", provider);
		return "loginSuccess";

	}

	/**
	 * 服务商注册,并审核
	 */
	public String reg() {
		provider.setRegisterTime(new Date());
		provider.setLoginPwd(DataUtils.MD5(provider.getLoginPwd()));
		provider.setCheckState(2);
		providerService.saveEntity(provider);
		return "reg";
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
	 * 服务商审核通过页面
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
		return "pass_check";
	}




}