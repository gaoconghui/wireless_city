package com.whut.wxcs.resmanager.dao;

import java.util.List;

/**
 * baseDao接口
 * @author apple
 *
 * @param <T>
 */
public interface BaseDao<T> {

	
	public void saveEntity(T t);
	public void saveOrUpdateEntity(T t);
	public void updateEntity(T t);
	public void deleteEntity(T t);
	public void batchEntityByHql(String hql,Object ...objects);
	public void batchEntityBySql(String hql,Object ...objects);
	
	public T loadEntity(long id);
	public T getEntity(long id);
	public List<T> findEntityByHql(String hql,Object...objects);
	public List<T> findEntityBySql(String hql,Object...objects);
	//单值检索，确保查询结果只有一个数
	public Object uniqueResult(String hql,Object...objects);
}
