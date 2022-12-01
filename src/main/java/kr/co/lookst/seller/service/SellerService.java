package kr.co.lookst.seller.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.lookst.main.domain.Product;
import kr.co.lookst.main.domain.SearchItem;
import kr.co.lookst.seller.domain.MySalesDto;
import kr.co.lookst.seller.domain.OrderListDto;
import kr.co.lookst.seller.domain.PrdtListDto;
import kr.co.lookst.seller.domain.SellerDto;


public interface SellerService {

	// 주문 리스트
	int getSearchResultCnt(SearchItem sc) throws Exception;

	List<OrderListDto> getsearchResultPage(SearchItem sc) throws Exception;
	
	// 주문 상태 변경
	int OrderStatusMod(Integer prdt_order_no, String orderStatus) throws Exception;

	// 상품 리스트	
	int getSearchResultCntP(SearchItem sc) throws Exception;

	List<PrdtListDto> getsearchResultPageP(SearchItem sc) throws Exception;
	
	// 상품 재고 수량 변경
	int productStock(Integer product_no, int stock) throws Exception;

	// 상품 삭제	
	int productDelete(Integer product_no) throws Exception;

	// 취소, 환불, 반품 리스트	
	int getSearchResultCntR(SearchItem sc) throws Exception;

	List<OrderListDto> getsearchResultPageR(SearchItem sc) throws Exception;

	// 취소, 환불, 반품 상태 변경	
	int ReqOrderStatusMod(Integer prdt_order_no, String ReqOrderStatus) throws Exception;

	// 나의 매출 - 신규주문(결제완료)
	List<MySalesDto> newSale() throws Exception;
	
	// 나의 매출 - 취소접수
	List<MySalesDto> newCancel() throws Exception;
	
	// 나의 매출 - 금액 표시 수정중	
	MySalesDto todaySale() throws Exception;

	// 상품 등록 - 수정중
    //public void ProductRegister(Product product) throws Exception;

}
