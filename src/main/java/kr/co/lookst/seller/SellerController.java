package kr.co.lookst.seller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import kr.co.lookst.main.domain.Product;
import kr.co.lookst.seller.domain.OrderListDto;
import kr.co.lookst.seller.domain.PrdtListDto;
import kr.co.lookst.seller.service.SellerService;

@Controller
@RequestMapping("/seller")
public class SellerController {

	@Autowired
	SellerService sellerService;
	
	
	@GetMapping("/prdtList")
	public String prdtpage(Model m) {
		try {
			
			List<PrdtListDto> prdtlist = sellerService.sellproductList();
			m.addAttribute("prdtlist", prdtlist);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "seller/prdtList";

	}
	
	
	
	
	@GetMapping("/orderList")
	public String orderpage(Model m) {
		
		
		try {
			List<OrderListDto> orderlist = sellerService.sellorderList();
			m.addAttribute("orderlist", orderlist);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "seller/orderList";

	}
	
	
	
	
	
	
	@GetMapping("/refundList")
	public String refundpage(Model m) {
		
		try {
			List<OrderListDto> refundlist = sellerService.sellrefundList();
			m.addAttribute("refundlist", refundlist);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "seller/refundList";

	}
	
	
	@GetMapping("/registerPrdt")
	public String adminForm4() {
		return "seller/registerPrdt";

	}
	
	@GetMapping("/mySales")
	public String adminForm5() {
		return "seller/mySales";

	}
}
