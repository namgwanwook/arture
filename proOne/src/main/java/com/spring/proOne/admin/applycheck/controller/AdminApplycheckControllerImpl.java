package com.spring.proOne.admin.applycheck.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.proOne.admin.applycheck.service.AdminApplycheckService;
import com.spring.proOne.admin.member.service.AdminMemberService;
import com.spring.proOne.member.vo.MemberVO;
import com.spring.proOne.applyForm.vo.ArticleVO;
import com.spring.proOne.gallery.vo.ImageVO;

@Controller("adminApplycheckController")
@RequestMapping(value="/admin/applycheck")
public class AdminApplycheckControllerImpl implements AdminApplycheckController{
	@Autowired
	private AdminApplycheckService adminApplycheckService;
	@Autowired
	ArticleVO articleVO;
	@Autowired
	ImageVO imageVO;
	
	@Override
	@RequestMapping(value="/applyList.do" ,method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView applyList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// TODO Auto-generated method stub
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
//		List<MemberVO> memberList = adminMemberService.listMembers();
//		mav.addObject("memberList", memberList);

		return mav;
	}
	
	@Override
	@RequestMapping(value="/applyView.do" ,method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView applyView(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// TODO Auto-generated method stub
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
//		List<MemberVO> memberList = adminMemberService.listMembers();
//		mav.addObject("memberList", memberList);
		
		return mav;
	}
	

}
