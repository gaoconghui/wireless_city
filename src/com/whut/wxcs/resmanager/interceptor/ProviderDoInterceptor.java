package com.whut.wxcs.resmanager.interceptor;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import com.whut.wxcs.resmanager.model.Provider;
import com.whut.wxcs.resmanager.struts.action.AddResourceAction;
import com.whut.wxcs.resmanager.struts.action.BaseAction;
import com.whut.wxcs.resmanager.struts2.ProviderAware;

public class ProviderDoInterceptor implements Interceptor {
	private static final long serialVersionUID = 1L;

	@Override
	public void destroy() {
	}

	@Override
	public void init() {

	}

	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		BaseAction action = (BaseAction) actionInvocation.getAction();
		if (action instanceof AddResourceAction) {
			ActionContext ac = actionInvocation.getInvocationContext();
			Provider provider = (Provider) ac.getSession().get("provider");
			if (provider == null) {
				return ""; // 登陆页面
			} else {
				if (action instanceof ProviderAware) {
					((ProviderAware) action).setProvider(provider);
				}
				return actionInvocation.invoke();
			}
		}
		return actionInvocation.invoke();
	}

}
