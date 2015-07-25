package com.whut.wxcs.resmanager.service.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

import com.whut.wxcs.resmanager.dao.BaseDao;
import com.whut.wxcs.resmanager.model.Page;
import com.whut.wxcs.resmanager.model.Resource;
import com.whut.wxcs.resmanager.model.web.CriteriaBackResource;
import com.whut.wxcs.resmanager.service.SearchBackResourceService;
import com.whut.wxcs.resmanager.util.ValidateUtil;

@Service("searchBackResourceService")
public class SearchBackResourceServiceImpl implements SearchBackResourceService {

	@javax.annotation.Resource
	BaseDao<Resource> resourceDao;

	@Override
	public Page<Resource> searchByCriteria(CriteriaBackResource model) {

		Page<Resource> page = new Page<Resource>(model.getPageNum());
		page.setPageSize(model.getPageSize());

		Criteria criteria = resourceDao.getCriteria();

		// 增加关键字查询
		addCriteriaKeyword(model, criteria);

		// 增加排序
		addCriteriaOrder(model, criteria);

		// 未分页前查询获得总页数
		List<Resource> resourceList = criteria.list();
		long size = resourceList.size();
		page.setTotalItemNumber(size);

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
	private void addCriteriaPaging(CriteriaBackResource model, Criteria criteria) {
		criteria.setFirstResult((model.getPageNum() - 1) * model.getPageSize())
				.setMaxResults(model.getPageSize());
	}

	/**
	 * 在criteria 里增加关键字拦截
	 */
	private void addCriteriaKeyword(CriteriaBackResource model,
			Criteria criteria) {
		if (ValidateUtil.isVaild(model.getKeyWord())) {
			Disjunction disjunction;
			// 使用 or 连接
			disjunction = Restrictions.disjunction();
			disjunction.add(Restrictions.like("resource_name",
					model.getKeyWord(), MatchMode.ANYWHERE));
			disjunction.add(Restrictions.like("description",
					model.getKeyWord(), MatchMode.ANYWHERE));
			criteria.createAlias("provider", "p");
			disjunction.add(Restrictions.like("p.name", model.getKeyWord(),
					MatchMode.ANYWHERE));
			criteria.add(disjunction);
		}
	}

	/**
	 * 在criteria 里增加排序
	 */
	private void addCriteriaOrder(CriteriaBackResource model, Criteria criteria) {
		if (model.getOrderSequence() == CriteriaBackResource.ORDER_ASC) {
			criteria.addOrder(Order.asc(CriteriaBackResource.getOrderMap().get(
					model.getOrderName())));
		} else if (model.getOrderSequence() == CriteriaBackResource.ORDER_DESC) {
			criteria.addOrder(Order.desc(CriteriaBackResource.getOrderMap()
					.get(model.getOrderName())));
		}
	}

}
