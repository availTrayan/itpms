package com.spring.itpms.myPage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.itpms.member.dto.MemberDto;
import com.spring.itpms.myPage.dto.CartDto;
import com.spring.itpms.myPage.dto.FavorDto;

@Repository
public class MyPageDaoImpl implements MyPageDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberDto selectOneMyInfo(String memberId) throws Exception {
		
		return sqlSession.selectOne("myPage.selectOneMyInfo", memberId);
	}

	@Override
	public void updateMyInfo(MemberDto memberDto) throws Exception {

		sqlSession.update("myPage.updateMyInfo", memberDto);
	}

	@Override
	public void deleteMember(String memberId) throws Exception {
		sqlSession.delete("myPage.deleteMember", memberId);
	}

	@Override
	public CartDto selectOneDuplicatedCart(CartDto cartDto) throws Exception {
		return sqlSession.selectOne("myPage.selectOneDuplicatedCart", cartDto);
	}

	@Override
	public void insertCart(CartDto cartDto) throws Exception {
		
		sqlSession.insert("myPage.insertCart", cartDto);
	}

	@Override
	public List<Map<String, Object>> selectListMyCart(String memberId) throws Exception {
		return sqlSession.selectList("myPage.selectListMyCart", memberId);
	}

	@Override
	public int selectCountMyCart(String memberId) throws Exception {
		return sqlSession.selectOne("myPage.selectCountMyCart", memberId);
	}

	@Override
	public void deleteCart(int[] deleteCartCdList) throws Exception {

		sqlSession.delete("myPage.deleteCart", deleteCartCdList);
	}

	@Override
	public void updateCartGoodsQty(Map<String, Object> updateMap) throws Exception {

		sqlSession.update("myPage.updateCartGoodsQty", updateMap);
	}

	@Override
	public List<Map<String, Object>> selectListMyOrder(String memberId) throws Exception {
		return sqlSession.selectList("myPage.selectListMyOrder" , memberId);

	}

	@Override
	public Map<String, Object> selectOneMyOrder(Map<String, Object> orderDetailMap) throws Exception {
		return sqlSession.selectOne("myPage.selectOneMyOrder" , orderDetailMap);

	}

	@Override
	public FavorDto selectOneDuplicatedFavor(FavorDto favorDto) throws Exception {
		return sqlSession.selectOne("myPage.selectOneDuplicatedFavor", favorDto);

	}

	@Override
	public void insertFavor(FavorDto favorDto) throws Exception {
		sqlSession.insert("myPage.insertFavor", favorDto);
		
	}

	@Override
	public List<Map<String, Object>> selectListMyFavor(String memberId) throws Exception {
		return sqlSession.selectList("myPage.selectListMyFavor", memberId);

	}

	@Override
	public void deleteFavor(int[] deleteFavorCdList) throws Exception {
		sqlSession.delete("myPage.deleteFavor", deleteFavorCdList);
		
	}

	@Override
	public int selectCountMyFavor(String memberId) throws Exception {
		return sqlSession.selectOne("myPage.selectCountMyFavor", memberId);

	}

	@Override
	public void deleteCartListByRemoveMember(String memberId) throws Exception {
		sqlSession.delete("myPage.deleteCartListByRemoveMember" , memberId);
	}

	@Override
	public void deleteOrderListByRemoveMember(String memberId) throws Exception {
		sqlSession.delete("myPage.deleteOrderListByRemoveMember" , memberId);
	}

	@Override
	public void deleteFavorListByRemoveMember(String memberId) throws Exception {
		sqlSession.delete("myPage.deleteFavorListByRemoveMember" , memberId);
		
	}
}
