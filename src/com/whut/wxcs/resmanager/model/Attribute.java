package com.whut.wxcs.resmanager.model;

import java.util.Arrays;

import com.whut.wxcs.resmanager.util.DataUtils;

public class Attribute {

	private long id;
	private String name;

	// 属性类型（1-文本型、2-小数型、3-整型、4-时间型、5-枚举型
	private byte type;
	private String description;
	private String value;
	private String enumValue[];

	// 创建这个属性的模板
	private long templateid;

	public long getTemplateid() {
		return templateid;
	}

	public void setTemplateid(long templateid) {
		this.templateid = templateid;
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
		this.enumValue = DataUtils.toArray(value);
	}

	public String[] getEnumValue() {
		return enumValue;
	}

	public void setEnumValue(String[] enumValue) {
		this.enumValue = enumValue;
	}

	@Override
	public String toString() {
		return "Attribute [id=" + id + ", name=" + name + ", type=" + type
				+ ", description=" + description + ", value=" + value
				+ ", enumValue=" + Arrays.toString(enumValue) + ", templateid="
				+ templateid + "]";
	}

}
