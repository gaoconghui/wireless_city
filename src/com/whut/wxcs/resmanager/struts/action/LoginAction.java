package com.whut.wxcs.resmanager.struts.action;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.whut.wxcs.resmanager.model.User;
import com.whut.wxcs.resmanager.service.UserService;

@Controller
@Scope("prototype")
public class LoginAction extends BaseAction<User> {

	private static final long serialVersionUID = 1L;

	private User user = new User();
	@Resource
	private UserService userService;

	@Override
	public User getModel() {
		return user;
	}

	@Override
	public void validate() {
		if (!userService.isLogin(user)) {
			addFieldError("login", "用户名密码错误，请重新输入");
			return;
		}
	}

	public String login() {
		return SUCCESS;
	}

}
