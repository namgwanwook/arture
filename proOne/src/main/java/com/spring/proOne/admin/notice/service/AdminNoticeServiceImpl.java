package com.spring.proOne.admin.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.spring.proOne.admin.notice.dao.AdminNoticeDAO;
import com.spring.proOne.admin.notice.vo.NoticeVO;

@Service("adminNoticeService")
public class AdminNoticeServiceImpl implements AdminNoticeService{
	@Autowired
	AdminNoticeDAO noticeDAO;

	@Override
	public List<NoticeVO> listNotieces() throws Exception{
		// TODO Auto-generated method stub
		List<NoticeVO> noticesList = noticeDAO.selectAllList();
		return noticesList;
	}
	
	@Override
	public void addNotice(NoticeVO notice) throws Exception{
		// TODO Auto-generated method stub
		noticeDAO.insertNotice(notice);
	}
	
	@Override
	public void removeNotice(int no) throws DataAccessException {
		noticeDAO.deleteNotice(no);
	}

	@Override
	public void modNotice(NoticeVO notice) {
		// TODO Auto-generated method stub
		noticeDAO.updateNotice(notice);
	}

	@Override
	public NoticeVO viewNotice(int noticeNO) {
		// TODO Auto-generated method stub
		NoticeVO noticeVO = noticeDAO.selectNotice(noticeNO);
		return noticeVO;
	}
}
