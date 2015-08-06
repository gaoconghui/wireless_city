package com.whut.wxcs.resmanager.model;

import java.util.Set;

public class Catalogue {

	private long id;
	private Catalogue parent;
	private Set<Catalogue> child;
	private String name;
	private String description;
	private Template template;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Catalogue getParent() {
		return parent;
	}

	public void setParent(Catalogue parent) {
		this.parent = parent;
	}

	public Set<Catalogue> getChild() {
		return child;
	}

	public void setChild(Set<Catalogue> child) {
		this.child = child;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Template getTemplate() {
		return template;
	}

	public void setTemplate(Template template) {
		this.template = template;
	}

}
