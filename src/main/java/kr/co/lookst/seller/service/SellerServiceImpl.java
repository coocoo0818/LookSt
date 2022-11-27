package kr.co.lookst.seller.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.lookst.main.domain.SearchItem;
import kr.co.lookst.seller.dao.SellerDao;
import kr.co.lookst.seller.domain.OrderListDto;
import kr.co.lookst.seller.domain.PrdtListDto;

@Service
public class SellerServiceImpl implements SellerService {

	@Autowired
	SellerDao sellerDao;

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

	@Override
	public int productDelete(Integer product_no) throws Exception {
		// TODO Auto-generated method stub
		return sellerDao.productDelete(product_no);
	}

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

	@Override
	public int productStock(Integer product_no, int stock) throws Exception {
		// TODO Auto-generated method stub
		return sellerDao.productStock(product_no, stock);
	}

	@Override
	public int OrderStatusMod(Integer prdt_order_no, String orderStatus) throws Exception {
		// TODO Auto-generated method stub
		return sellerDao.OrderStatusMod(prdt_order_no, orderStatus);
	}

	@Override
	public int ReqOrderStatusMod(Integer prdt_order_no, String ReqOrderStatus) throws Exception {
		// TODO Auto-generated method stub
		return sellerDao.ReqOrderStatusMod(prdt_order_no, ReqOrderStatus);
	}

	@Override
	public OrderListDto orderDetail(Integer prdt_order_no) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("serv" + prdt_order_no);
		return sellerDao.orderDetail(prdt_order_no);
	}

}
