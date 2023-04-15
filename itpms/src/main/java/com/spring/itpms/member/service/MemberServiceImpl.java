package com.spring.itpms.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.itpms.member.dao.MemberDao;
import com.spring.itpms.member.dto.MemberDto;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Override
	public void addMember(MemberDto memberDto) throws Exception {

		if (memberDto.getEmailstsYn() == null) memberDto.setEmailstsYn("N");
		if (memberDto.getSmsstsYn() == null) memberDto.setSmsstsYn("N");
		memberDao.insertMember(memberDto);
	}

	@Override
	public String checkDuplicatedId(String memberId) throws Exception {
		if (memberDao.selectDuplicatedId(memberId) == null) return "notDuplicated";
		else return "duplicated";
	}

	@Override
	public boolean login(MemberDto memberDto) throws Exception {
		
		MemberDto checkExsistId = memberDao.selectLogin(memberDto);
		
		if (checkExsistId != null) {
			if (bCryptPasswordEncoder.matches(memberDto.getPasswd(), checkExsistId.getPasswd())) {
				return true;
			}
		}
		
		return false;
	}

	@Override
	public int getMyCartCnt(String memberId) throws Exception {
		return memberDao.selectMyCartCnt(memberId);
	}

	@Override
	public int getMyOrderCnt(String memberId) throws Exception {
		return memberDao.selectMyOrderCnt(memberId);
	}

	@Override
	public int getMyFavorCnt(String memberId) throws Exception {
		return memberDao.selectMyFavorCnt(memberId);

	}
	
	

}
