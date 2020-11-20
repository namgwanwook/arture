package com.spring.proOne.member.controller;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;


public class SessionConfig  implements HttpSessionListener{
	
	 private static final Map<String, HttpSession> sessions = new ConcurrentHashMap<>();

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		// TODO Auto-generated method stub
		System.out.println(se);
		 sessions.put(se.getSession().getId(), se.getSession());
		
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent hse) {
		// TODO Auto-generated method stub
		if(sessions.get(hse.getSession().getId()) != null){
            sessions.get(hse.getSession().getId()).invalidate();
            sessions.remove(hse.getSession().getId());	
        }
	}

}
