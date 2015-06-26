package com.whut.wxcs.resmanager.model;

public class Attribute {

	private long id;
	private String name;

	// 属性类型（1-文本型、2-小数型、3-整型、4-时间型、5-枚举型
	private byte type;
	private String description;
	private String value;

	// 单向1:n 在新建属性时性能不好，因此使用双向1:n
	private Template template;

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

	public byte getType() {
		return type;
	}

	public void setType(byte type) {
		this.type = type;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public Template getTemplate() {
		return template;
	}

	public void setTemplate(Template template) {
		this.template = template;
	}

}
