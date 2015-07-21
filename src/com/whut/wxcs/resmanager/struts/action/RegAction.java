package com.whut.wxcs.resmanager.struts.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.apache.struts2.interceptor.ParameterAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.whut.wxcs.resmanager.action.BaseAction;
import com.whut.wxcs.resmanager.model.User;
import com.whut.wxcs.resmanager.service.UserService;
import com.whut.wxcs.resmanager.util.DataUtils;

@Controller
@Scope("prototype")
public class RegAction extends BaseAction<User> implements ParameterAware{

	private static final long serialVersionUID = 1L;
	@Resource
	private UserService userService;
	private User user;
	private InputStream inputStream;
	private Map<String, String[]> paramMap;

	public InputStream getInputStream() {
		return inputStream;
	}

	public User getModel() {
		user = new User();
		return user;
	}

	/**
	 * 跳转到注册页面
	 */
	public String toRegPage() {
		return "regPage";
	}

	public String validateName() {
		sysoutParam();
		System.out.println(user.getName());
		if (userService.isNameExit(user.getName())) {
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
	 * 注册
	 */
	public String doReg() {
		sysoutParam();
		System.out.println(user.getName());
		user.setLoginPwd(DataUtils.MD5(user.getLoginPwd()));
		userService.register(user);
		try {
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "ajax-success";
	}

	/**
	 * 跳转到登陆页面
	 */
	public String toLoginPage() {
		return "loginPage";
	}

	private void sysoutParam(){
		for(Entry<String, String[]> entry : paramMap.entrySet()){
			System.out.println(entry.getKey() + ":" + entry.getValue());
		}
	}
	
	@Override
	public void setParameters(Map<String, String[]> arg0) {
		this.paramMap = arg0;
	}

}
