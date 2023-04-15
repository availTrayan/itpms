package com.spring.itpms.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.itpms.member.dto.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	private SqlSession sqlsession;

	@Override
	public void insertMember(MemberDto memberDto) throws Exception {
		sqlsession.insert("member.insertMember", memberDto);
	}

	@Override
	public String selectDuplicatedId(String memberId) throws Exception {
		return sqlsession.selectOne("member.selectDuplicatedId", memberId);
	}

	@Override
	public MemberDto selectLogin(MemberDto memberDto) throws Exception {
		
		return sqlsession.selectOne("member.selectLogin", memberDto);
	}

	@Override
	public int selectMyCartCnt(String memberId) throws Exception {
		
		return sqlsession.selectOne("member.selectMyCartCnt", memberId);
	}

	@Override
	public int selectMyOrderCnt(String memberId) throws Exception {
		return sqlsession.selectOne("member.selectMyOrderCnt", memberId);
	}

	@Override
	public int selectMyFavorCnt(String memberId) throws Exception {
		return sqlsession.selectOne("member.selectMyFavorCnt", memberId);

	}

}
