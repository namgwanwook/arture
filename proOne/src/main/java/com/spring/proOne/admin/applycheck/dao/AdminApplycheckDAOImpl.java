package com.spring.proOne.admin.applycheck.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.proOne.applyForm.vo.ArticleVO;
import com.spring.proOne.gallery.vo.ImageVO;

@Repository("adminApplycheckDAO")
public class AdminApplycheckDAOImpl implements AdminApplycheckDAO{
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<ArticleVO> selectAllList() {
		List<ArticleVO> applysList = sqlSession.selectList("mapper.admin_applycheck.selectAllLists");
		return applysList;
	}

	@Override
	public ArticleVO selectApplycation(int applyNO) {
		// TODO Auto-generated method stub
		ArticleVO getApply = sqlSession.selectOne("mapper.admin_applycheck.selectApplycation", applyNO);
		return getApply;
	}

	@Override
	public List<ImageVO> selectApplyImages(int applyNO) {
		// TODO Auto-generated method stub
		List<ImageVO> getApplyImages = sqlSession.selectList("mapper.admin_applycheck.selectImageFileList", applyNO);
		System.out.println("DAO getApplyImages : " + getApplyImages.get(0));
		return getApplyImages;
	}
	@Override
	public int insertToGallery(int applyNO) {
		int result = sqlSession.insert("mapper.admin_applycheck.insertGallery", applyNO);
		return result;
	}
	
	@Override
	public int deleteApplyform(int applyNO) {
		int result = sqlSession.delete("mapper.admin_applycheck.deleteApplyform", applyNO);
		System.out.println("apply DAO deleteApplyForm 확인");
		return result;
	}
	
	@Override
	public int deleteImageFile(int applyNO) {
		int result = sqlSession.delete("mapper.admin_applycheck.deleteImageFile", applyNO);
		System.out.println("apply DAO deleteImageFile 확인");
		return result;
	}
	
}
