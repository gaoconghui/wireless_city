package com.whut.wxcs.resmanager.service;

import com.whut.wxcs.resmanager.model.User;

public interface UserService extends BaseService<User> {

	public boolean isNameExit(String name);

	public void register(User user);

	public boolean isLogin(User user);

	public User findUserByName(String name);

	public User getUserById(long param_id);
    
	
}
