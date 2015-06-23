package com.whut.wxcs.resmanager.model;

import java.util.HashSet;
import java.util.Set;

public class Catalogue {

	private long id;
	private Catalogue parent;
	private Set<Catalogue> child = new HashSet<Catalogue>();
	private String name;
	private String description;
	private Template template;

	public Template getTemplate() {
		return template;
	}

	public void setTemplate(Template template) {
		this.template = template;
	}

	public void addChild(Catalogue catalogue) {
		child.add(catalogue);
	}

	public void removeChile(Catalogue catalogue) {
		if (child.contains(catalogue))
			child.remove(catalogue);
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

	public Catalogue getParent() {
		return parent;
	}

	public void setParent(Catalogue parent) {
		this.parent = parent;
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

	@Override
	public String toString() {
		return "Catalogue [id=" + id + ", parent=" + parent + ", child="
				+ child + ", name=" + name + ", description=" + description
				+ ", template=" + template + "]";
	}


}
