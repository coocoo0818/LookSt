package kr.co.lookst.seller.dao;

import java.util.List;
import java.util.Map;

import kr.co.lookst.main.domain.SearchItem;
import kr.co.lookst.seller.domain.OrderListDto;
import kr.co.lookst.seller.domain.PrdtListDto;

public interface SellerDao {

	int searchResultCnt(SearchItem sc) throws Exception;

	List<OrderListDto> searchSelectPage(SearchItem sc) throws Exception;

	int searchResultCntP(SearchItem sc) throws Exception;

	List<PrdtListDto> searchSelectPageP(SearchItem sc) throws Exception;

	int productDelete(Integer product_no) throws Exception;

	int searchResultCntR(SearchItem sc) throws Exception;

	List<OrderListDto> searchSelectPageR(SearchItem sc) throws Exception;

	int productStock(Integer product_no, int stock) throws Exception;

	int OrderStatusMod(Integer prdt_order_no, String orderStatus) throws Exception;

	int ReqOrderStatusMod(Integer prdt_order_no, String ReqOrderStatus) throws Exception;



}
