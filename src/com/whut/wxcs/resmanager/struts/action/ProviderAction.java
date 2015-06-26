package com.whut.wxcs.resmanager.struts.action;

import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.interceptor.validation.SkipValidation;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.whut.wxcs.resmanager.model.Provider;
import com.whut.wxcs.resmanager.service.ProviderService;
import com.whut.wxcs.resmanager.util.DataUtils;
import com.whut.wxcs.resmanager.util.ValidateUtil;

@Controller
@Scope("prototype")
public class ProviderAction extends BaseAction<Provider> implements
		SessionAware {

	private static final long serialVersionUID = 1L;

	@Resource
	private ProviderService providerService;
	private Provider provider = new Provider();
	private String confirmPwd;
	private Map<String, Object> session;

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
	@Override
	public void validate() {
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
		if (!ValidateUtil.isVaild(provider.getEnail())) {
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
	 * 服务商登陆
	 */
	@SkipValidation
	public String login() {
		if (providerService.isLogin(provider)) {
			provider = providerService.getProviderByloginName(provider
					.getLoginName());
			session.put("provider", provider);
			return "loginSuccess";
		} else {
			addActionError("账号密码错误");
			return "login_fail";
		}
	}

	/**
	 * 服务商注册
	 */
	public String reg() {
		provider.setRegisterTime(new Date());
		provider.setLoginPwd(DataUtils.MD5(provider.getLoginPwd()));
		providerService.saveEntity(provider);
		return "reg";
	}

	/**
	 * 跳转到服务商注册页面
	 */
	@SkipValidation
	public String toRegPage() {
		return "provider_regPage";
	}

	/**
	 * 跳转到服务商登陆页面
	 */
	@SkipValidation
	public String toLoginPage() {
		return "provider_loginPage";
	}

}