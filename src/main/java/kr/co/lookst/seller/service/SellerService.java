package kr.co.lookst.seller.service;

import java.util.List;

import kr.co.lookst.seller.domain.OrderListDto;
import kr.co.lookst.seller.domain.PrdtListDto;

public interface SellerService {

	List<PrdtListDto> sellproductList() throws Exception;

	List<OrderListDto> sellorderList() throws Exception;
	 
}
