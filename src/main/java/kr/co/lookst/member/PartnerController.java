package kr.co.lookst.member;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.lookst.member.service.MemberService;
import kr.co.lookst.seller.domain.SellerDto;

@Controller
@RequestMapping("/partner")
public class PartnerController {
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService service;
	
	//판매자 정보 확인
	@GetMapping("/mypage")
	public String memberAuth(SellerDto sellDto, HttpServletRequest request, Model m, Principal principal) throws Exception {
		logger.info("MY PAGE - REG SELLER");
		String member_id = principal.getName();
			
			int cnt = service.checkSellerInfo(member_id);
			logger.info("cnt : " + cnt);
			
			if(cnt == 1) {
				SellerDto selectSellerInfo = service.selectSellerInfo(member_id);
				m.addAttribute("selectSellerInfo",selectSellerInfo);
				return "member/regSeller";
			}

		return "member/regSeller";
	}
	
	//판매자 정보 등록
	@PostMapping("/mypage")
	public String updateMember(SellerDto sellDto, HttpServletRequest request, Model m, Principal principal) throws Exception {
		String member_id = principal.getName();
		sellDto.setMember_id(member_id);
		logger.info("updateMember - " + member_id);

		int cnt = service.checkSellerInfo(member_id);
		logger.info("cnt : " + cnt);
		
		if(cnt == 1) {
			service.updateSellerInfo(sellDto);
			return "redirect:/partner/mypage";
		}	
		else {
			service.insertSellerInfo(sellDto);
			return "redirect:/partner/mypage";			
		}
	}
}
