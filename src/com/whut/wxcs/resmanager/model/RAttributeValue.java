package com.whut.wxcs.resmanager.model;

public class RAttributeValue {

	private long RAttributeValueId;
	private Resource resource;
	private Attribute attribute;
	private String attributeValue;

	
	public long getRAttributeValueId() {
		return RAttributeValueId;
	}

	public void setRAttributeValueId(long rAttributeValueId) {
		RAttributeValueId = rAttributeValueId;
	}

	public String getAttributeValue() {
		return attributeValue;
	}

	public void setAttributeValue(String attributeValue) {
		this.attributeValue = attributeValue;
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

	@Override
	public String toString() {
		return "RAttributeValue [resource=" + resource + ", attribute="
				+ attribute + ", attributeValue=" + attributeValue + "]";
	}

}
