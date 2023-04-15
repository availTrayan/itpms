package com.spring.itpms.admin.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.itpms.admin.member.dao.AdminMemberDao;
import com.spring.itpms.admin.member.dto.AdminDto;
import com.spring.itpms.member.dto.MemberDto;

@Service
public class AdminMemberServiceImpl implements AdminMemberService {
	
	@Autowired
	private AdminMemberDao adminMemberDao;

	@Override
	public boolean adminLogin(AdminDto adminDto) throws Exception {
		
		if (adminMemberDao.selectAdminLogin(adminDto) != null) {
			return true;
		}
		
		return false;
		
	}

	@Override
	public List<MemberDto> getMemberList() throws Exception {
		return adminMemberDao.selectListMember();
	}

}
