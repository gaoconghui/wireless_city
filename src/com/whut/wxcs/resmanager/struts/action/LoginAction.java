package com.whut.wxcs.resmanager.struts.action;

import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.interceptor.validation.SkipValidation;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.whut.wxcs.resmanager.model.User;
import com.whut.wxcs.resmanager.service.UserService;

@Controller
@Scope("prototype")
public class LoginAction extends BaseAction<User> implements SessionAware {

	private static final long serialVersionUID = 1L;

	private User user = new User();
	@Resource
	private UserService userService;
	private Map<String, Object> session;
	private int type;

	public void setType(int type) {
		this.type = type;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	@Override
	public User getModel() {
		return user;
	}

	@Override
	public void validate() {
		if (type == 1) {
			if (!userService.isLogin(user)) {
				addActionError("用户名密码错误，请重新输入");
				return;
			}
		}
		if (type == 2) {

		}
	}

	public String login() {
		if (type == 1) {
			user = userService.findUserByName(user.getName());
			user.setLoginTimes(user.getLoginTimes() + 1);
			user.setLastLoginTime(new Date());
			userService.saveOrUpdateEntity(user);
			session.put("user", user);
		}
		if (type == 0) {

		}
		return SUCCESS;
	}

	@SkipValidation
	public String exit() {
		session.remove("user");
		return "exit";
	}

}
