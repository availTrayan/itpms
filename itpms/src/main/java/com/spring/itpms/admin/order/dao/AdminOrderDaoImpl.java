package com.spring.itpms.admin.order.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.itpms.goods.service.GoodsService;

@Repository
public class AdminOrderDaoImpl implements AdminOrderDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Map<String, Object>> selectListOrder() throws Exception {
		return sqlSession.selectList("admin.order.selectListOrder");
	}

}
