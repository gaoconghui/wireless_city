package com.whut.wxcs.resmanager.web;

import java.util.Map;

import com.whut.wxcs.resmanager.model.Attribute;

public class CritialResource {

	//一组属性ID
	private Map<Long, Attribute> attributes;
	
	private String catalogueId;
	
	private  String key;

	public void putAttribute(Attribute attribute){
		attributes.put(attribute.getId(), attribute);
	}
	
	public void removeAttribute(Attribute attribute){
		attributes.remove(attribute).getId();
	}
	
	public Map<Long, Attribute> getAttributes() {
		return attributes;
	}

	public void setAttributes(Map<Long, Attribute> attributes) {
		this.attributes = attributes;
	}

	public String getCatalogueId() {
		return catalogueId;
	}

	public void setCatalogueId(String catalogueId) {
		this.catalogueId = catalogueId;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}
	
	
	
}
