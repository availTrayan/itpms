package com.spring.itpms.admin.goods.service;

import java.util.List;

import com.spring.itpms.goods.dto.GoodsDto;

public interface AdminGoodsService {
	public List<GoodsDto> getGoodsList() throws Exception;
	public void addNewGoods(GoodsDto goodsDto) throws Exception;
	public void modifyGoods(GoodsDto goodsDto) throws Exception;
	public void removeGoods(int goodsCd) throws Exception;

}
