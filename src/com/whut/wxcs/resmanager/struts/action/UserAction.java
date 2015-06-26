package com.whut.wxcs.resmanager.struts.action;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.whut.wxcs.resmanager.model.User;
import com.whut.wxcs.resmanager.service.UserService;

@Controller
@Scope("prototype")
public class UserAction extends BaseAction<User> {

	private static final long serialVersionUID = 1L;
	@Resource
	private UserService userService;
	private User user;
	private long param_id;

	public void setParam_id(long param_id) {
		this.param_id = param_id;
	}

	@Override
	public User getModel() {
		user = userService.getUserById(param_id);
		return user;
	}

	public String info() {
		return "user_info";
	}

}
