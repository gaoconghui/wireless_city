package com.whut.wxcs.resmanager.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.whut.wxcs.resmanager.dao.BaseDao;
import com.whut.wxcs.resmanager.model.User;
import com.whut.wxcs.resmanager.service.UserService;
import com.whut.wxcs.resmanager.util.DataUtils;

@Service("userService")
public class UserServiceImpl extends BaseServiceImpl<User> implements
		UserService {

	@Resource(name = "userDao")
	public void setBaseDao(BaseDao<User> baseDao) {
		super.setBaseDao(baseDao);
	}

	/**
	 * 判断昵称是否重复
	 */
	@Override
	public boolean isNameExit(String name) {
		String hql = "from User u WHERE u.name=?";
		List<User> users = findEntityByHql(hql, name);
		if (users == null || users.size() == 0) {
			return false;
		}
		return true;
	}

	/**
	 * 注册
	 */
	@Override
	public void register(User user) {
		saveEntity(user);
	}

	@Override
	public boolean isLogin(User user) {
		String hql = "from User u WHERE u.name = ? AND u.loginPwd = ?";
		List<User> users = findEntityByHql(hql, user.getName(),
				DataUtils.MD5(user.getLoginPwd()));
		if (users == null || users.size() == 0) {
			return false;
		}
		return true;
	}
}
