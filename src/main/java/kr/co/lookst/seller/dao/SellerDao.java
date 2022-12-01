package kr.co.lookst.seller.dao;

import java.util.List;
import java.util.Map;

import kr.co.lookst.main.domain.Product;
import kr.co.lookst.main.domain.SearchItem;
import kr.co.lookst.seller.domain.MySalesDto;
import kr.co.lookst.seller.domain.OrderListDto;
import kr.co.lookst.seller.domain.PrdtListDto;
import kr.co.lookst.seller.domain.SellerDto;


public interface SellerDao {

	// 주문 리스트
	int searchResultCnt(SearchItem sc) throws Exception;

	List<OrderListDto> searchSelectPage(SearchItem sc) throws Exception;

	
	// 주문 상태 변경
	int OrderStatusMod(Integer prdt_order_no, String orderStatus) throws Exception;
	
	
	// 상품 리스트
	int searchResultCntP(SearchItem sc) throws Exception;

	List<PrdtListDto> searchSelectPageP(SearchItem sc) throws Exception;
	
	
	// 상품 재고 수량 변경
	int productStock(Integer product_no, int stock) throws Exception;
	// 상품 삭제
	int productDelete(Integer product_no) throws Exception;
	
	
	// 취소, 환불, 반품 리스트
	int searchResultCntR(SearchItem sc) throws Exception;

	List<OrderListDto> searchSelectPageR(SearchItem sc) throws Exception;

	
	// 취소, 환불, 반품 상태 변경
	int ReqOrderStatusMod(Integer prdt_order_no, String ReqOrderStatus) throws Exception;

	
	// 나의 매출 - 신규주문(결제완료)
	List<MySalesDto> newSale() throws Exception;
	
	// 나의 매출 - 취소접수
	List<MySalesDto> newCancel() throws Exception;
	
	// 나의 매출 - 금액 표시 수정중
	MySalesDto todaySale() throws Exception;

	
	// 상품 등록 - 수정중
	//public int ProductRegister(Product product) throws Exception;

	

	
}
