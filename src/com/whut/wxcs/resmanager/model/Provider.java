package com.whut.wxcs.resmanager.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Provider {

	private Set<Resource> resources = new HashSet<Resource>();

	private long id;
	private String name;
	private String industry;
	private String scale;
	private String profile;
	private String logo;
	private String enail;
	private String fax;
	private String postcode;
	private String address;
	private Date registerTime;
	private String qq;
	private String telephone;
	private String cellphone;
	private String contects;
	private String url;
	private int grade;
	private String certificationType;
	private String loginName;
	private String loginPwd;

	public void addResource(Resource resource) {
		resources.add(resource);
	}

	public void removeResource(Resource resource) {
		if (resources.contains(resource))
			resources.remove(resource);
	}

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

	public String getIndustry() {
		return industry;
	}

	public void setIndustry(String industry) {
		this.industry = industry;
	}

	public String getScale() {
		return scale;
	}

	public void setScale(String scale) {
		this.scale = scale;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getEnail() {
		return enail;
	}

	public void setEnail(String enail) {
		this.enail = enail;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getRegisterTime() {
		return registerTime;
	}

	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getCellphone() {
		return cellphone;
	}

	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}

	public String getContects() {
		return contects;
	}

	public void setContects(String contects) {
		this.contects = contects;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getCertificationType() {
		return certificationType;
	}

	public void setCertificationType(String certificationType) {
		this.certificationType = certificationType;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getLoginPwd() {
		return loginPwd;
	}

	public void setLoginPwd(String loginPwd) {
		this.loginPwd = loginPwd;
	}

	@Override
	public String toString() {
		return "Providers [id=" + id + ", name=" + name + ", industry="
				+ industry + ", scale=" + scale + ", profile=" + profile
				+ ", logo=" + logo + ", enail=" + enail + ", fax=" + fax
				+ ", postcode=" + postcode + ", address=" + address
				+ ", registerTime=" + registerTime + ", qq=" + qq
				+ ", telephone=" + telephone + ", cellphone=" + cellphone
				+ ", contects=" + contects + ", url=" + url + ", grade="
				+ grade + ", certificationType=" + certificationType
				+ ", loginName=" + loginName + ", loginPwd=" + loginPwd + "]";
	}

}
