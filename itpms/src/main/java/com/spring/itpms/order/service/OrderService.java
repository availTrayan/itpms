package com.spring.itpms.order.service;

import java.util.List;
import java.util.Map;

import com.spring.itpms.goods.dto.GoodsDto;
import com.spring.itpms.member.dto.MemberDto;
import com.spring.itpms.order.dto.OrderDto;

public interface OrderService {
	
	public MemberDto getOrdererDetail(String memberId) throws Exception;
	public GoodsDto getGoodsDetail(int goodsCd) throws Exception;
	public void addOrder(OrderDto orderDto, int point) throws Exception;
	public List<GoodsDto> getGoodsListByCart(int[] goodsCdList) throws Exception;
	public void addOrderByCart(Map<String, String> orderListMap) throws Exception;
}
