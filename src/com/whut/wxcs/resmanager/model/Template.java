package com.whut.wxcs.resmanager.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Template {

	private long id;
	private String templateName;
	private String description;
	private Catalogue catalogue;
	private Date createTime;
	private Set<Attribute> attributes = new HashSet<Attribute>();

<<<<<<< HEAD
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
=======
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
>>>>>>> User&Provider_COPY
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

<<<<<<< HEAD
	public Date getCreateTime() {
		return createTime;
=======
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getCreatTime() {
		return creatTime;
>>>>>>> User&Provider_COPY
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

<<<<<<< HEAD
	public Set<Attribute> getAttributes() {
		return attributes;
	}

	public void setAttributes(Set<Attribute> attributes) {
		this.attributes = attributes;
=======
	@Override
	public String toString() {
		return "template [id=" + templateId + ", templateName=" + templateName
				+ ", description=" + description + ", catalogue=" + catalogue
				+ ", creatTime=" + creatTime + "]";
>>>>>>> User&Provider_COPY
	}

}
