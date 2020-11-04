package com.spring.proOne.admin.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.proOne.member.vo.MemberVO;

@Repository("adminMemberDAO")
public class AdminMemberDAOImpl implements AdminMemberDAO{
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<MemberVO> selectAllMember() {
		List<MemberVO> membersList = sqlSession.selectList("mapper.admin_member.selectAllMembers");
		return membersList;
	}
	
	@Override
	public int modPwd(MemberVO temp) {
		int result = sqlSession.update("mapper.admin_member.updatePwd", temp);
		return result;
	}
	
	@Override
	public int deleteNotice(String id) throws DataAccessException {
		int result = sqlSession.delete("mapper.admin_member.deleteMember", id);
		return result;
	}
}
