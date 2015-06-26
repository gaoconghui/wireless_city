package com.whut.wxcs.resmanager.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.whut.wxcs.resmanager.dao.BaseDao;
import com.whut.wxcs.resmanager.model.Attribute;
import com.whut.wxcs.resmanager.model.Catalogue;
import com.whut.wxcs.resmanager.model.Template;
import com.whut.wxcs.resmanager.service.CatalogueService;
import com.whut.wxcs.resmanager.util.ValidateUtil;

@Service("catalogueService")
public class CatalogueServiceImpl extends BaseServiceImpl<Catalogue> implements
		CatalogueService {

	@Resource(name = "catalogueDao")
	@Override
	public void setBaseDao(BaseDao<Catalogue> baseDao) {
		super.setBaseDao(baseDao);
	}

	public BaseDao<Catalogue> getBaseDao() {
		return baseDao;
	}

	@Resource(name = "catalogueDao")
	private BaseDao<Catalogue> catalogueDao;
	@Resource(name = "templateDao")
	private BaseDao<Template> templateDao;
	@Resource(name = "attributeDao")
	private BaseDao<Attribute> attributeDao;

	@Override
	public List<Catalogue> getRootCatalogue() {
		String hql = "from Catalogue c where c.parent.id = 1 order by id asc";
		return catalogueDao.findEntityByHql(hql);
	}

	@Override
	public List<Catalogue> getAllCatalogue() {
		String hql = "from Catalogue ";
		return catalogueDao.findEntityByHql(hql);
	}

	@Override
	public void saveCatalogue(Catalogue model) {
		int flag = 0;
		if (model.getId() != 0) {
			long oldId = catalogueDao.getEntity(model.getId()).getParent()
					.getId();
			if (oldId == model.getParent().getId())
				flag = 1;
		}

		if (flag == 0) {
			String hql = "from Catalogue c where c.parent.id = ? order by id desc";
			List<Catalogue> child = catalogueDao.findEntityByHql(hql, model
					.getParent().getId());
			if (ValidateUtil.isVaild(child)) {
				model.setId(child.get(0).getId() + 1);
			} else {
				model.setId(model.getParent().getId() * 100 + 1);
			}
		}

		catalogueDao.saveOrUpdateEntity(model);
	}

	@Override
	public Catalogue getRootCatalogueWithAllChild() {
		String hql = "from Catalogue c where c.id = 1";
		Catalogue root = (Catalogue) catalogueDao.ubiqueResult(hql);
		getAllChild(root);
		return root;
	}

	private void getAllChild(Catalogue c) {
		if (ValidateUtil.isVaild(c.getChild())) {
			for (Catalogue catalogue : c.getChild()) {
				getAllChild(catalogue);
			}
		}
	}

	@Override
	public void deleteCatalogueWithChild(long id) {
		Catalogue catalogue = catalogueDao.getEntity(id);
		deleteCicleCatalogue(catalogue);
	}

	private void deleteCicleCatalogue(Catalogue catalogue) {
		if (ValidateUtil.isVaild(catalogue.getChild())) {
			for (Catalogue c : catalogue.getChild()) {
				deleteCicleCatalogue(c);
			}
		}
		catalogueDao.deleteEntity(catalogue);

	}

	@Override
	public Catalogue getCatalogueById(long id) {
		Catalogue catalogue = catalogueDao.getEntity(id);
		catalogue.getParent();
		return catalogue;
	}

	@Override
	public void saveTemplate(Template model) {
		Catalogue catalogue = catalogueDao.getEntity(model.getCatalogue().getId());
		model.setCatalogue(catalogue);
		if (catalogue.getTemplateState() == 0) {
			if (ValidateUtil.isVaild(model.getAttributes())) {
				for (Attribute attribute : model.getAttributes()) {
					attributeDao.saveOrUpdateEntity(attribute);
				}
			}
			templateDao.saveOrUpdateEntity(model);
			catalogue.setTemplateState(1);
		}else{
			
		}
	}

	@Override
	public Template getTemplate(long id) {
		Template template = templateDao.getEntity(id);
		template.getAttributes().size();
		return template;
	}

	@Override
	public Template getTemplateWithAll(long id) {
		Template template = templateDao.getEntity(id);
		template.getAttributes().size();
		template.getCatalogue();
		return template;
	}

	@Override
	public void updateTemplate(Template model) {
		Template oldTemplate = templateDao.getEntity(model.getId());
		oldTemplate.setTemplateName(model.getTemplateName());
		oldTemplate.setDescription(model.getDescription());
		templateDao.updateEntity(oldTemplate);
	}

}
