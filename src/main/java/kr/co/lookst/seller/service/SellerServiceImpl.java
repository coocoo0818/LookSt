package kr.co.lookst.seller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import kr.co.lookst.seller.dao.SellerDao;
import kr.co.lookst.seller.domain.OrderListDto;
import kr.co.lookst.seller.domain.PrdtListDto;


@Service
public class SellerServiceImpl implements SellerService{

	@Autowired
	SellerDao sellerDao;


	@Override
	public List<PrdtListDto> sellproductList() throws Exception {
		// TODO Auto-generated method stub
		return sellerDao.selectPrdt();
	}


	@Override
	public List<OrderListDto> sellorderList() throws Exception {
		// TODO Auto-generated method stub
		return sellerDao.selectOrder();
	}


	@Override
	public List<OrderListDto> sellrefundList() throws Exception {
		// TODO Auto-generated method stub
		return sellerDao.selectRequest();
	}
	
	

}
