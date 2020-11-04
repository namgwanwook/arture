package com.spring.proOne.admin.notice.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.proOne.admin.notice.service.AdminNoticeService;
import com.spring.proOne.admin.notice.vo.NoticeVO;

@Controller("adminNoticeController")
@RequestMapping(value="/admin/notice")
/* @EnableAspectJAutoProxy */
public class AdminNoticeControllerImpl implements AdminNoticeController{

	@Autowired
	AdminNoticeService noticeService;
	@Autowired
	NoticeVO noticeVO;
	
	@Override
	@RequestMapping(value="/noticeList.do" ,method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView noticeList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// TODO Auto-generated method stub
		System.out.println("controller --------------");
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		List<NoticeVO> noticeList = noticeService.listNotieces();
		
		mav.addObject("noticeList", noticeList);
		System.out.println("------------- controller");
		return mav;
	}
	
	@Override
	@RequestMapping(value="/addNewNotice.do" ,method = RequestMethod.POST)
	public ModelAndView addNewNotice(@ModelAttribute("notice") NoticeVO notice, HttpServletRequest request, HttpServletResponse response) throws Exception{
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		noticeService.addNotice(notice);
		ModelAndView mav = new ModelAndView("redirect:/admin/notice/noticeList.do");
		return mav;
	}
	
	@Override
	@RequestMapping(value="/removeNotice.do" ,method=RequestMethod.POST)
	public ModelAndView removeNotice(@RequestParam("noticeNO" ) int no, HttpServletRequest request, HttpServletResponse response) throws Exception{
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		noticeService.removeNotice(no);
		ModelAndView mav = new ModelAndView("redirect:/admin/notice/noticeList.do");
		return mav;
	}
	
	@Override
	@RequestMapping(value="/modNotice.do" ,method = RequestMethod.POST)
	public ModelAndView modNotice(@ModelAttribute("notice") NoticeVO notice, HttpServletRequest request, HttpServletResponse response) throws Exception{
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		System.out.println("----------  mod   ---------------");
		System.out.println("no : " + notice.getNo());
		System.out.println("title : " + notice.getTitle());
		System.out.println("content : " + notice.getContent());
		System.out.println("writeDate : " + notice.getWriteDate());
		
		noticeService.modNotice(notice);
		ModelAndView mav = new ModelAndView("redirect:/admin/notice/noticeList.do");
		return mav;
	}
	
	@Override
	@RequestMapping(value="/noticeView.do" ,method = RequestMethod.GET)
	public ModelAndView noticeView(@RequestParam("noticeNO") int noticeNO, HttpServletRequest request, HttpServletResponse response) throws Exception{
		// TODO Auto-generated method stub
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		noticeVO = noticeService.viewNotice(noticeNO);
		mav.addObject("notice", noticeVO);
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/*Form.do", method =  RequestMethod.GET)
	public ModelAndView form(@RequestParam(value= "no", required=false) String no,
			  				@RequestParam(value= "action", required=false) String action, 
							HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

}
