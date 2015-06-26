package com.whut.wxcs.resmanager.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.whut.wxcs.resmanager.dao.BaseDao;
import com.whut.wxcs.resmanager.model.Provider;
import com.whut.wxcs.resmanager.service.ProviderService;
import com.whut.wxcs.resmanager.util.DataUtils;
import com.whut.wxcs.resmanager.util.ValidateUtil;

@Service("providerService")
public class ProviderServiceImpl extends BaseServiceImpl<Provider> implements
		ProviderService {

	@Resource(name = "providerDao")
	public void setBaseDao(BaseDao<Provider> baseDao) {
		super.setBaseDao(baseDao);
	}

	@Override
	public boolean isLoginNameExit(String loginName) {
		String hql = "from Provider p WHERE p.loginName=?";
		List<Provider> providers = findEntityByHql(hql, loginName);
		return ValidateUtil.isVaild(providers);
	}

	@Override
	public boolean isLogin(Provider provider) {
		String hql = "from Provider p WHERE p.loginName=? AND p.loginPwd=?";
		List<Provider> providers = findEntityByHql(hql,
				provider.getLoginName(), DataUtils.MD5(provider.getLoginPwd()));
		return ValidateUtil.isVaild(providers);
	}

	@Override
	public Provider getProviderByloginName(String loginName) {
		String hql = "from Provider p WHERE  p.loginName=? ";
		List<Provider> providers = findEntityByHql(hql, loginName);
		return providers.get(0);
	}

}
