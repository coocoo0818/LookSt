package kr.co.lookst.seller.dao;


import java.util.List;

import kr.co.lookst.seller.domain.PrdtListDto;

public interface SellerDao {

	List<PrdtListDto> select() throws Exception; 


	
	
}
