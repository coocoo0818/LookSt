package kr.co.lookst.seller.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.lookst.main.domain.Product;
import kr.co.lookst.main.domain.SearchItem;
import kr.co.lookst.seller.FileUtils;
import kr.co.lookst.seller.dao.SellerDao;
import kr.co.lookst.seller.domain.MySalesDto;
import kr.co.lookst.seller.domain.OrderListDto;
import kr.co.lookst.seller.domain.PrdtListDto;
import kr.co.lookst.seller.domain.SellerDto;
import lombok.extern.log4j.Log4j;


@Service
public class SellerServiceImpl implements SellerService {

	@Autowired
	SellerDao sellerDao;
	
	@Autowired
	//private FileUtils fileUtils;

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
	
	// 주문 상태 변경
	@Override
	public int OrderStatusMod(Integer prdt_order_no, String orderStatus) throws Exception {
		// TODO Auto-generated method stub
		return sellerDao.OrderStatusMod(prdt_order_no, orderStatus);
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
	
	// 상품 재고 수량 변경	
	@Override
	public int productStock(Integer product_no, int stock) throws Exception {
		// TODO Auto-generated method stub
		return sellerDao.productStock(product_no, stock);
	}
	
	// 상품 삭제	
	@Override
	public int productDelete(Integer product_no) throws Exception {
		// TODO Auto-generated method stub
		return sellerDao.productDelete(product_no);
	}

	// 취소, 환불, 반품 리스트
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

	// 취소, 환불, 반품 상태 변경
	@Override
	public int ReqOrderStatusMod(Integer prdt_order_no, String ReqOrderStatus) throws Exception {
		// TODO Auto-generated method stub
		return sellerDao.ReqOrderStatusMod(prdt_order_no, ReqOrderStatus);
	}

	// 나의 매출 - 신규주문(결제완료)
	@Override
	public List<MySalesDto> newSale() throws Exception {
		// TODO Auto-generated method stub
		return sellerDao.newSale();
	}

	// 나의 매출 - 취소접수
	@Override
	public List<MySalesDto> newCancel() throws Exception {
		// TODO Auto-generated method stub
		return sellerDao.newCancel();
	}

	// 나의 매출 - 금액 표시 수정중
	@Override
	public MySalesDto todaySale() throws Exception {
		// TODO Auto-generated method stub
		return sellerDao.todaySale();
	}

	// 상품 등록 - 수정중
//	@Override
//	public void ProductRegister(Product product) throws Exception {
//		// TODO Auto-generated method stub
//		sellerDao.ProductRegister(product);
//	}


}
