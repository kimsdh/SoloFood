package com.web.honbab.find.service;

import javax.servlet.http.HttpServletRequest;

public interface FindFileService {

	public static final String IMAGE_REVIEW = "D:\\HONBAB\\IMAGE_REPO\\REVIEW";
	public String getMessage(HttpServletRequest request, String msg, String url);

	public void deleteImage(String imageFileName);
	
	

}
