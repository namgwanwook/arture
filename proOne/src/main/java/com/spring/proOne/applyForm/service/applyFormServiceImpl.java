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
		int applyNO = applyFormDAO.insertNewArticle(articleMap);
		articleMap.put("applyNO",	applyNO);
		applyFormDAO.insertNewImage(articleMap);
		
		// 아무튼 applyNO넘겨줘야함
		return applyNO;
	}
	
//	@Override
//	public ArticleVO viewArticle(int applyNO) {
//		ArticleVO articleVO = applyFormDAO.selectArticle(applyNO);
//		return articleVO;
//	}

//	@Override
//	public void modArticle(Map<String, Object> articleMap) {
//		applyFormDAO.updateArticle(articleMap);
//	}

	



		
}
