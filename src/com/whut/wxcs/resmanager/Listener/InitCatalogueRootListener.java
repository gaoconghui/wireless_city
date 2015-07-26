package com.whut.wxcs.resmanager.Listener;

import javax.annotation.Resource;

import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

import com.whut.wxcs.resmanager.service.CatalogueService;

@Component
public class InitCatalogueRootListener implements ApplicationListener {

	@Resource
	CatalogueService catalogueService;
	
	@Override
	public void onApplicationEvent(ApplicationEvent arg0) {
		System.out.println("初始化root类目");
		catalogueService.initCatalogue();
	}

	


}
