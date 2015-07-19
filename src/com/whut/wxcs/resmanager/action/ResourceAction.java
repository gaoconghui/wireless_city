package com.whut.wxcs.resmanager.action;

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

	public long getBrsid() {
		return brsid;
	}

	public void setBrsid(long brsid) {
		this.brsid = brsid;
	}

	/**
	 * 使服务商账号通过审核
	 */
	public String passCheck() {
		System.out.println(model.getId());
		model = resourceService.getEntity(model.getId());
		model.setCheckState(1);
		resourceService.saveOrUpdateEntity(model);
		return "resourceListAction";
	}

	/**
	 * 使服务商账号下架
	 */
	public String offCheck() {
		System.out.println(model.getId());
		model = resourceService.getEntity(model.getId());
		model.setCheckState(0);
		resourceService.saveOrUpdateEntity(model);
		return "resourceListAction";
	}

}