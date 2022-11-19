package kr.co.lookst.seller.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.lookst.main.domain.SearchItem;
import kr.co.lookst.seller.domain.OrderListDto;
import kr.co.lookst.seller.domain.PrdtListDto;

@Repository
public class SellerDaoImpl implements SellerDao{

	@Autowired
	private SqlSession session;
	private static String namespace = "kr.co.lookst.seller.dao.SellerMapper.";
	
	
	@Override
	public OrderListDto selectOrderDetail(Integer prdt_order_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + "selectAll", prdt_order_no);
	}


	@Override
	public int searchResultCnt(SearchItem sc) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+"searchResultCnt", sc);
	}

	@Override
	public List<OrderListDto> searchSelectPage(SearchItem sc) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+"searchSelectPage", sc);
	}


	@Override
	public int searchResultCntP(SearchItem sc) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+"searchResultCntP", sc);
	}

	@Override
	public List<PrdtListDto> searchSelectPageP(SearchItem sc) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+"searchSelectPageP", sc);
	}

	@Override
	public int searchResultCntR(SearchItem sc) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+"searchResultCntR", sc);
	}
		
	
	@Override
	public List<OrderListDto> searchSelectPageR(SearchItem sc) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+"searchSelectPageR", sc);
	}



	
	
}
