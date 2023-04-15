package com.spring.itpms.member.dao;

import com.spring.itpms.member.dto.MemberDto;

public interface MemberDao {
	
	public void insertMember(MemberDto memberDto) throws Exception;
	public String selectDuplicatedId(String memberId) throws Exception;
	public MemberDto selectLogin(MemberDto memberDto) throws Exception;
	public int selectMyCartCnt(String memberId) throws Exception;
	public int selectMyOrderCnt(String memberId) throws Exception;
	public int selectMyFavorCnt(String memberId) throws Exception;

}
