package kr.co.lookst.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.lookst.admin.domain.MemMGMDto;
import kr.co.lookst.admin.service.AdminService;
import kr.co.lookst.main.domain.PageResolver;
import kr.co.lookst.main.domain.SearchItem;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	/* 회원 리스트 */
	@GetMapping("/member_management")
	public String adminFormMember(SearchItem sc,Model model) {
		try {
			/* 회원 페이징 시작 */
			int totalCnt = adminService.getSearchResultCnt(sc);
			model.addAttribute("totalCnt", totalCnt);
			PageResolver pageResolver = new PageResolver(totalCnt, sc);
			/* 회원 페이징 끝 */
			
			/* 회원 리스트 출력 */
			List<MemMGMDto> member_management = adminService.getsearchResultPage(sc);
			model.addAttribute("member_management", member_management);
			model.addAttribute("pr", pageResolver);
			/* 회원 리스트 끝 */
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/member_management";
	}
	
	/* 회원 권한 변경 */
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
	/* 회원 강퇴 */
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
	
	@RequestMapping(value="/board_management", method=RequestMethod.GET)
	public String adminFormBoard() {
		return "admin/board_management";
	}
	
	@RequestMapping(value="/sns_management", method=RequestMethod.GET)
	public String adminFormSns() {
		return "admin/sns_management";
	}
	
	@RequestMapping(value="/magazin_request", method=RequestMethod.GET)
	public String adminFormMagazinRequest() {
		return "admin/magazin_request";
	}
	
	@RequestMapping(value="/seller_request", method=RequestMethod.GET)
	public String adminFormSellerRequest() {
		return "admin/seller_request";
	}
}
