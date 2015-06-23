package com.whut.wxcs.resmanager.model;

public class TemplateAttribute {

	private long id;
	private Attribute attribute;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Attribute getAttribute() {
		return attribute;
	}

	public void setAttribute(Attribute attribute) {
		this.attribute = attribute;
	}

	@Override
	public String toString() {
		return "TemplateAttribute [id=" + id + ", attribute=" + attribute + "]";
	}

}
