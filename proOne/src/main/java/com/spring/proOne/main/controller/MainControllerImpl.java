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


@Controller("mainController")
public class MainControllerImpl implements MainController{
	
	@RequestMapping(value="/main/main.do", method=RequestMethod.GET)
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		System.out.println(viewName);
		mav.setViewName(viewName);
		return mav;
	}
	
	

	
}