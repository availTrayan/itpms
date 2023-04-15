package com.spring.itpms.admin.member.dao;

import java.util.List;

import com.spring.itpms.admin.member.dto.AdminDto;
import com.spring.itpms.member.dto.MemberDto;

public interface AdminMemberDao {
	
	public AdminDto selectAdminLogin(AdminDto adminDto) throws Exception;
	public List<MemberDto> selectListMember() throws Exception;

}
