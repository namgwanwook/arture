package com.spring.proOne.admin.applycheck.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.spring.proOne.member.vo.MemberVO;

public interface AdminApplycheckController {

	public ModelAndView applyList(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView applyView(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
