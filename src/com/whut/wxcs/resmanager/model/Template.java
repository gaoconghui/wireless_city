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

	public void addAttribute(TAttributeValue attribute) {
		attributes.add(attribute);
	}

	public void removeAttribute(TAttributeValue attribute) {
		if (attributes.contains(attribute))
			attributes.remove(attribute);
	}

	public long getId() {
		return templateId;
	}

	public void setId(long id) {
		this.templateId = id;
	}

	public String getTemplateName() {
		return templateName;
	}

	public void setTemplateName(String templateName) {
		this.templateName = templateName;
	}

	public Catalogue getCatalogue() {
		return catalogue;
	}

	public void setCatalogue(Catalogue catalogue) {
		this.catalogue = catalogue;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getCreatTime() {
		return creatTime;
	}

	public void setCreatTime(Date creatTime) {
		this.creatTime = creatTime;
	}

	@Override
	public String toString() {
		return "template [id=" + templateId + ", templateName=" + templateName
				+ ", description=" + description + ", catalogue=" + catalogue
				+ ", creatTime=" + creatTime + "]";
	}

}
