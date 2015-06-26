package com.whut.wxcs.resmanager.struts.action;

import javax.annotation.Resource;

import org.apache.struts2.interceptor.validation.SkipValidation;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.whut.wxcs.resmanager.model.User;
import com.whut.wxcs.resmanager.service.UserService;
import com.whut.wxcs.resmanager.util.DataUtils;
import com.whut.wxcs.resmanager.util.ValidateUtil;

@Controller
@Scope("prototype")
public class RegAction extends BaseAction<User> {

	private static final long serialVersionUID = 1L;
	@Resource
	private UserService userService;
	private User user;
	private String confirmPassword;

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public User getModel() {
		user = new User();
		return user;
	}

	/**
	 * 验证注册页面的信息
	 */
	public void validate() {
		if (!ValidateUtil.isVaild(user.getName())) {
			addFieldError("name", "昵称不能位空");
		}
		if (!ValidateUtil.isVaild(user.getLoginPwd())) {
			addFieldError("loginPwd", "密码不能位空");
		}
		if (!ValidateUtil.isVaild(user.getRealName())) {
			addFieldError("realName", "姓名不能位空");
		}
		if (!ValidateUtil.isVaild(user.getPhoneNumber())) {
			addFieldError("phoneNumber", "号码不能为空");
		}
		if (!ValidateUtil.isVaild(user.getEmail())) {
			addFieldError("email", "邮箱账号不能位空");
		}
		if (hasErrors()) {
			return;
		}
		if (!ValidateUtil.phoneNumberValid(user.getPhoneNumber())) {
			addFieldError("phoneNumber", "请输入正确的手机号码");
			return;
		}
		if (!user.getLoginPwd().equals(confirmPassword)) {
			addFieldError("confirmPassword", "密码必须一致");
			return;
		}
		if (userService.isNameExit(user.getName())) {
			addFieldError("name", "昵称已经存在");
			return;
		}
		/*
		 * if (!ValidateUtil.emailValid(user.getEmail())) {
		 * addFieldError("email", "请输入正确的邮箱"); return; }
		 */
	}

	/**
	 * 跳转到注册页面
	 */
	@SkipValidation
	public String toRegPage() {
		return "regPage";
	}

	public String doReg() {
		user.setLoginPwd(DataUtils.MD5(user.getLoginPwd()));
		userService.register(user);
		return SUCCESS;
	}

	/**
	 * 跳转到登陆页面
	 */
	@SkipValidation
	public String toLoginPage() {
		return "loginPage";
	}

}