package com.spring.itpms.common.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class NoticeDto {
	
	private int noticeCd;
	private String subject;
	private String content;
	private Date regDt;
	
	public int getNoticeCd() {
		return noticeCd;
	}
	public void setNoticeCd(int noticeCd) {
		this.noticeCd = noticeCd;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDt() {
		return regDt;
	}
	public void setRegDt(Date regDt) {
		this.regDt = regDt;
	}

	
}
