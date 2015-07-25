package com.whut.wxcs.resmanager.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.whut.wxcs.resmanager.dao.BaseDao;
import com.whut.wxcs.resmanager.model.Provider;
import com.whut.wxcs.resmanager.service.ProviderService;
import com.whut.wxcs.resmanager.util.DataUtils;
import com.whut.wxcs.resmanager.util.MessageMail;
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
	public Provider isLogin(Provider provider) {
		String hql = "from Provider p WHERE p.loginName=? AND p.loginPwd=?";
		List<Provider> providers = findEntityByHql(hql,
				provider.getLoginName(), DataUtils.MD5(provider.getLoginPwd()));
		if (providers == null || providers.size() == 0) {
			return null;
		}
		return providers.get(0);
	}

	@Override
	public Provider getProviderByloginName(String loginName) {
		String hql = "from Provider p WHERE  p.loginName=? ";
		List<Provider> providers = findEntityByHql(hql, loginName);
		return providers.get(0);
	}

	@Override
	public List<Provider> getCheckedProviders() {
		String hql = "from Provider p WHERE p.checkState =? ";
		return findEntityByHql(hql, 1);
	}

	@Override
	public List<Provider> getUncheckedProviders() {
		String hql = "from Provider p WHERE p.checkState =? ";
		return findEntityByHql(hql, 2);
	}

	@Override
	public void passListCheck(String ids) {
		String hql = "UPDATE Provider p SET p.checkState = 1 WHERE p.id IN ("
				+ ids +")";
		this.batchEntityByHql(hql);
	}

	@Override
	public void offListCheck(String ids) {
		String hql = "UPDATE Provider p SET p.checkState = 0 WHERE p.id IN ("
				+ ids +")";
		this.batchEntityByHql(hql);
	}

}
