package kr.co.lookst.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@GetMapping("/member_management")
	public String adminFormMember() {
		return "admin/member_management";
	}
	
	@GetMapping("/board_management")
	public String adminFormBoard() {
		return "admin/board_management";
	}
	
	@GetMapping("/sns_management")
	public String adminFormSns() {
		return "admin/sns_management";
	}
	
	@GetMapping("/magazin_request")
	public String adminFormMagazinRequest() {
		return "admin/magazin_request";
	}
	
	@GetMapping("/seller_request")
	public String adminFormSellerRequest() {
		return "admin/seller_request";
	}
}
