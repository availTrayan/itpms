package com.spring.itpms.myPage.dao;

import java.util.List;
import java.util.Map;

import com.spring.itpms.member.dto.MemberDto;
import com.spring.itpms.myPage.dto.CartDto;
import com.spring.itpms.myPage.dto.FavorDto;

public interface MyPageDao {
	
	public MemberDto selectOneMyInfo(String memberId) throws Exception;
	public void updateMyInfo(MemberDto memberDto) throws Exception;
	public void deleteMember(String memberId) throws Exception;
	public CartDto selectOneDuplicatedCart(CartDto cartDto) throws Exception;
	public void insertCart(CartDto cartDto) throws Exception;
	public List<Map<String, Object>> selectListMyCart(String memberId) throws Exception;
	public int selectCountMyCart(String memberId) throws Exception;
	public void deleteCart(int[] deleteCartCdList) throws Exception;
	public void updateCartGoodsQty(Map<String, Object> updateMap) throws Exception;
	public List<Map<String,Object>> selectListMyOrder(String memberId) throws Exception;
	public Map<String,Object> selectOneMyOrder(Map<String,Object> orderDetailMap) throws Exception;
	public FavorDto selectOneDuplicatedFavor(FavorDto favorDto) throws Exception;
	public void insertFavor(FavorDto favorDto) throws Exception;
	public List<Map<String, Object>> selectListMyFavor(String memberId) throws Exception;
	public void deleteFavor(int[] deleteFavorCdList) throws Exception;
	public int selectCountMyFavor(String memberId) throws Exception;
	public void deleteCartListByRemoveMember(String memberId) throws Exception;
	public void deleteOrderListByRemoveMember(String memberId) throws Exception;
	public void deleteFavorListByRemoveMember(String memberId) throws Exception;

}
