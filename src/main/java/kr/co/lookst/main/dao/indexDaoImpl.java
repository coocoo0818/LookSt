package kr.co.lookst.main.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.lookst.main.domain.Product;

@Repository
public class indexDaoImpl implements indexDao{

	@Autowired
	private SqlSession session;
	private static String namespace = "kr.co.lookst.main.dao.AdminMapper.";
	
	@Override
	public List<Product> newProducts() throws Exception {
		return session.selectList(namespace + "newProducts");
	}
}
