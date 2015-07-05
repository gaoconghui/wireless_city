package com.whut.wxcs.resmanager.bean.test;

import java.sql.Date;
import java.util.List;
import java.util.Random;

import org.hibernate.Criteria;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.whut.wxcs.resmanager.dao.BaseDao;
import com.whut.wxcs.resmanager.model.Attribute;
import com.whut.wxcs.resmanager.model.Catalogue;
import com.whut.wxcs.resmanager.model.CriteriaResource;
import com.whut.wxcs.resmanager.model.Provider;
import com.whut.wxcs.resmanager.model.Resource;
import com.whut.wxcs.resmanager.model.ResourceAttribute;
import com.whut.wxcs.resmanager.service.CatalogueService;
import com.whut.wxcs.resmanager.service.SearchResourceService;

public class testSearch {

	@javax.annotation.Resource
	private static CatalogueService catalogueService;
	@javax.annotation.Resource
	private static SearchResourceService searchResourceService;
	@javax.annotation.Resource
	private static BaseDao<ResourceAttribute> resourceAttributeDao;

	@javax.annotation.Resource
	private static BaseDao<Resource> resourceDao;

	@BeforeClass
	public static void iniUserService() {
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		resourceDao = (BaseDao<Resource>) applicationContext
				.getBean("resourceDao");
		resourceAttributeDao =  (BaseDao<ResourceAttribute>) applicationContext
				.getBean("resourceAttributeDao");
		searchResourceService = (SearchResourceService) applicationContext
				.getBean("searchResourceService");
	}

	@Test
	public void testResource() {
		com.whut.wxcs.resmanager.model.Resource resource;
		
		long id = 1010202;
		
		for (int i = 0; i < 100; i++) {
			resource = new com.whut.wxcs.resmanager.model.Resource();
			Catalogue catalogue = new Catalogue();
			catalogue.setId(id);
			Provider provider = new Provider();
			provider.setId(1);
			resource.setCatalogue(catalogue);
			resource.setResource_name("resource" + id +i );
			resource.setDescription("resource description_" + id + i);
			resource.setProvider(provider);
			resource.setCreate_time(new Date((long) (Math.random()*2436007511596L)));
			resourceDao.saveEntity(resource);
		}
	}
	
	@Test
	public void testAddAttr(){
		ResourceAttribute ra ;
		Attribute attribute ;
		Resource resource ;
		
		for(long i = 501 ; i <=600 ; i ++){
			ra = new ResourceAttribute();
			attribute = new Attribute();
			attribute.setId(7);
			resource = new Resource();
			resource.setId(i);
			ra.setAttribute(attribute);
			ra.setResource(resource);
			ra.setValue((int) (Math.random()*3)+"");
			
			resourceAttributeDao.saveEntity(ra);
			
		}
		
	}
	
	
	
	@Test
	public void testRodam(){
//		int num;
//		for(int i = 0 ; i < 100 ; i ++){
//			num = (int) (Math.random()*3);
//			System.out.println(num);
//		}
		System.out.println(resourceAttributeDao);
	}
	
	@Test
	public void testTime(){
		Long l = (long) (Math.random()*2436007511596L);
		System.out.println(new Date(l));
	}
	
	@Test
	public void testSearchByCatalogue(){
		CriteriaResource criteriaResource = new CriteriaResource();
		criteriaResource.setCatalogueId(1010101);
		
//		criteriaResource.setKeyWord("6");
		
//		criteriaResource.setOrderSequence(1);
//		criteriaResource.setOrderName(0);
		
		criteriaResource.getAttributes().add("2_1");
		criteriaResource.getAttributes().add("2_2");
		
	}

}
