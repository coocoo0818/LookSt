package kr.co.lookst.seller.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.lookst.main.domain.SearchItem;
import kr.co.lookst.seller.dao.SellerDao;
import kr.co.lookst.seller.domain.MySalesDto;
import kr.co.lookst.seller.domain.OrderListDto;
import kr.co.lookst.seller.domain.PrdtListDto;

@Service
public class SellerServiceImpl implements SellerService {

	@Autowired
	SellerDao sellerDao;

	// 주문 리스트
	@Override
	public int getSearchResultCnt(SearchItem sc) throws Exception {
		// TODO Auto-generated method stub
		return sellerDao.searchResultCnt(sc);
	}

	@Override
	public List<OrderListDto> getsearchResultPage(SearchItem sc) throws Exception {
		// TODO Auto-generated method stub
		return sellerDao.searchSelectPage(sc);
	}

	// 상품 리스트
	@Override
	public int getSearchResultCntP(SearchItem sc) throws Exception {
		// TODO Auto-generated method stub
		return sellerDao.searchResultCntP(sc);
	}

	@Override
	public List<PrdtListDto> getsearchResultPageP(SearchItem sc) throws Exception {
		// TODO Auto-generated method stub
		return sellerDao.searchSelectPageP(sc);
	}

	// 상품 삭제
	@Override
	public int productDelete(Integer product_no) throws Exception {
		// TODO Auto-generated method stub
		return sellerDao.productDelete(product_no);
	}

	// 취소, 반품, 환불 리스트
	@Override
	public int getSearchResultCntR(SearchItem sc) throws Exception {
		// TODO Auto-generated method stub
		return sellerDao.searchResultCntR(sc);
	}

	@Override
	public List<OrderListDto> getsearchResultPageR(SearchItem sc) throws Exception {
		// TODO Auto-generated method stub
		return sellerDao.searchSelectPageR(sc);
	}

	// 상품 재고 수량 변경
	@Override
	public int productStock(Integer product_no, int stock) throws Exception {
		// TODO Auto-generated method stub
		return sellerDao.productStock(product_no, stock);
	}

	// 주문 상태 변경
	@Override
	public int OrderStatusMod(Integer prdt_order_no, String orderStatus) throws Exception {
		// TODO Auto-generated method stub
		return sellerDao.OrderStatusMod(prdt_order_no, orderStatus);
	}

	// 취소, 환불, 반품 상태 변경
	@Override
	public int ReqOrderStatusMod(Integer prdt_order_no, String ReqOrderStatus) throws Exception {
		// TODO Auto-generated method stub
		return sellerDao.ReqOrderStatusMod(prdt_order_no, ReqOrderStatus);
	}

	// 나의 매출 - 신규 접수 수량 표시
	@Override
	public List<MySalesDto> newSale() throws Exception {
		// TODO Auto-generated method stub
		return sellerDao.newSale();
	}

	// 나의 매출 - 취소 접수 수량 표시
	@Override
	public List<MySalesDto> newCancel() throws Exception {
		// TODO Auto-generated method stub
		return sellerDao.newCancel();
	}

	// 나의 매출 - 오늘 매출
	@Override
	public int todaySale() throws Exception {
		// TODO Auto-generated method stub
		return sellerDao.todaySale();
	}

	// 나의 매출 - 이번 달 매출
	@Override
	public int monthSale() throws Exception {
		// TODO Auto-generated method stub
		return sellerDao.monthSale();
	}


}
