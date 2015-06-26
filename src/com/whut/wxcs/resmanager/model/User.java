package com.whut.wxcs.resmanager.model;

import java.util.Date;

/**
 * 
 * @author apple 字段名 类型 长度 约束条件 允许空 注释 id bigint 32 主键 否 用户ID name varchar 60 否
 *         用户名 LoginPwd varchar 60 否 登录密码 PayPwd varchar 60 否 支付密码 RealName
 *         varchar 60 否 真实姓名 PhoneNumber varchar 60 否 手机号码 Email varchar 60 是
 *         绑定邮箱 LastLoginTime datetime 否 登录时间 LastLoginPlace varchar 20 否 登录地点
 *         LoginTimes int 否 登录次数 RegisterTime datetime 否 注册时间
 *
 */
public class User {

	private long id;
	private String name;

	// 后期密码需要加密
	private String loginPwd;
	private String payPwd;
	private String realName;
	private String phoneNumber;
	private String email;
	private Date lastLoginTime;
	private String lastLoginPlace;
	private int loginTimes;
	private Date registerTime = new Date();

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLoginPwd() {
		return loginPwd;
	}

	public void setLoginPwd(String loginPwd) {
		this.loginPwd = loginPwd;
	}

	public String getPayPwd() {
		return payPwd;
	}

	public void setPayPwd(String payPwd) {
		this.payPwd = payPwd;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	public String getLastLoginPlace() {
		return lastLoginPlace;
	}

	public void setLastLoginPlace(String lastLoginPlace) {
		this.lastLoginPlace = lastLoginPlace;
	}

	public int getLoginTimes() {
		return loginTimes;
	}

	public void setLoginTimes(int loginTimes) {
		this.loginTimes = loginTimes;
	}

	public Date getRegisterTime() {
		return registerTime;
	}

	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}

	@Override
	public String toString() {
		return "Users [id=" + id + ", name=" + name + ", loginPwd=" + loginPwd
				+ ", payPwd=" + payPwd + ", realName=" + realName
				+ ", phoneNumber=" + phoneNumber + ", email=" + email
				+ ", lastLoginTime=" + lastLoginTime + ", lastLoginPlace="
				+ lastLoginPlace + ", loginTimes=" + loginTimes
				+ ", registerTime=" + registerTime + "]";
	}

}
