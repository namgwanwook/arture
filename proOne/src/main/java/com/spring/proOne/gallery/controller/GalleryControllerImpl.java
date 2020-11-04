package com.spring.proOne.gallery.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.spring.proOne.gallery.service.GalleryService;
import com.spring.proOne.gallery.vo.GalleryVO;

@Controller("galleryController")
@EnableAspectJAutoProxy
public class GalleryControllerImpl extends MultiActionController implements GalleryController{
	@Autowired
	private GalleryService galleryService;
	@Autowired
	GalleryVO galleryVO;
	
	//갤러리 페이지 표시
	@Override
	@RequestMapping(value = "/gallery/gallery.do",method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView GalleryList(HttpServletRequest request,HttpServletResponse response) {
		// 뷰네임 받아옴
		String viewName = (String) request.getAttribute("viewName");
		
		// 서비스에 갤러리 리스트 받아옴
		List galleryList = galleryService.listGallerys();			
		List like = new ArrayList<Integer>();
		for(int i=0;i<galleryList.size();i++) {			
			like.add(galleryService.like(i));
		}
		System.out.println("라이크값c" + like);
		ModelAndView mav = new ModelAndView();		
		mav.addObject("galleryList",galleryList);
		mav.addObject("like",like);
		mav.setViewName(viewName);

		return mav;
	}

	//디테일 페이지로 이동
	@Override
	@RequestMapping(value = "/gallery/detail.do",method = RequestMethod.GET)
	public ModelAndView detailPage(@RequestParam("num")int num, HttpServletRequest request, HttpServletResponse response){
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		List detailGallery = galleryService.detailGallery(num);
		mav.addObject("detailGallery",detailGallery);
		return mav;
	}
}
