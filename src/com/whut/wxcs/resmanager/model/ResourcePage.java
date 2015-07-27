package com.whut.wxcs.resmanager.model;

import java.util.ArrayList;
import java.util.List;

public class ResourcePage extends Page<Resource> {

	private List<Attribute> attrList = new ArrayList<Attribute>();
	
	//存放数值型的属性
	private List<Attribute> numAttrList = new ArrayList<Attribute>();

	private Catalogue catalogue;

	public List<Attribute> getAttrList() {
		return attrList;
	}

	public void setAttrList(List<Attribute> attrList) {
		this.attrList = attrList;
	}

	public Catalogue getCatalogue() {
		return catalogue;
	}

	public void setCatalogue(Catalogue catalogue) {
		this.catalogue = catalogue;
	}

	public ResourcePage(int pageNo) {
		super(pageNo);
	}

	public List<Attribute> getNumAttrList() {
		return numAttrList;
	}

	public void setNumAttrList(List<Attribute> numAttrList) {
		this.numAttrList = numAttrList;
	}

}
