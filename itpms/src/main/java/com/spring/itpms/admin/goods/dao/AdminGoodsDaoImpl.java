package com.spring.itpms.admin.goods.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.itpms.goods.dto.GoodsDto;

@Repository
public class AdminGoodsDaoImpl implements AdminGoodsDao {
	
	@Autowired
	private SqlSession sqlsession;

	@Override
	public List<GoodsDto> selectListGoods() throws Exception {
		return sqlsession.selectList("admin.goods.selectListGoods");
	}

	@Override
	public void insertGoods(GoodsDto goodsDto) throws Exception {
		sqlsession.insert("admin.goods.insertGoods", goodsDto);
	}

	@Override
	public void updateGoods(GoodsDto goodsDto) throws Exception {
		sqlsession.update("admin.goods.updateGoods", goodsDto);
	}

	@Override
	public void deleteGoods(int goodsCd) throws Exception {
		sqlsession.delete("admin.goods.deleteGoods", goodsCd);
	}

}
