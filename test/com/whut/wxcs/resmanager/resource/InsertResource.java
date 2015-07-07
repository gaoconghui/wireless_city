package com.whut.wxcs.resmanager.resource;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.whut.wxcs.resmanager.dao.BaseDao;
import com.whut.wxcs.resmanager.model.Catalogue;
import com.whut.wxcs.resmanager.model.Provider;
import com.whut.wxcs.resmanager.model.Resource;
import com.whut.wxcs.resmanager.model.ResourceAttribute;
import com.whut.wxcs.resmanager.service.CatalogueService;

public class InsertResource {
	@javax.annotation.Resource
	private static BaseDao<Resource> resourceDao;
	@javax.annotation.Resource
	private static BaseDao<ResourceAttribute> raDao;
	@javax.annotation.Resource
	private static CatalogueService catalogueService;
	@javax.annotation.Resource
	private static BaseDao<Catalogue> catalogueDao;

	static {
		ApplicationContext ac = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		resourceDao = (BaseDao<Resource>) ac.getBean("resourceDao");
		raDao = (BaseDao<ResourceAttribute>) ac.getBean("resourceAttribute");
		catalogueDao = (BaseDao<Catalogue>) ac.getBean("catalogueDao");
		catalogueService = (CatalogueService) ac.getBean("resourceService");
	}

	@Test
	public void insertResource() {
		Resource resource;
		long id = 101;
		for (int i = 0; i < 100; i++) {
			resource = new Resource();
			Catalogue catalogue = new Catalogue();
			catalogue.setId(id);
			Provider provider = new Provider();
			provider.setId(1);
			resource.setCatalogue(catalogue);
			resource.setProvider(provider);
			resource.setResource_name("resource" + id + i);
			resource.setDescription("description" + id + i);
			resource.setCreate_time(new Date(
					(long) (Math.random() * 2436007511596L)));
			resourceDao.saveEntity(resource);
		}
	}

	@Test
	public void testResAttr() {

	}

	@Test
	public void catalogueTest() {
		List<Catalogue> catalogues = catalogueService.getRootCatalogue();
		System.out.println(catalogues.size());
	}

}
