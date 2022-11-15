package kr.co.lookst.shop;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/shop")
public class ShopController {

	@GetMapping("/order")
	public String snsForm() {
		return "shop/order";
	}
	@GetMapping("/productdetail")
	public String myProfile() {
		return "shop/productdetail";
	}
	@GetMapping("/orderHistory")
	public String myProfile1() {
		return "shop/orderHistory";
	}
	@GetMapping("/productList")
	public String myProfile2() {
		return "shop/productList";
	}
	
}
