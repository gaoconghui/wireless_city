package com.whut.wxcs.resmanager.service.impl;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.criterion.Conjunction;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;
import org.hibernate.type.*;

import com.whut.wxcs.resmanager.dao.BaseDao;
import com.whut.wxcs.resmanager.model.Attribute;
import com.whut.wxcs.resmanager.model.CriteriaResource;
import com.whut.wxcs.resmanager.model.Page;
import com.whut.wxcs.resmanager.model.Resource;
import com.whut.wxcs.resmanager.service.SearchResourceService;
import com.whut.wxcs.resmanager.util.ValidateUtil;

@Service("searchResourceService")
public class SearchResourceServiceImpl implements SearchResourceService {

	@javax.annotation.Resource
	BaseDao<Resource> resourceDao;

	@Override
	public Page<Resource> searchByCriteria(CriteriaResource model) {

		Page<Resource> page = new Page<Resource>(model.getPageNum());
		page.setPageSize(model.getPageSize());

		Criteria criteria = resourceDao.getCriteria();

		// 增加类目查询
		addCriteriaCatalogue(model, criteria);

		// 增加关键字查询
		addCriteriaKeyword(model, criteria);

		// 根据属性进行查询
		addCriteriaAttribute(model, criteria);

		// 增加排序
		addCriteriaOrder(model, criteria);

		// 未分页前查询获得总页数
		page.setTotalItemNumber(criteria.list().size());

		// 增加分页
		addCriteriaPaging(model, criteria);

		page.setList(criteria.list());
		return page;
	}

	/**
	 * 分页操作
	 * 
	 * @param model
	 * @param criteria
	 */
	private void addCriteriaPaging(CriteriaResource model, Criteria criteria) {
		criteria.setFirstResult((model.getPageNum() - 1) * model.getPageSize())
				.setMaxResults(model.getPageSize());
	}

	/**
	 * 在criteria 里增加属性拦截
	 * 
	 * @param model
	 * @param criteria
	 */
	private void addCriteriaAttribute(CriteriaResource model, Criteria criteria) {
		Disjunction disjunction;
		Conjunction conjunction;
		if (ValidateUtil.isVaild(model.getAttributes())) {

			Criteria attributeCriteria = criteria.createCriteria("attributes");
			// 存储多个用 or 连接的属性
			disjunction = Restrictions.disjunction();
			Attribute attribute;

			// 遍历 给每个限定的attribute 增加拦截
			for (String attr : model.getAttributes()) {

				attribute = new Attribute();
				attribute.setId(getAttributeId(attr));

				conjunction = Restrictions.conjunction();
				conjunction.add(Restrictions.eq("value", getValue(attr)));
				conjunction.add(Restrictions.eq("attribute", attribute));
				disjunction.add(conjunction);
			}
			attributeCriteria.add(disjunction);
		}
	}

	/**
	 * 在criteria 里增加类目拦截
	 * 
	 * @param model
	 * @param criteria
	 */
	private void addCriteriaCatalogue(CriteriaResource model, Criteria criteria) {
		if (model.getCatalogueId() != 0) {
			criteria.add(Restrictions.sqlRestriction("this_.CATALOGUE_ID like '"
					+ model.getCatalogueId() + "%'"));

		}
	}

	/**
	 * 在criteria 里增加关键字拦截
	 * 
	 * @param model
	 * @param criteria
	 */
	private void addCriteriaKeyword(CriteriaResource model, Criteria criteria) {
		Disjunction disjunction;
		if (ValidateUtil.isVaild(model.getKeyWord())) {
			// 使用 or 连接
			disjunction = Restrictions.disjunction();
			disjunction.add(Restrictions.like("resource_name",
					model.getKeyWord(), MatchMode.ANYWHERE));
			disjunction.add(Restrictions.like("description",
					model.getKeyWord(), MatchMode.ANYWHERE));
			criteria.add(disjunction);
		}
	}

	/**
	 * 在criteria 里增加排序
	 * 
	 * @param model
	 * @param criteria
	 */
	private void addCriteriaOrder(CriteriaResource model, Criteria criteria) {
		if (model.getOrderSequence() == CriteriaResource.ORDER_ASC) {
			criteria.addOrder(Order.asc(CriteriaResource.getOrderMap().get(
					model.getOrderName())));
		} else if (model.getOrderSequence() == CriteriaResource.ORDER_DESC) {
			criteria.addOrder(Order.desc(CriteriaResource.getOrderMap().get(
					model.getOrderName())));
		}
	}

	// 传入string 获取出value 如传入25_3 取出3
	private String getValue(String attr) {
		return attr.substring(attr.indexOf("_") + 1, attr.length());
	}

	// 传入string 获取出attributeid 如传入25_3 取出25
	private long getAttributeId(String attr) {
		return Long.parseLong(attr.substring(0, attr.indexOf("_")));
	}

}
