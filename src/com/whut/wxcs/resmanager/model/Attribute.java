package com.whut.wxcs.resmanager.model;

public class Attribute {

	private long id;
	private String attribute_name;
	//属性类型（1-文本型、2-小数型、3-整型、4-时间型、5-枚举型

	private byte attribute_type;
	private String attribute_description;
	
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getAttribute_name() {
		return attribute_name;
	}
	public void setAttribute_name(String attribute_name) {
		this.attribute_name = attribute_name;
	}
	public byte getAttribute_type() {
		return attribute_type;
	}
	public void setAttribute_type(byte attribute_type) {
		this.attribute_type = attribute_type;
	}
	public String getAttribute_description() {
		return attribute_description;
	}
	public void setAttribute_description(String attribute_description) {
		this.attribute_description = attribute_description;
	}
	@Override
	public String toString() {
		return "Attribute [id=" + id + ", attribute_name=" + attribute_name
				+ ", attribute_type=" + attribute_type
				+ ", attribute_description=" + attribute_description + "]";
	}
	
	
	
}
