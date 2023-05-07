package com.spring.proOne.admin.notice.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Component
public class NoticeVO {
	private int no;
	private String title;
	private String content;
	private Date writeDate;
	
	public NoticeVO() {	}
	public NoticeVO(String title, String content) {
		this.title = title;
		this.content = content;
	}
}
