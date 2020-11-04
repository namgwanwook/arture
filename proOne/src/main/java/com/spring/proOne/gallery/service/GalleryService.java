package com.spring.proOne.gallery.service;

import java.util.List;

import org.springframework.dao.DataAccessException;


public interface GalleryService {
	//갤러리 정보를 담을 리스트
	public List listGallerys()throws DataAccessException;
	
	//디테일 페이지 정보를 담는 리스트
	public List detailGallery(int num)throws DataAccessException;

	public int like(int galleryNO)throws DataAccessException;

}
