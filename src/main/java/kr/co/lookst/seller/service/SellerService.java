package kr.co.lookst.seller.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.lookst.board.domain.Board_imgDto;
import kr.co.lookst.main.domain.Prdt_Img;
import kr.co.lookst.main.domain.Prdt_Option;
import kr.co.lookst.main.domain.Product;
import kr.co.lookst.main.domain.SearchItem;
import kr.co.lookst.seller.domain.MySalesDto;
import kr.co.lookst.seller.domain.OrderListDto;
import kr.co.lookst.seller.domain.PrdtListDto;


public interface SellerService {

	// 주문 리스트
	int getSearchResultCnt(SearchItem sc) throws Exception;

	List<OrderListDto> getsearchResultPage(SearchItem sc) throws Exception;

	// 상품 리스트
	int getSearchResultCntP(SearchItem sc) throws Exception;

	List<PrdtListDto> getsearchResultPageP(SearchItem sc) throws Exception;

	// 상품 삭제
	int productDelete(Integer product_no) throws Exception;
	
	// 상품 재고 수량 변경
	int productStock(Integer product_no, int stock) throws Exception;
	
	// 취소, 반품, 환불 리스트
	int getSearchResultCntR(SearchItem sc) throws Exception;

	List<OrderListDto> getsearchResultPageR(SearchItem sc) throws Exception;

	// 주문 상태 변경
	int OrderStatusMod(Integer prdt_order_no, String orderStatus) throws Exception;

	// 취소, 반품, 환불 상태 변경
	int ReqOrderStatusMod(Integer prdt_order_no, String ReqOrderStatus) throws Exception;

	// 나의 매출 - 신규접수 (결제완료) 수량 표시
	List<MySalesDto> newSale() throws Exception;
	
	// 나의 매출 - 취소접수 수량 표시 
	List<MySalesDto> newCancel() throws Exception;

	// 나의 매출 - 오늘 매출 
	int todaySale() throws Exception;

	// 나의 매출 - 이번 달 매출
	int monthSale() throws Exception;

	int insertproduct(Product product) throws Exception;

	int insertprdtOpt(Prdt_Option prdt_option) throws Exception;

	void insertprdtImg(List<Prdt_Img> prdt_img) throws Exception;

	
}
