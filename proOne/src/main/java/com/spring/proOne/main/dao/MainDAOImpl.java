package com.spring.proOne.main.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.proOne.gallery.vo.GalleryVO;

@Repository("mainDAO")
public class MainDAOImpl implements MainDAO{
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List selectGalleryInfo() throws Exception {
		List galleryList = sqlSession.selectList("mapper.main.selectGalleryInfo");
		System.out.println("DAO List1 : " + galleryList);
		System.out.println("DAO List2 : " + sqlSession.selectList("mapper.main.selectGalleryInfo"));
		return galleryList;
	}
	
}
