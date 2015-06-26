package com.whut.wxcs.resmanager.service.impl;

import java.util.List;

import javax.annotation.Resource;

import com.whut.wxcs.resmanager.dao.BaseDao;
import com.whut.wxcs.resmanager.service.BaseService;

public abstract class BaseServiceImpl<T> implements BaseService<T> {

	private BaseDao<T> baseDao;

	@Resource
	public void setBaseDao(BaseDao<T> baseDao) {
		this.baseDao = baseDao;
	}

	@Override
	public void saveEntity(T t) {
		baseDao.saveEntity(t);
	}

	@Override
	public void saveOrUpdateEntity(T t) {
		baseDao.saveOrUpdateEntity(t);
	}

	@Override
	public void updateEntity(T t) {
		baseDao.updateEntity(t);
	}

	@Override
	public void deleteEntity(T t) {
		baseDao.deleteEntity(t);
	}

	@Override
	public void batchEntityByHql(String hql, Object... objects) {
		baseDao.batchEntityByHql(hql, objects);
	}

	@Override
	public T loadEntity(long id) {
		return baseDao.loadEntity(id);
	}

	@Override
	public T getEntity(long id) {
		return baseDao.getEntity(id);
	}

	@Override
	public List<T> findEntityByHql(String hql, Object... objects) {
		return baseDao.findEntityByHql(hql, objects);
	}

	@Override
	public Object ubiqueResult(String hql, Object... objects) {
		return baseDao.ubiqueResult(hql, objects);
	}

}
