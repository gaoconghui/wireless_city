package com.whut.wxcs.resmanager.struts.action;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletContext;

import org.apache.struts2.util.ServletContextAware;

import com.whut.wxcs.resmanager.action.BaseAction;
import com.whut.wxcs.resmanager.model.Resource;
import com.whut.wxcs.resmanager.service.ResourceService;
import com.whut.wxcs.resmanager.util.ValidateUtil;

public class FileAction extends BaseAction<Resource> implements
		ServletContextAware {

	private static final long serialVersionUID = -1001957915183126301L;

	private File logoPhoto;
	private String logoPhotoFileName;
	private String logoPhotoContentType;

	private InputStream inputStream;

	@javax.annotation.Resource
	private ResourceService resourceService;
	private ServletContext servletContext;

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public File getLogoPhoto() {
		return logoPhoto;
	}

	public void setLogoPhoto(File logoPhoto) {
		this.logoPhoto = logoPhoto;
	}

	public String getLogoPhotoFileName() {
		return logoPhotoFileName;
	}

	public void setLogoPhotoFileName(String logoPhotoFileName) {
		this.logoPhotoFileName = logoPhotoFileName;
	}

	public String getLogoPhotoContentType() {
		return logoPhotoContentType;
	}

	public void setLogoPhotoContentType(String logoPhotoContentType) {
		this.logoPhotoContentType = logoPhotoContentType;
	}

	public String uploadPicture() {
		if (ValidateUtil.isVaild(logoPhotoFileName)) {
			String dir = servletContext.getRealPath("/upload");
			String ext = logoPhotoFileName.substring(logoPhotoFileName
					.lastIndexOf("."));
			long l = System.nanoTime();
			File newFile = new File(dir, l + ext);
			// 文件另存为
			logoPhoto.renameTo(newFile);
			resourceService.updateResourcePicturePath(newFile.getName(),
					model.getId());
		}
		try {
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "ajax-success";
	}

	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}

}
