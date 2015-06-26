package com.whut.wxcs.resmanager.bean.test;

import javax.annotation.Resource;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.whut.wxcs.resmanager.action.BaseAction;
import com.whut.wxcs.resmanager.dao.BaseDao;
import com.whut.wxcs.resmanager.dao.impl.CatalogueDaoImpl;
import com.whut.wxcs.resmanager.dao.impl.UserDaoImpl;
import com.whut.wxcs.resmanager.model.Catalogue;
import com.whut.wxcs.resmanager.model.Template;
import com.whut.wxcs.resmanager.service.CatalogueService;


public class testCatalogueService {

	@Resource
	private static CatalogueService catalogueService ;
	
	@Resource
	private static BaseDao<Catalogue> catalogueDao ;
	
	@Resource
	private static BaseDao<Template> templateDao ;
	
	@BeforeClass
	public static void iniUserService(){
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
		catalogueService = (CatalogueService) applicationContext.getBean("catalogueService");
		catalogueDao =(BaseDao<Catalogue>) applicationContext.getBean("catalogueDao");
		templateDao =(BaseDao<Template>) applicationContext.getBean("templateDao");
	}
	
	@Test
	public void testCatalogueDao(){
//		System.out.println(catalogueDao);
	}
	
	@Test
	public void testSaveCatalogue(){
		Catalogue parent = new Catalogue();
		parent.setId(1);
		
		Catalogue catalogue = new Catalogue();
		catalogue.setId(1006);
		catalogue.setName("test");
		catalogue.setParent(parent);
		
		Catalogue newParent = catalogueDao.getEntity(1);
//		System.out.println(newParent);
		
		catalogueService.saveCatalogue(catalogue);
		
	}
	
	@Test
	public void testGetRootCatalogueWithAllChild(){
		Catalogue catalogue = catalogueService.getRootCatalogueWithAllChild();
		System.out.println(catalogue);
	}
	
	@Test
	public void testCatalogue(){
		Catalogue catalogue = new Catalogue();
		System.out.println(catalogue.getId());
	}
	
	@Test
	public void testTemplateOne2One(){
//		System.out.println(catalogueDao);
		Catalogue catalogue = new Catalogue();
		catalogue.setId(100011);
//		catalogueDao.saveEntity(catalogue);
		
		Template template = new Template();
		template.setCatalogue(catalogue);
		templateDao.saveEntity(template);
		
	}
}
