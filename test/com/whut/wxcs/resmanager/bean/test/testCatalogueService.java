package com.whut.wxcs.resmanager.bean.test;

import java.util.HashSet;

import javax.annotation.Resource;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.whut.wxcs.resmanager.action.BaseAction;
import com.whut.wxcs.resmanager.dao.BaseDao;
import com.whut.wxcs.resmanager.dao.impl.CatalogueDaoImpl;
import com.whut.wxcs.resmanager.dao.impl.UserDaoImpl;
import com.whut.wxcs.resmanager.model.Attribute;
import com.whut.wxcs.resmanager.model.Catalogue;
import com.whut.wxcs.resmanager.model.Template;
import com.whut.wxcs.resmanager.service.CatalogueService;
import com.whut.wxcs.resmanager.util.ValidateUtil;

public class testCatalogueService {

	private int i;

	public int getI() {
		return i;
	}

	@Resource
	private static CatalogueService catalogueService;

	@Resource
	private static BaseDao<Catalogue> catalogueDao;

	@Resource
	private static BaseDao<Template> templateDao;

	@Resource
	private static BaseDao<Attribute> attributeDao;

	@BeforeClass
	public static void iniUserService() {
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		catalogueService = (CatalogueService) applicationContext
				.getBean("catalogueService");
		catalogueDao = (BaseDao<Catalogue>) applicationContext
				.getBean("catalogueDao");
		templateDao = (BaseDao<Template>) applicationContext
				.getBean("templateDao");
		attributeDao = (BaseDao<Attribute>) applicationContext
				.getBean("attributeDao");
	}

	@Test
	public void testCatalogueDao() {
		// System.out.println(catalogueDao);
	}

	@Test
	public void testSaveCatalogue() {
		Catalogue parent = new Catalogue();
		parent.setId(1);

		Catalogue catalogue = new Catalogue();
		catalogue.setId(1006);
		catalogue.setName("test");
		catalogue.setParent(parent);

		Catalogue newParent = catalogueDao.getEntity(1);
		// System.out.println(newParent);

		catalogueService.saveCatalogue(catalogue);

	}

	@Test
	public void testGetRootCatalogueWithAllChild() {
		Catalogue catalogue = catalogueService.getRootCatalogueWithAllChild();
		System.out.println(catalogue);
	}

	@Test
	public void testCatalogue() {
		Catalogue catalogue = new Catalogue();
		System.out.println(catalogue.getId());
	}

	@Test
	public void testTemplateOne2One() {
		// System.out.println(catalogueDao);
		Catalogue catalogue = new Catalogue();
		catalogue.setId(100011);
		// catalogueDao.saveEntity(catalogue);

		Template template = new Template();
		template.setCatalogue(catalogue);
		templateDao.saveEntity(template);

	}

	@Test
	public void testTemplateAttribute() {
		Attribute attribute1 = new Attribute();
		attribute1.setName("a1");
		Attribute attribute2 = new Attribute();
		attribute2.setName("a1");
		HashSet<Attribute> attributes = new HashSet<Attribute>();
		attributes.add(attribute1);
		attributes.add(attribute2);

		Catalogue catalogue = new Catalogue();
		catalogue.setId(11);

		Template template = new Template();
		template.setCatalogue(catalogue);
		template.setAttributes(attributes);

		if (ValidateUtil.isVaild(template.getAttributes())) {
			for (Attribute attribute : template.getAttributes()) {
				attributeDao.saveOrUpdateEntity(attribute);
			}
		}
		templateDao.saveOrUpdateEntity(template);
	}

	@Test
	public void testTemplateUpdate() {
		// Template template = templateDao.getEntity(13);
		// template.setDescription("aaa");
		// templateDao.updateEntity(template);
		Template model = new Template();
		model.setDescription("aaaa");
		model.setId(13);
		model.setTemplateName("aaaa");

		String hql = "UPDATE Template t SET t.description = ? ,t.templateName = ? WHERE t.id = ?";
		templateDao.batchEntityByHql(hql, model.getDescription(),
				model.getTemplateName(), model.getId());
	}

	@Test
	public void testAttributeUpdate() {
		Attribute model = new Attribute();
		model.setId(3);
		model.setDescription("desc");
		model.setName("nam1e");
		model.setType((byte) 1);
		model.setValue("1,2,3");

		catalogueService.updateAttribute(model);

		// String hql =
		// "UPDATE Attribute a SET a.description = ? ,a.name = ?,a.type = ? , a.value = ? WHERE a.id = ?";
		// templateDao.batchEntityByHql(hql,
		// model.getDescription(),model.getName(),model.getType(),model.getValue(),model.getId());
	}

	@Test
	public void testTeleteAttribute() {
		Attribute model = new Attribute();
		model.setId(1);
		// String hql = "delete from Attribute a where a.id = ?";
		// attributeDao.batchEntityByHql(hql, model.getId());
		// attributeDao.deleteEntity(model);
	}
	
	@Test
	public void testSaveAttribute(){
		Attribute model = new Attribute();
		model.setDescription("desc");
		model.setName("nam1e");
		model.setType((byte) 1);
		model.setValue("1,2,3");
		Template template = new Template();
		template.setId(13);
		model.setTemplate(template);
//		attributeDao.saveEntity(model);
		
		catalogueService.saveSingleAttribute(model);
		
//		Template template = templateDao.getEntity(13);
//		template.getAttributes().add(model);
//		templateDao.updateEntity(template);
	}
	
	@Test
	public void testSaveOrUpdate(){
		Catalogue catalogue = new Catalogue();
		catalogue.setId(1201);
		catalogue.setName("aa");
		catalogue.setDescription("bb");
		catalogueDao.saveOrUpdateEntity(catalogue);
	}

	@Test
	public void testUpdate(){
		Catalogue catalogue = catalogueDao.getEntity(1201);
		catalogue.setName("aaaaa");
		catalogueDao.updateEntity(catalogue);
	}
}
