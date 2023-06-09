package com.spring.itpms.myPage.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.itpms.member.dto.MemberDto;
import com.spring.itpms.myPage.dao.MyPageDao;
import com.spring.itpms.myPage.dto.CartDto;
import com.spring.itpms.myPage.dto.FavorDto;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageDao myPageDao;
	
	@Override
	public MemberDto getMyInfo(String memberId) throws Exception {
		return myPageDao.selectOneMyInfo(memberId);
	}

	@Override
	public void modifyMyInfo(MemberDto memberDto) throws Exception {

		if (memberDto.getSmsstsYn() == null) memberDto.setSmsstsYn("N");
		if (memberDto.getEmailstsYn() == null) memberDto.setEmailstsYn("N");
		myPageDao.updateMyInfo(memberDto);
	}

	@Override
	public void removeMember(String memberId) throws Exception {

		myPageDao.deleteMember(memberId);
		myPageDao.deleteCartListByRemoveMember(memberId);
		myPageDao.deleteFavorListByRemoveMember(memberId);
		myPageDao.deleteOrderListByRemoveMember(memberId);
	}

	@Override
	public boolean checkDuplicatedCart(CartDto cartDto) throws Exception {
		if (myPageDao.selectOneDuplicatedCart(cartDto) == null) return false;
		else return true;
	}

	@Override
	public void addCart(CartDto cartDto) throws Exception {

		myPageDao.insertCart(cartDto);
	}

	@Override
	public List<Map<String, Object>> getMyCartList(String memberId) throws Exception {
		return myPageDao.selectListMyCart(memberId);
	}

	@Override
	public int countCartList(String memberId) throws Exception {
		return myPageDao.selectCountMyCart(memberId);
	}

	@Override
	public void removeCart(int[] deleteCartCdList) throws Exception {
		
		myPageDao.deleteCart(deleteCartCdList);
	}

	@Override
	public void modifyCartGoodsQty(Map<String, Object> updateMap) throws Exception {

		myPageDao.updateCartGoodsQty(updateMap);
	}

	@Override
	public List<Map<String, Object>> getMyOrderList(String memberId) throws Exception {
		return myPageDao.selectListMyOrder(memberId);
	}

	@Override
	public Map<String, Object> getMyOrderDetail(Map<String, Object> orderDetailMap) throws Exception {
		return myPageDao.selectOneMyOrder(orderDetailMap);
	}

	@Override
	public void addFavor(FavorDto favorDto) throws Exception {
		myPageDao.insertFavor(favorDto);
	}

	@Override
	public List<Map<String, Object>> getMyFavorList(String memberId) throws Exception {
		return myPageDao.selectListMyFavor(memberId);
	}

	@Override
	public void removeFavor(int[] deleteFavorCdList) throws Exception {
		myPageDao.deleteFavor(deleteFavorCdList);
		
	}

	@Override
	public boolean checkDuplicatedFavor(FavorDto favorDto) throws Exception {
		if (myPageDao.selectOneDuplicatedFavor(favorDto) == null) return false;
		else return true;
	}

	@Override
	public int countFavorList(String memberId) throws Exception {
		return myPageDao.selectCountMyFavor(memberId);

	}
}
