package com.spring.itpms.admin.goods.dao;

import java.util.List;

import com.spring.itpms.goods.dto.GoodsDto;

public interface AdminGoodsDao {
	
	public List<GoodsDto> selectListGoods() throws Exception;
	public void insertGoods(GoodsDto goodsDto) throws Exception;
	public void updateGoods(GoodsDto goodsDto) throws Exception;
	public void deleteGoods(int goodsCd) throws Exception;

}
