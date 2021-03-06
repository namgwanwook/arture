package com.spring.proOne.gallery.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.proOne.gallery.vo.GalleryVO;

@Repository("galleryDAO")
public class GalleryDAOImpl implements GalleryDAO {
	@Autowired
	private SqlSession sqlSession;
	
	//mapper에서 SQL문 실행 후 값 받아옴
	@Override
	public List selectGallery() throws DataAccessException {
		List<GalleryVO> galleryList = null;
		galleryList = sqlSession.selectList("mapper.gallery.selectGalleryList");
		return galleryList;
	}
	 

	@Override
	public List selectDetailGallery(int num) throws DataAccessException {
		List<GalleryVO> detailgallery = null;
		detailgallery = sqlSession.selectList("mapper.gallery.selectGallery",num);
		return detailgallery;
	}

	@Override
	public int selectlike(int galleryNO) throws DataAccessException {		
		int like;
			like = sqlSession.selectOne("mapper.gallery.selectLike",galleryNO);
			System.out.println(like); 
		return like;
	}
	
}
