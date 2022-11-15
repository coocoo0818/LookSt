package kr.co.lookst.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.annotation.SessionScope;

import kr.co.lookst.member.domain.MemberDto;
import kr.co.lookst.member.service.MemberService;

@Controller
public class MemberController {	
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService service;
	
	@RequestMapping("/login")
	public String login() {
		logger.info("LOGIN PAGE");
		return "member/login";
	}
	
	@PostMapping("/login")
	public String memberLogin(MemberDto dto, HttpServletRequest request) {
		logger.info("LOGIN");
		//세션 생성
		HttpSession session = request.getSession();
		MemberDto res = service.login(dto);

		if(res.getMember_id() != null) {
			//세션 저장
			session.setAttribute("res", res.getMember_id());
			System.out.println(session.getAttribute("res"));
			return "redirect:/";
		} else {

			System.out.println(res);
			return "redirect:/login";
		}
	}
	
	@GetMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/";
    }

}
