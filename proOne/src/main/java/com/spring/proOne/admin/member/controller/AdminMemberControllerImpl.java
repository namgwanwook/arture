package com.spring.proOne.admin.member.controller;

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

import com.spring.proOne.admin.member.service.AdminMemberService;
import com.spring.proOne.member.vo.MemberVO;

@Controller("adminMemberController")
@RequestMapping(value="/admin/member")
public class AdminMemberControllerImpl implements AdminMemberController{
	@Autowired
	private AdminMemberService adminMemberService;
	@Autowired
	MemberVO memberVO;
	
	@Override
	@RequestMapping(value="/memberList.do" ,method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView memberList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// TODO Auto-generated method stub
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		List<MemberVO> memberList = adminMemberService.listMembers();
		mav.addObject("memberList", memberList);

		return mav;
	}
	
	@Override
	@RequestMapping(value="/mod_pwd.do", method=RequestMethod.POST)
	@ResponseBody
	public void modPassword(MemberVO temp, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		adminMemberService.modInfo(temp);
	}
	
	@Override
	@RequestMapping(value="/removeMember.do" ,method=RequestMethod.POST)
	public ModelAndView removeMember(@RequestParam("temp_ID" ) String ID, HttpServletRequest request, HttpServletResponse response) throws Exception{
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		adminMemberService.removeMember(ID);
		ModelAndView mav = new ModelAndView("redirect:/admin/member/memberList.do");
		return mav;
	}
}
