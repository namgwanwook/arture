package com.spring.proOne.member.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.spring.proOne.member.vo.MemberVO;

public interface MemberService {
	 public List listMembers() throws DataAccessException;
	 public MemberVO selectMemberById(String id) throws DataAccessException;
	 public int addMember(MemberVO memberVO) throws DataAccessException;
	 public int removeMember(String id) throws DataAccessException;
	 public MemberVO login(MemberVO memberVO) throws Exception;
	 public String overlapped(String id) throws Exception;
}
