package kr.co.lookst.seller.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.lookst.main.domain.Product;
import kr.co.lookst.main.domain.SearchItem;
import kr.co.lookst.seller.domain.MySalesDto;
import kr.co.lookst.seller.domain.OrderListDto;
import kr.co.lookst.seller.domain.PrdtListDto;
import kr.co.lookst.seller.domain.SellerDto;

@Repository
public class SellerDaoImpl implements SellerDao {

	@Autowired
	private SqlSession session;
	private static String namespace = "kr.co.lookst.seller.dao.SellerMapper.";

	// 주문 리스트	
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

	
	// 주문 상태 변경
	@Override
	public int OrderStatusMod(Integer prdt_order_no, String orderStatus) throws Exception {
		Map map = new HashMap();
		map.put("prdt_order_no", prdt_order_no);
		map.put("orderStatus", orderStatus);
		return session.update(namespace + "OrderStatusMod", map);
	}
	
	// 상품 리스트	
	@Override
	public List<PrdtListDto> searchSelectPageP(SearchItem sc) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + "searchSelectPageP", sc);
	}
	
	@Override
	public int searchResultCntP(SearchItem sc) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + "searchResultCntP", sc);
	}
	
	// 상품 재고 수량 변경
	@Override
	public int productStock(Integer product_no, int stock) throws Exception {
		Map map = new HashMap();
		map.put("product_no", product_no);
		map.put("stock", stock);
		return session.update(namespace + "productStock", map);
	}
	
	// 상품 삭제	
	@Override
	public int productDelete(Integer product_no) throws Exception {
		// TODO Auto-generated method stub
		return session.delete(namespace + "productDelete", product_no);
	}
	
	// 취소, 환불, 반품 리스트	
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
	
	
	// 취소, 환불, 반품 상태 변경
	@Override
	public int ReqOrderStatusMod(Integer prdt_order_no, String ReqOrderStatus) throws Exception {
		Map map = new HashMap();
		map.put("prdt_order_no", prdt_order_no);
		map.put("ReqOrderStatus", ReqOrderStatus);
		return session.update(namespace + "ReqOrderStatusMod", map);
	}

	// 나의 매출 - 신규주문(결제완료)	
	@Override
	public List<MySalesDto> newSale() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + "NewSale");
	}
	
	// 나의 매출 - 취소접수
	@Override
	public List<MySalesDto> newCancel() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + "NewCancel");
	}

	// 나의 매출 - 오늘 매출 	
	@Override
	public int todaySale() throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + "TodayAmt");
	}

	// 나의 매출 - 이번 달 매출
	@Override
	public int monthSale() throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + "MonthAmt");
	}

	// 상품 등록 - 수정중
//	@Override
//	public int ProductRegister(Product product) throws Exception {
//		// TODO Auto-generated method stub
//		return session.insert(namespace + "ProductRegister");
//	}

	
}
