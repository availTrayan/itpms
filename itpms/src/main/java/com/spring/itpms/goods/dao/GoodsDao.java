package com.spring.itpms.goods.dao;

import java.util.List;
import java.util.Map;

import com.spring.itpms.goods.dto.GoodsDto;

public interface GoodsDao {
	
	public GoodsDto selectOneGoods(int goodsCd) throws Exception;
	public List<GoodsDto> selectGoodsList(Map<String, String> goodsListMap) throws Exception;
	public List<GoodsDto> selectRelatedGoodsList(Map<String, Object> goodsMap) throws Exception;
	public List<GoodsDto> selectListSearchGoods(Map<String, Object> searchMap) throws Exception;

}
