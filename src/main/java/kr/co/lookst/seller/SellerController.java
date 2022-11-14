package kr.co.lookst.seller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import kr.co.lookst.main.domain.Product;
import kr.co.lookst.seller.domain.PrdtListDto;
import kr.co.lookst.seller.service.SellerService;

@Controller
@RequestMapping("/seller")
public class SellerController {

	@Autowired
	SellerService sellerService;
	
	
	@GetMapping("/prdtList")
	public String adminForm3(Model m) {
		try {
			
			List<PrdtListDto> list = sellerService.sellproductList();
			m.addAttribute("list", list);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "seller/prdtList";

	}
	
	
	
	
	@GetMapping("/orderList")
	public String adminForm() {
		return "seller/orderList";

	}
	
	@GetMapping("/refundList")
	public String adminForm1() {
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
