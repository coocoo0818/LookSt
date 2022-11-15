package kr.co.lookst.seller.dao;


import java.util.List;

import kr.co.lookst.seller.domain.OrderListDto;
import kr.co.lookst.seller.domain.PrdtListDto;

public interface SellerDao {

	List<PrdtListDto> selectPrdt() throws Exception; 


	List<OrderListDto> selectOrder() throws Exception;
	
	
	
}
