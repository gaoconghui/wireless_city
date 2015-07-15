package com.whut.wxcs.resmanager.service;

import java.util.List;

public interface BaseService<T> {

	public long saveEntity(T t);

	public void saveOrUpdateEntity(T t);
	public void updateEntity(T t);
	public void deleteEntity(T t);
	public void batchEntityByHql(String hql,Object ...objects);
	
	public T loadEntity(long id);
	public T getEntity(long id);
	public List<T> findEntityByHql(String hql,Object...objects);
	//单值检索，确保查询结果只有一个数
	public Object ubiqueResult(String hql,Object...objects);
}
