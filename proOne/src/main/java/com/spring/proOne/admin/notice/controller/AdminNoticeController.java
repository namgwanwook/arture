package com.spring.proOne.admin.notice.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.spring.proOne.admin.notice.vo.NoticeVO;

public interface AdminNoticeController {
	public ModelAndView noticeList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView form(String no, String action, HttpServletRequest request, HttpServletResponse response)
			throws Exception;
	public ModelAndView addNewNotice(NoticeVO notice, HttpServletRequest request, HttpServletResponse response)
			throws Exception;
	public ModelAndView modNotice(NoticeVO notice, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView noticeView(int noticeNO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView removeNotice(int no, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
