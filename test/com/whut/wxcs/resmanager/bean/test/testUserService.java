package com.whut.wxcs.resmanager.bean.test;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.whut.wxcs.resmanager.dao.impl.UserDaoImpl;


public class testUserService {

	
	
	@BeforeClass
	public static void iniUserService(){
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
//		userService = (UserServiceImpl) applicationContext.getBean("userService");
		System.out.println(applicationContext);
	}
	
	@Test
	public void testUserService1(){
//		User user = new User(); 
//		System.out.println(userService);
	}
}
