package com.whut.wxcs.resmanager.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Criteria;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

import com.whut.wxcs.resmanager.dao.BaseDao;
import com.whut.wxcs.resmanager.model.Page;
import com.whut.wxcs.resmanager.model.Provider;
import com.whut.wxcs.resmanager.model.web.CriteriaProvider;
import com.whut.wxcs.resmanager.service.SearchProviderService;
import com.whut.wxcs.resmanager.util.ValidateUtil;

@Service("searchProviderService")
public class SearchProviderServiceImpl implements SearchProviderService {

	@Resource
	BaseDao<Provider> providerDao;


	@Override
	public Page<Provider> searchByCriteria(CriteriaProvider model) {

		Page<Provider> page = new Page<Provider>(model.getPageNum());
		page.setPageSize(model.getPageSize());

		Criteria criteria = providerDao.getCriteria();

		// 增加关键字查询
		addCriteriaKeyword(model, criteria);

		// 增加排序
		addCriteriaOrder(model, criteria);

		// 未分页前查询获得总页数
		List<Provider> providerList = criteria.list();
		long size = providerList.size();
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
	private void addCriteriaPaging(CriteriaProvider model, Criteria criteria) {
		criteria.setFirstResult((model.getPageNum() - 1) * model.getPageSize())
				.setMaxResults(model.getPageSize());
	}


	/**
	 * 在criteria 里增加关键字拦截
	 */
	private void addCriteriaKeyword(CriteriaProvider model, Criteria criteria) {
		if (ValidateUtil.isVaild(model.getKeyWord())) {
			Disjunction disjunction;
			// 使用 or 连接
			disjunction = Restrictions.disjunction();
			disjunction.add(Restrictions.like("name",
					model.getKeyWord(), MatchMode.ANYWHERE));
			disjunction.add(Restrictions.like("industry",
					model.getKeyWord(), MatchMode.ANYWHERE));
			criteria.add(disjunction);
		}
	}


	/**
	 * 在criteria 里增加排序
	 */
	private void addCriteriaOrder(CriteriaProvider model, Criteria criteria) {
		if (model.getOrderSequence() == CriteriaProvider.ORDER_ASC) {
			criteria.addOrder(Order.asc(CriteriaProvider.getOrderMap().get(
					model.getOrderName())));
		} else if (model.getOrderSequence() == CriteriaProvider.ORDER_DESC) {
			criteria.addOrder(Order.desc(CriteriaProvider.getOrderMap().get(
					model.getOrderName())));
		}
	}


}
