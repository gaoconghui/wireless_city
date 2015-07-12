package com.whut.wxcs.resmanager.model.web;

import java.util.HashMap;
import java.util.Map;

public class CriteriaProvider {

	public static Integer ORDER_DESC = 1;
	public static Integer ORDER_ASC = 0;

	public static Integer ORDER_BY_CHECK_STATE = 0;
	public static Integer ORDER_BY_REGISTER_TIME = 1;
	public static Integer ORDER_BY_NAME = 2;
	public static Integer ORDER_BY_RRADE = 3;

	// 排序数组
	private static Map<Integer, String> orderMap = new HashMap<Integer, String>();

	static {
		orderMap.put(ORDER_BY_CHECK_STATE, "checkState");
		orderMap.put(ORDER_BY_REGISTER_TIME, "registerTime");
		orderMap.put(ORDER_BY_NAME, "name");
		orderMap.put(ORDER_BY_RRADE, "grade");
	}
	// 服务商审核状态:0-未通过 1-审核通过 2-正在审核中 10-全部
	private int checkState = 10;
	// 内关键字
	private String keyWord;
	// 每页显示数量
	private Integer pageSize = 20;
	// 第几页
	private Integer pageNum = 1;
	// 排序方式 ，0是升序，1是降序
	private Integer orderSequence = 1;
	// 根据什么排序 0是按checkState 1是按时间 2是名字 ...
	private Integer orderName = 0;

	public int getCheckState() {
		return checkState;
	}

	public void setCheckState(int checkState) {
		this.checkState = checkState;
	}

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
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

	public static void setOrderMap(Map<Integer, String> orderMap) {
		CriteriaProvider.orderMap = orderMap;
	}

	@Override
	public String toString() {
		return "CriteriaProvider [checkState=" + checkState + ", keyWord="
				+ keyWord + ", pageSize=" + pageSize + ", pageNum=" + pageNum
				+ ", orderSequence=" + orderSequence + ", orderName="
				+ orderName + "]";
	}
	

}
