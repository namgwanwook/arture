package com.spring.proOne.gallery.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("imageVO")
public class ImageVO {
	private int imageNO;
	private String imageFileName;
	private Date regDate;
	private int applyNO;

	public int getImageNO() {
		return imageNO;
	}
	public void setImageNO(int imageNO) {
		this.imageNO = imageNO;
	}
	public String getImageFileName() {
		return imageFileName;
	}
	public void setImageFileName(String imageFileName) {
		try {
			if(imageFileName!= null && imageFileName.length()!=0) {
				this.imageFileName = URLEncoder.encode(imageFileName,"UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getApplyNO() {
		return applyNO;
	}
	public void setApplyNO(int applyNO) {
		this.applyNO = applyNO;
	}
	
	
}
