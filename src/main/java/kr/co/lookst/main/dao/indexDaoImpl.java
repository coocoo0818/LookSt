package kr.co.lookst.main.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.lookst.main.domain.IndexDto;
import kr.co.lookst.main.domain.Prdt_Img;
import kr.co.lookst.main.domain.Product;
import kr.co.lookst.main.domain.StylePickDto;

@Repository
public class indexDaoImpl implements indexDao{

	@Autowired
	private SqlSession session;
	private static String namespace = "kr.co.lookst.main.dao.AdminMapper.";

	@Override
	public List<IndexDto> newProductsInfo() throws Exception {
		return session.selectList(namespace + "newProductsInfo");
	}

	@Override
	public List<StylePickDto> stylePick() throws Exception {
		return session.selectList(namespace + "stylePick");
	}
}
