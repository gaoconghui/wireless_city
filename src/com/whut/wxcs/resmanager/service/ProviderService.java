package com.whut.wxcs.resmanager.service;

import com.whut.wxcs.resmanager.model.Provider;

public interface ProviderService extends BaseService<Provider> {
    /**
     *验证服务商的登陆账号是否存在 
     */
    public boolean isLoginNameExit(String loginName);

	public boolean isLogin(Provider provider);

	public Provider getProviderByloginName(String loginName);

}
