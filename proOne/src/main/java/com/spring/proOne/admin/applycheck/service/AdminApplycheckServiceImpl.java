package com.spring.proOne.admin.applycheck.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.spring.proOne.admin.applycheck.dao.AdminApplycheckDAO;
import com.spring.proOne.admin.member.dao.AdminMemberDAO;
import com.spring.proOne.member.vo.MemberVO;

@Service("adminApplycheckService")
public class AdminApplycheckServiceImpl implements AdminApplycheckService{
	@Autowired
	private AdminApplycheckDAO adminApplycheckDAO;
	
	
}
