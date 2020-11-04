package com.spring.proOne.admin.applycheck.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.spring.proOne.member.vo.MemberVO;

public interface AdminApplycheckDAO {

	List<MemberVO> selectAllMember();

	

}
