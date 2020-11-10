package com.spring.proOne.applyForm.service;

import java.util.List;
import java.util.Map;

import com.spring.proOne.applyForm.vo.ArticleVO;

public interface applyFormService {
	/* public List listArticles() throws Exception; */
	public int addNewArticle(Map<String, Object> articleMap);
//	public ArticleVO viewArticle(int applyNO);
//	public void modArticle(Map<String, Object> articleMap);
}
