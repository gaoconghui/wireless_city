package com.whut.wxcs.resmanager.struts.action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

public abstract class BaseAction<T> extends ActionSupport implements
		ModelDriven<T>, Preparable {

	/**
	 * 基本的Action类
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void prepare() throws Exception {
         
	}

	public abstract T getModel();

}
