package com.spring.itpms.common.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.itpms.common.dto.ContactDto;
import com.spring.itpms.common.dto.NoticeDto;

@Repository
public class CommonDaoImpl implements CommonDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertContact(ContactDto contactDto) throws Exception {
		sqlSession.insert("common.insertContact", contactDto);
	}

	@Override
	public List<ContactDto> selectListContact() throws Exception {
		return sqlSession.selectList("common.selectListContact");
	}

	@Override
	public void deleteContact(int[] deleteContactCdList) throws Exception {

		sqlSession.delete("common.deleteContact",deleteContactCdList );
	}

	@Override
	public void insertNotice(NoticeDto noticeDto) throws Exception {
		sqlSession.insert("common.insertNotice", noticeDto);
		
	}

	@Override
	public List<NoticeDto> selectListNotice() throws Exception {
		return sqlSession.selectList("common.selectListNotice");
	}

	@Override
	public void deleteNotice(int[] deleteNoticeCdList) throws Exception {
		sqlSession.delete("common.deleteNotice",deleteNoticeCdList );
		
	}

	@Override
	public ContactDto selectOneContact(int contactCd) throws Exception {
		return sqlSession.selectOne("common.selectOneContact", contactCd);
	}

	@Override
	public NoticeDto selectOneNotice(int noticeCd) throws Exception {
		return sqlSession.selectOne("common.selectOneNotice", noticeCd);
	}

	@Override
	public int selectOneNewProductCnt() throws Exception {
		return sqlSession.selectOne("common.selectOneNewProductCnt");
	}

	@Override
	public int selectOneGeneralProductCnt() throws Exception {
		return sqlSession.selectOne("common.selectOneGeneralProductCnt");

	}

	@Override
	public int selectOneBestProductCnt() throws Exception {
		return sqlSession.selectOne("common.selectOneBestProductCnt");
	}

	@Override
	public List<Map<String, Object>> selectListGoodsNewProducts() throws Exception {
		return sqlSession.selectList("common.selectListGoodsNewProducts");
	}

	@Override
	public List<Map<String, Object>> selectListGoodsBestProducts() throws Exception {
		return sqlSession.selectList("common.selectListGoodsBestProducts");

	}

	@Override
	public List<Map<String, Object>> selectListGoodsGeneralProducts() throws Exception {
		return sqlSession.selectList("common.selectListGoodsGeneralProducts");
	}

}
