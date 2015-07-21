package com.whut.wxcs.resmanager.struts.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.whut.wxcs.resmanager.action.BaseAction;
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
	private InputStream inputStream;

	public InputStream getInputStream() {
		return inputStream;
	}

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

	/*
	 * @Override public void validate() { if (!userService.isLogin(user)) {
	 * addActionError("用户名密码错误，请重新输入"); return; }
	 * 
	 * }
	 */

	public String login() {
		System.out.println(user.getName());
		System.out.println(user.getLoginPwd());
		if (!userService.isLogin(user)) {
			try {
				inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		} else {
			user = userService.findUserByName(user.getName());
			user.setLoginTimes(user.getLoginTimes() + 1);
			user.setLastLoginTime(new Date());
			userService.saveOrUpdateEntity(user);
			session.put("user", user);
			try {
				inputStream = new ByteArrayInputStream((user.getId()+"").getBytes("UTF-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		return "ajax-success";
	}

	public String exit() {
		session.remove("user");
		try {
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "ajax-success";
	}

}
