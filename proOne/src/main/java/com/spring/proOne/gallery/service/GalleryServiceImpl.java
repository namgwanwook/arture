package com.spring.proOne.gallery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.proOne.gallery.dao.GalleryDAO;

@Service("galleryService")
@Transactional(propagation = Propagation.REQUIRED)
public class GalleryServiceImpl implements GalleryService {
	@Autowired
	private GalleryDAO galleryDAO;
	
	//galleryDAO에서 값을 받아와서 리스트에 저정
	@Override
	public List listGallerys() throws DataAccessException {
		List galleryList = null;
		galleryList = galleryDAO.selectGallery();
		return galleryList;
	}
	
	public int like(int galleryNO) throws DataAccessException {
		int like;
		like = galleryDAO.selectlike(galleryNO);
		System.out.println("라이크값s" + like);
		return like;
	}

	@Override
	public List detailGallery(int num) throws DataAccessException {
		List detailgallery = null;
		detailgallery = galleryDAO.selectDetailGallery(num);
		return detailgallery;
	}
}
