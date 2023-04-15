package com.spring.itpms.myPage.service;

import java.util.List;
import java.util.Map;

import com.spring.itpms.member.dto.MemberDto;
import com.spring.itpms.myPage.dto.CartDto;
import com.spring.itpms.myPage.dto.FavorDto;

public interface MyPageService {
	
	public MemberDto getMyInfo(String memberId) throws Exception;
	public void modifyMyInfo(MemberDto memberDto) throws Exception;
	public void removeMember(String memberId) throws Exception;
	public boolean checkDuplicatedCart(CartDto cartDto) throws Exception;
	public void addCart(CartDto cartDto) throws Exception;
	public List<Map<String, Object>> getMyCartList(String memberId) throws Exception;
	public int countCartList(String memberId) throws Exception;
	public void removeCart(int[] deleteCartCdList) throws Exception;
	public void modifyCartGoodsQty(Map<String, Object> updateMap) throws Exception;
	public List<Map<String,Object>> getMyOrderList(String memberId) throws Exception;
	public Map<String,Object> getMyOrderDetail(Map<String,Object> orderDetailMap) throws Exception;
	public boolean checkDuplicatedFavor(FavorDto favorDto) throws Exception;
	public void addFavor(FavorDto favorDto) throws Exception;
	public List<Map<String, Object>> getMyFavorList(String memberId) throws Exception;
	public void removeFavor(int[] deleteFavorCdList) throws Exception;
	public int countFavorList(String memberId) throws Exception;



}
