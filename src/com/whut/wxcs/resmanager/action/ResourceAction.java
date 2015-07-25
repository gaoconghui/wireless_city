package com.whut.wxcs.resmanager.action;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.whut.wxcs.resmanager.model.Resource;
import com.whut.wxcs.resmanager.service.ResourceService;

@Controller
@Scope("prototype")
public class ResourceAction extends BaseAction<Resource> {

	private static final long serialVersionUID = 1L;

	@javax.annotation.Resource
	ResourceService resourceService;

	private long brsid;
	
	private String ids;

	
	
	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public long getBrsid() {
		return brsid;
	}

	public void setBrsid(long brsid) {
		this.brsid = brsid;
	}

	/**
	 * 使服务资源通过审核
	 */
	public String passCheck() {
		System.out.println(model.getId());
		resourceService.passListCheck(model.getId()+"");
//		model = resourceService.getEntity(model.getId());
//		model.setCheckState(1);
//		resourceService.saveOrUpdateEntity(model);
		
		return "resourceListAction";
	}

	/**
	 * 使服务资源下架
	 */
	public String offCheck() {
		System.out.println(model.getId());
		
		resourceService.offListCheck(model.getId()+"");
		
//		model = resourceService.getEntity(model.getId());
//		model.setCheckState(0);
//		resourceService.saveOrUpdateEntity(model);
		return "resourceListAction";
	}
	
	/**
	 * 服务资源批量通过
	 */
	public String passListCheck(){
		System.out.println(ids);
		resourceService.passListCheck(ids);
		return "resourceListAction";
	}
	
	/**
	 * 服务资源批量通过
	 */
	public String offListCheck(){
		System.out.println(ids);
		resourceService.offListCheck(ids);
		return "resourceListAction";
	}

}