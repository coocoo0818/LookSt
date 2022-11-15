package kr.co.lookst.seller.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.lookst.seller.domain.PrdtListDto;

@Repository
public class SellerDaoImpl implements SellerDao{

	@Autowired
	private SqlSession session;
	private static String namespace = "kr.co.lookst.seller.dao.SellerMapper.";
	
	@Override
	public List<PrdtListDto> select() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + "select");
	}

	
	

	
	
	
}
