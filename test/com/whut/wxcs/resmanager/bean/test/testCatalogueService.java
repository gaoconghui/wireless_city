package com.whut.wxcs.resmanager.bean.test;

import java.util.Date;
import java.util.Random;

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
import com.whut.wxcs.resmanager.model.Provider;
import com.whut.wxcs.resmanager.model.Template;
import com.whut.wxcs.resmanager.service.CatalogueService;
import com.whut.wxcs.resmanager.service.ProviderService;


public class testCatalogueService {

	@Resource
	private static CatalogueService catalogueService ;
	@Resource
	private static ProviderService providerService ;
	
	@Resource
	private static BaseDao<Catalogue> catalogueDao ;
	@Resource
	private static BaseDao<com.whut.wxcs.resmanager.model.Resource> resourceDao ;
	
	@Resource
	private static BaseDao<Template> templateDao ;
	
	@BeforeClass
	public static void iniUserService(){
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
		catalogueService = (CatalogueService) applicationContext.getBean("catalogueService");
		providerService = (ProviderService) applicationContext.getBean("providerService");
		catalogueDao =(BaseDao<Catalogue>) applicationContext.getBean("catalogueDao");
		templateDao =(BaseDao<Template>) applicationContext.getBean("templateDao");
		resourceDao =(BaseDao<com.whut.wxcs.resmanager.model.Resource>) applicationContext.getBean("resourceDao");
	}
	
	@Test
	public void testCatalogueDao(){
//		System.out.println(catalogueDao);
	}
	
	@Test
	public void testSaveCatalogue(){
		Catalogue parent = new Catalogue();
		parent.setId(10102);
		
		Catalogue catalogue ;
		catalogue = new Catalogue();
		catalogue.setName("1.2.1类目");
		catalogue.setParent(parent);
		catalogue.setDescription("1.2.1类目");
		catalogueService.saveCatalogue(catalogue);
		
		catalogue = new Catalogue();
		catalogue.setName("1.2.2类目");
		catalogue.setParent(parent);
		catalogue.setDescription("1.2.2类目");
		catalogueService.saveCatalogue(catalogue);
		
	}
	
	@Test
	public void testSaveAttribute(){
		Attribute attribute  ;
		
		attribute = new Attribute();
		attribute.setName("A");
		attribute.setDescription("A的描述");
		attribute.setType((byte) 5);
		attribute.setValue("A1,A2,A3");
		catalogueService.saveSingleAttribute(attribute, 101);
		
		attribute = new Attribute();
		attribute.setName("B");
		attribute.setDescription("B的描述");
		attribute.setType((byte) 5);
		attribute.setValue("B1,B2,B3");
		catalogueService.saveSingleAttribute(attribute, 10101);
		
		attribute = new Attribute();
		attribute.setName("C");
		attribute.setDescription("C的描述");
		attribute.setType((byte) 5);
		attribute.setValue("C1,C2,C3");
		catalogueService.saveSingleAttribute(attribute, 10102);
		
		attribute = new Attribute();
		attribute.setName("D");
		attribute.setDescription("D的描述");
		attribute.setType((byte) 5);
		attribute.setValue("D1,D2,D3");
		catalogueService.saveSingleAttribute(attribute, 1010101);
		
		attribute = new Attribute();
		attribute.setName("E");
		attribute.setDescription("E的描述");
		attribute.setType((byte) 5);
		attribute.setValue("E1,E2,E3");
		catalogueService.saveSingleAttribute(attribute, 1010102);
		
		attribute = new Attribute();
		attribute.setName("F");
		attribute.setDescription("F的描述");
		attribute.setType((byte) 5);
		attribute.setValue("F1,F2,F3");
		catalogueService.saveSingleAttribute(attribute, 1010201);
		
		attribute = new Attribute();
		attribute.setName("G");
		attribute.setDescription("G的描述");
		attribute.setType((byte) 5);
		attribute.setValue("G1,G2,G3");
		catalogueService.saveSingleAttribute(attribute, 1010202);
		
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

	@Test
	public void testAddResource(){
		com.whut.wxcs.resmanager.model.Resource resource ;
		long id = 1010202;
		for(int i = 0 ; i < 50 ; i ++){
			resource = new com.whut.wxcs.resmanager.model.Resource();
			Catalogue catalogue = new Catalogue();
			catalogue.setId(id);
			Provider provider = new Provider();
			provider.setId(1);
			resource.setCatalogue(catalogue);
			resource.setResource_name("resource" + id +i );
			resource.setDescription("resource description_" + id + i);
			resource.setProvider(provider);
			
			resourceDao.saveEntity(resource);
		}
	}
	
	@Test
	public void testGetAttribute(){
		System.out.println(catalogueService.getEnumAttributesByTid(1010101));;
	}
	
	// 增加100个随机的provider
	@Test
	public void testInsertProvider(){
		Provider provider;
		
		
		for(int i = 0 ; i < 100 ; i ++){
			provider = new Provider();
			provider.setAddress(i+":"+this.getRandomString(20));
			provider.setCellphone(this.getRandomString(11));
			provider.setCertificationType("1");
			provider.setCheckState((int)(Math.random()*3));
			provider.setContects(i+":"+this.getRandomString(20));
			provider.setEmail(this.getRandomNumber(5)+"@163.com");
			provider.setFax(i+":"+this.getRandomString(20));
			provider.setGrade(1);
			provider.setIndustry(i+":"+this.getRandomString(20));
			provider.setLoginName(i+":"+this.getRandomString(10));
			provider.setLoginPwd(i+":"+this.getRandomString(20));
			provider.setName(i+":"+this.getRandomString(20));
			provider.setLogo(i+":"+this.getRandomString(20));
			provider.setQq(i+":"+this.getRandomString(20));
			provider.setRegisterTime(new Date(
					(long) (Math.random() * 2436007511596L)));
			provider.setPostcode(i+":"+this.getRandomString(20));
			provider.setProfile(this.getRandomNumber(8));
			provider.setUrl(i+":"+this.getRandomString(20));
			provider.setTelephone(this.getRandomNumber(11));
			provider.setScale(i+":"+this.getRandomString(20));
			
			providerService.saveEntity(provider);
		}
		
	}
	
	 public  String getRandomString(int length){
	     String str="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
	     Random random=new Random();
	     StringBuffer sb=new StringBuffer();
	     for(int i=0;i<length;i++){
	       int number=random.nextInt(62);
	       sb.append(str.charAt(number));
	     }
	     return sb.toString();
	 }
	 
	 public  String getRandomNumber(int length){
		 String str="0123456789";
		 Random random=new Random();
		 StringBuffer sb=new StringBuffer();
		 for(int i=0;i<length;i++){
			 int number=random.nextInt(10);
			 sb.append(str.charAt(number));
		 }
		 return sb.toString();
	 }
	 
	 @Test
	 public void test(){
		 for(int i = 0 ; i < 20 ; i ++){
			 System.out.println((int)(Math.random()*3));
		 }
	 }
	 
	 @Test
	 public void testNewCatalogue(){
		Catalogue parent =  catalogueService.getEntity(1207);
		System.out.println(parent.getName());
		String[] childStr = {
				"演出门票",
				"体育赛事",
				"景点/游乐园门票",
				"电影票",
				"消费卡/优惠券",
				"火车票",
				"飞机票",
				"汽车票",
				"船票",
				"彩票"
				};
		this.save(parent, childStr);
		System.out.println(childStr.length);
		
	 }
	 
	 public void save(Catalogue parent,String[] childStr){
		 Catalogue catalogue;
		 for(int i = 0 ; i < childStr.length ; i ++){
			 catalogue = new Catalogue();
			 catalogue.setParent(parent);
			 catalogue.setName(childStr[i]);
			 catalogueService.saveCatalogue(catalogue);
		 }
	 }
	 
	 
	
}
