package kr.co.lookst.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.lookst.admin.service.AdminService;
import kr.co.lookst.main.domain.IndexDto;
import kr.co.lookst.main.domain.PageResolver;
import kr.co.lookst.main.domain.SearchItem;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@GetMapping("/member_management")
	public String adminFormMember(SearchItem sc,Model model) {
		try {
			
			int totalCnt = adminService.getSearchResultCnt(sc);
			model.addAttribute("totalCnt", totalCnt);
			PageResolver pageResolver = new PageResolver(totalCnt, sc);
			
			List<IndexDto> member_management = adminService.getMemberList();
			model.addAttribute("member_management", member_management);
			model.addAttribute("pr", pageResolver);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/member_management";
	}
	
	@RequestMapping(value="/authModify", method={RequestMethod.POST})
	public String adminFormMemberModify(Model model,  
			@RequestParam("member_id") String member_id,
			@RequestParam("auth") String Auth) {
		System.out.println(member_id);
		System.out.println(Auth);
		
		try {
			adminService.authModify(member_id, Auth);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/admin/member_management";
	}
	
	@RequestMapping(value="/memberKickOut", method={RequestMethod.POST})
	public String adminFormMemberKickOut(Model model,  
			@RequestParam("member_id") String member_id) {
		System.out.println(member_id);
		
		try {
			adminService.memberKickOut(member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/admin/member_management";
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
