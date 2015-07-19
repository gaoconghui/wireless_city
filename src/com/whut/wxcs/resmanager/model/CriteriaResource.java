package com.whut.wxcs.resmanager.model;

import java.util.HashMap;
import java.util.Map;

/*
 * 封装查询参数的信息
 */
public class CriteriaResource {

	public static Integer ORDER_DESC = 1;
	public static Integer ORDER_ASC = 0;

	public static Integer ORDER_BY_CREATE_TIME = 0;
	public static Integer ORDER_BY_NAME = 1;

	private static Map<Integer, String> orderMap = new HashMap<Integer, String>();

	static {
		orderMap.put(ORDER_BY_CREATE_TIME, "create_time");
		orderMap.put(ORDER_BY_NAME, "resource_name");
	}

	// 所属模板id
	private long catalogueId;

	private int state;
	
	// attributeid_value 如25_1
	// List<String> attributes = new ArrayList<String>();
	private Map<String, String> attrMap = new HashMap<String, String>();

	// 内关键字
	private String keyWord;
	// 全局关键字
	private String frontKey;

	// 每页显示数量
	private Integer pageSize = 20;
	// 第几页
	private Integer pageNum = 1;

	// 排序方式 ，0是升序，1是降序
	private Integer orderSequence = 1;
	// 根据什么排序 0是按时间 1是按名字 ...
	private Integer orderName = 0;

	public long getCatalogueId() {
		return catalogueId;
	}
	
	public int getState() {
		return state;
	}



	public void setState(int state) {
		this.state = state;
	}



	public void setCatalogueId(long catalogueId) {
		this.catalogueId = catalogueId;
	}

	public Map<String, String> getAttrMap() {
		return attrMap;
	}

	public void setAttrMap(Map<String, String> attrMap) {
		this.attrMap = attrMap;
	}

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public String getFrontKey() {
		return frontKey;
	}

	public void setFrontKey(String frontKey) {
		this.frontKey = frontKey;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getPageNum() {
		return pageNum;
	}

	public void setPageNum(Integer pageNum) {
		this.pageNum = pageNum;
	}

	public Integer getOrderSequence() {
		return orderSequence;
	}

	public void setOrderSequence(Integer orderSequence) {
		this.orderSequence = orderSequence;
	}

	public Integer getOrderName() {
		return orderName;
	}

	public void setOrderName(Integer orderName) {
		this.orderName = orderName;
	}

	public static Map<Integer, String> getOrderMap() {
		return orderMap;
	}

	@Override
	public String toString() {
		return "CriteriaResource [catalogueId=" + catalogueId + ", attrMap="
				+ attrMap + ", keyWord=" + keyWord + ", frontKey=" + frontKey
				+ ", pageSize=" + pageSize + ", pageNum=" + pageNum
				+ ", orderSequence=" + orderSequence + ", orderName="
				+ orderName + "]";
	}

}
