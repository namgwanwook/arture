package com.spring.proOne.admin.notice.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.spring.proOne.admin.notice.vo.NoticeVO;

public interface AdminNoticeDAO {

	List<NoticeVO> selectAllList();

	int insertNotice(NoticeVO noticeVO) throws DataAccessException;

	int deleteNotice(int no) throws DataAccessException;

	int updateNotice(NoticeVO notice);

	NoticeVO selectNotice(int noticeNO);

}
