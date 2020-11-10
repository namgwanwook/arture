package com.spring.proOne.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.proOne.main.service.MainService;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.proOne.admin.notice.service.AdminNoticeService;
import com.spring.proOne.admin.notice.vo.NoticeVO;
import com.spring.proOne.gallery.service.GalleryService;
import com.spring.proOne.gallery.vo.GalleryVO;
import com.spring.proOne.gallery.vo.ImageVO;
import com.spring.proOne.main.service.MainService;


@Controller("mainController")
public class MainControllerImpl implements MainController{
	private static final String GALLERY_IMAGE_REPO = "C:\\o_image\\galleryimage";
	
	@Autowired
	GalleryVO galleryVO;
	@Autowired
	MainService mainService;
	@Autowired
	AdminNoticeService noticeService;

	@RequestMapping(value="/main/main.do", method=RequestMethod.GET)
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		
		List<NoticeVO> noticeList = noticeService.listNotieces();
		mav.addObject("noticeList", noticeList);
		
		
		//경호꺼 mapper에서 select o_gallery from galleryNO 받아온다음, applyNO로 매칭해서 해당 넘버가 start가 1으로 가정시. 1 2 3 인경우 해당 넘버에 해당되는 폴더 경로의 이미지 출력.
		
		
		
		
		
		
		List<GalleryVO> galleryList = mainService.galleryList();
		
		mav.addObject("galleryList", galleryList);
		
		System.out.println("galleryList :" +galleryList);
		
		
		System.out.println(viewName);
		mav.setViewName(viewName);
		return mav;
	}
	
	
	
}