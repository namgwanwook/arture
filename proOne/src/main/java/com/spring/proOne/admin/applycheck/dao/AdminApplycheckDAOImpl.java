package com.spring.proOne.admin.applycheck.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.proOne.member.vo.MemberVO;

@Repository("adminApplycheckDAO")
public class AdminApplycheckDAOImpl implements AdminApplycheckDAO{
	@Autowired
	SqlSession sqlSession;
	
//	여기서부터 대대적인 수정 필요!!
	
	
	@Override
	public List<MemberVO> selectAllMember() {
		List<MemberVO> membersList = sqlSession.selectList("mapper.admin_applycheck.selectAllMembers");
		return membersList;
	}
	
	
}
