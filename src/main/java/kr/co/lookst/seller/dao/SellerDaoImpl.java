package kr.co.lookst.seller.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.lookst.main.domain.SearchItem;
import kr.co.lookst.seller.domain.MySalesDto;
import kr.co.lookst.seller.domain.OrderListDto;
import kr.co.lookst.seller.domain.PrdtListDto;

@Repository
public class SellerDaoImpl implements SellerDao {

	@Autowired
	private SqlSession session;
	private static String namespace = "kr.co.lookst.seller.dao.SellerMapper.";

	@Override
	public int searchResultCnt(SearchItem sc) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + "searchResultCnt", sc);
	}

	@Override
	public List<OrderListDto> searchSelectPage(SearchItem sc) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + "searchSelectPage", sc);
	}

	@Override
	public int searchResultCntP(SearchItem sc) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + "searchResultCntP", sc);
	}

	@Override
	public List<PrdtListDto> searchSelectPageP(SearchItem sc) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + "searchSelectPageP", sc);
	}

	@Override
	public int productDelete(Integer product_no) throws Exception {
		// TODO Auto-generated method stub
		return session.delete(namespace + "productDelete", product_no);
	}

	@Override
	public int searchResultCntR(SearchItem sc) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + "searchResultCntR", sc);
	}

	@Override
	public List<OrderListDto> searchSelectPageR(SearchItem sc) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + "searchSelectPageR", sc);
	}

	@Override
	public int productStock(Integer product_no, int stock) throws Exception {
		Map map = new HashMap();
		map.put("product_no", product_no);
		map.put("stock", stock);
		return session.update(namespace + "productStock", map);
	}

	@Override
	public int OrderStatusMod(Integer prdt_order_no, String orderStatus) throws Exception {
		Map map = new HashMap();
		map.put("prdt_order_no", prdt_order_no);
		map.put("orderStatus", orderStatus);
		return session.update(namespace + "OrderStatusMod", map);
	}

	@Override
	public int ReqOrderStatusMod(Integer prdt_order_no, String ReqOrderStatus) throws Exception {
		Map map = new HashMap();
		map.put("prdt_order_no", prdt_order_no);
		map.put("ReqOrderStatus", ReqOrderStatus);
		return session.update(namespace + "ReqOrderStatusMod", map);
	}

	@Override
	public List<MySalesDto> newSale() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + "NewSale");
	}

	@Override
	public List<MySalesDto> newCancel() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + "NewCancel");
	}

//	@Override
//	public MySalesDto todaySale() throws Exception {
//		// TODO Auto-generated method stub
//		return session.selectOne(namespace + "TodayAmt");
//	}

}
