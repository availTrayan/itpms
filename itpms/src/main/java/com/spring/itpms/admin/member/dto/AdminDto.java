package com.spring.itpms.admin.member.dto;

import org.springframework.stereotype.Component;

@Component
public class AdminDto {
	
	private	String adminId;
	private String passwd;
	
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	
	

}
