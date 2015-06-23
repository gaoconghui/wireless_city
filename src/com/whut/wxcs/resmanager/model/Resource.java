package com.whut.wxcs.resmanager.model;

import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

public class Resource {

	private long id;

	private Set<RAttributeValue> attributes = new HashSet<RAttributeValue>();

	private String resource_name;
	private String description;
	// 所属类目
	private Catalogue catalogue;
	private Provider provider;
	private Date creat_time;
	private Float rating;
	// 权限
	private int power;
	// 拥有相同的资源的数目
	private int quantity;

	public void addAttribute(RAttributeValue attribute) {
		attributes.add(attribute);
	}

	public void removeAttribute(RAttributeValue attribute) {
		if (attributes.contains(attribute))
			attributes.remove(attribute);
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

	public Provider getProvider() {
		return provider;
	}

	public void setProvider(Provider provider) {
		this.provider = provider;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getResource_name() {
		return resource_name;
	}

	public void setResource_name(String resource_name) {
		this.resource_name = resource_name;
	}

	public Date getCreat_time() {
		return creat_time;
	}

	public void setCreat_time(Date creat_time) {
		this.creat_time = creat_time;
	}

	public Float getRating() {
		return rating;
	}

	public void setRating(Float rating) {
		this.rating = rating;
	}


	public int getPower() {
		return power;
	}

	public void setPower(int power) {
		this.power = power;
	}

	public Set<RAttributeValue> getAttributes() {
		return attributes;
	}

	public void setAttributes(Set<RAttributeValue> attributes) {
		this.attributes = attributes;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


}
