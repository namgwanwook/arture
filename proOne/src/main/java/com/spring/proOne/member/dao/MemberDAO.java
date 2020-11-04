package com.spring.proOne.member.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.spring.proOne.member.vo.MemberVO;

public interface MemberDAO {
	// 모든 회원들의 리스트 조회
	 public List selectAllMemberList() throws DataAccessException;
	 // id를 통해 회원정보조회
	 public MemberVO selectById(String id) throws DataAccessException ;
	 // 회원가입을 통해 새 회원을 추가
	 public int insertMember(MemberVO memberVO) throws DataAccessException ;
	 // 회원탈퇴 또는 관리자의 권한으로 회원 삭제
	 public int deleteMember(String id) throws DataAccessException;
	 // 아이디로 로그인
	 public MemberVO loginById(MemberVO memberVO);
	 // id중복확인
	 public String selectOverlappedID(String id) throws DataAccessException;
}
