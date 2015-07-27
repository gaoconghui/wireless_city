package com.whut.wxcs.resmanager.model;

public class ResourceAttribute {

	private long id;
	private Resource resource;
	private Attribute attribute;
	private String value;
	
	//存储小数型和整数型的数值
	private Double numValue;

	
	public Double getNumValue() {
		return numValue;
	}

	public void setNumValue(Double numValue) {
		this.numValue = numValue;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Resource getResource() {
		return resource;
	}

	public void setResource(Resource resource) {
		this.resource = resource;
	}

	public Attribute getAttribute() {
		return attribute;
	}

	public void setAttribute(Attribute attribute) {
		this.attribute = attribute;
	}

	public Object getValue() {
		return value;
	}

	public void setValue(String value) {
		try {
			this.setNumValue(Double.parseDouble(value));
		} catch (Exception e) {}
		this.value = value;
	}

}
