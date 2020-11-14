package com.spring.proOne.main.vo;

import org.springframework.stereotype.Component;

@Component("mainVO")
public class MainVO {
	private int galleryNO;
	private int galleryLike;
	
	public MainVO() {
		System.out.println("MainVO 생성자");
	}
	
	
	public int getGalleryNO() {
		return galleryNO;
	}
	public void setGalleryNO(int galleryNO) {
		this.galleryNO = galleryNO;
	}
	public int getGalleryLike() {
		return galleryLike;
	}
	public void setGalleryLike(int galleryLike) {
		this.galleryLike = galleryLike;
	}
}
