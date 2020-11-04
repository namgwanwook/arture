package com.spring.proOne.applyForm.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.proOne.applyForm.vo.ArticleVO;
import com.spring.proOne.gallery.vo.ImageVO;

@Repository("applyFormDAO")
public class applyFormDAOImpl implements applyFormDAO{
	@Autowired
	private SqlSession sqlSession;
	
	/*
	 * @Override public List<ArticleVO> selectAllArticlesList() throws Exception {
	 * List<ArticleVO> articlesList =
	 * sqlSession.selectList("mapper.applyForm.selectAllArticlesList"); return
	 * articlesList; }
	 */

	@Override
	public int insertNewArticle(Map<String, Object> articleMap) {
		int articleNO = selectNewArticleNO();
		articleMap.put("applyNO", articleNO);
		sqlSession.insert("mapper.applyForm.insertNewArticle", articleMap);
		return articleNO;
	}

	private int selectNewArticleNO() {
		// TODO Auto-generated method stub
		System.out.println(sqlSession.selectOne("mapper.applyForm.selectNewArticleNO"));
		int articleMAX = sqlSession.selectOne("mapper.applyForm.selectNewArticleNO");
		System.out.println("어플라이 DAO 아티클맥스 값 :"+articleMAX);
		return articleMAX;
	}

	@Override
	public ArticleVO selectArticle(int articleNO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.applyForm.selectArticle", articleNO);
	}

	@Override
	public void updateArticle(Map articleMap) {
		// TODO Auto-generated method stub
		sqlSession.update("mapper.applyForm.updateArticle", articleMap);
	}

	@Override
	public void deleteArticle(int articleNO) {
		// TODO Auto-generated method stub
		sqlSession.delete("mapper.applyForm.deleteArticle", articleNO);
	}

	@Override
	public void insertNewImage(Map<String, Object> articleMap) {
		// TODO Auto-generated method stub
		List<ImageVO> imageFileList = (ArrayList)articleMap.get("imageFileList");
		int articleNO = (Integer)articleMap.get("articleNO");
		int imageFileNO = selectNewImageFileNO();
		for (ImageVO imageVO : imageFileList) {
			imageVO.setImageNO(++imageFileNO);
			imageVO.setApplyNO(articleNO);
		}
		sqlSession.insert("mapper.applyForm.insertNewImage", imageFileList);
	}

	private int selectNewImageFileNO() {
		return sqlSession.selectOne("mapper.applyForm.selectNewImageFileNO");
	}
}
