package kr.co.lookst.seller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/seller")
public class SellerController {

	@GetMapping("/orderList")
	public String adminForm() {
		return "seller/orderList";

	}
	
	@GetMapping("/refundList")
	public String adminForm1() {
		return "seller/refundList";

	}
	
	@GetMapping("/testorder")
	public String adminForm3() {
		return "seller/testorder";

	}
}
