package com.whut.wxcs.resmanager.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Template {

	private long templateId;
	private String templateName;
	private String description;
	private Catalogue catalogue;
	private Date creatTime;
	private Set<TAttributeValue> attributes = new HashSet<TAttributeValue>();

	public long getTemplateId() {
		return templateId;
	}

	public void setTemplateId(long templateId) {
		this.templateId = templateId;
	}

	public String getTemplateName() {
		return templateName;
	}

	public void setTemplateName(String templateName) {
		this.templateName = templateName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Catalogue getCatalogue() {
		return catalogue;
	}

	public void setCatalogue(Catalogue catalogue) {
		this.catalogue = catalogue;
	}

	public Date getCreatTime() {
		return creatTime;
	}

	public void setCreatTime(Date creatTime) {
		this.creatTime = creatTime;
	}

	public Set<TAttributeValue> getAttributes() {
		return attributes;
	}

	public void setAttributes(Set<TAttributeValue> attributes) {
		this.attributes = attributes;
	}

}
