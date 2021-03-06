package com.spring.proOne.applyForm.dao;

import java.util.List;
import java.util.Map;

import com.spring.proOne.applyForm.vo.ArticleVO;

public interface applyFormDAO {
	/* public List<ArticleVO> selectAllArticlesList() throws Exception; */
	public int insertNewArticle(Map<String, Object> articleMap);
	public ArticleVO selectArticle(int articleNO);
	public void updateArticle(Map<String, Object> articleMap);
	public void deleteArticle(int articleNO);
	public void insertNewImage(Map<String, Object> articleMap);
}
