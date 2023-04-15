package com.spring.itpms.admin.member.service;

import java.util.List;

import com.spring.itpms.admin.member.dto.AdminDto;
import com.spring.itpms.member.dto.MemberDto;

public interface AdminMemberService {
	
	public boolean adminLogin(AdminDto adminDto) throws Exception;
	public List<MemberDto> getMemberList() throws Exception;

}
