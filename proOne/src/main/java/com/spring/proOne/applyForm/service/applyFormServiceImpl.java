package com.spring.proOne.applyForm.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.proOne.applyForm.dao.applyFormDAO;
import com.spring.proOne.applyForm.vo.ArticleVO;

@Service("applyFormService")
@Transactional(propagation = Propagation.REQUIRED)
public class applyFormServiceImpl implements applyFormService{
	@Autowired
	applyFormDAO applyFormDAO;
	
	/*
	 * @Override public List listArticles() throws Exception { List<ArticleVO>
	 * articlesList = applyFormDAO.selectAllArticlesList(); return articlesList; }
	 */

	@Override
	public int addNewArticle(Map<String, Object> articleMap) {
		int articleNO = applyFormDAO.insertNewArticle(articleMap);
		articleMap.put("articleNO",	articleNO);
		applyFormDAO.insertNewImage(articleMap);
		return articleNO;
	}
	
	@Override
	public ArticleVO viewArticle(int articleNO) {
		ArticleVO articleVO = applyFormDAO.selectArticle(articleNO);
		return articleVO;
	}

	@Override
	public void modArticle(Map<String, Object> articleMap) {
		applyFormDAO.updateArticle(articleMap);
	}

	@Override
	public void removeArticle(int articleNO) {
		applyFormDAO.deleteArticle(articleNO);
	}



		
}
