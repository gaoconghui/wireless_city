package com.whut.wxcs.resmanager.dao.impl;

import org.springframework.stereotype.Repository;

import com.whut.wxcs.resmanager.model.Catalogue;
@Repository("catalogueDao")
public class CatalogueDaoImpl extends BaseDaoImpl<Catalogue>{

	public Catalogue loadEntity(long id) {
		return (Catalogue) sessionFactory.getCurrentSession().load(clazz, id);
	}

	public Catalogue getEntity(long id) {
		return (Catalogue) sessionFactory.getCurrentSession().get(clazz, id);
	}
	
}
