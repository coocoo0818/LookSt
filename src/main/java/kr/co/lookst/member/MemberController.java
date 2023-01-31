package kr.co.lookst.member;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.lookst.member.domain.MemberDto;
import kr.co.lookst.member.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {	
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService service;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	//로그인
	@GetMapping("/login")
	public String getLogin(Principal principal) throws Exception {
		logger.info("LOGIN PAGE");
		return "member/login";
	}
	
	//시큐리티 미적용 로그인
//	@PostMapping("/login")
//	public String postLogin(MemberDto dto, MemAuthDto authdto, HttpServletRequest request) throws Exception {
//		logger.info("LOGIN");
//		//세션 생성
//		HttpSession session = request.getSession();
//		MemberDto res = service.login(dto);
//		String member_id = res.getMember_id();
//		MemAuthDto auth = service.authCheck(member_id);
//		
//		if(res.getMember_id() != null) {
//			//세션 저장
//			session.setAttribute("res", res.getMember_id());
//			session.setAttribute("auth", auth);
//			System.out.println("로그인 아이디 : " + session.getAttribute("res"));
//			System.out.println("회원 권한 : " + session.getAttribute("auth"));
//			return "redirect:/";
//		} else {
//			System.out.println(res);
//			return "redirect:/login";
//		}
//	}

	@PostMapping("/loginCheck")
	@ResponseBody
	public int loginCheck(@RequestBody MemberDto dto) throws Exception {
		logger.info("loginCheck");
		String inputPw = dto.getMember_pw();
		System.out.println("로그인 시도 아이디 : " + dto.getMember_id());
		System.out.println("로그인 시도 비밀번호 : " + inputPw);
		MemberDto memberDto = service.login(dto);
		System.out.println(memberDto);
		
		//로그인 체크 (1:성공, 0:실패)
		if(memberDto != null) {
			System.out.println("DB에 저장된 비밀번호 : " + memberDto.getMember_pw());
			boolean pwCheck = bCryptPasswordEncoder.matches(inputPw, memberDto.getMember_pw());
			if(pwCheck == true) { return 1;	}
			else { return 0; }
		}	else { return 0; }
	}
	
	//권한이 없는 경우 노출될 에러 페이지 (403에러 대신 노출)
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		System.out.println("access Denied : " + auth);
		model.addAttribute("msg", "Access Denied");
	}
		
//	//시큐리티 미적용 로그아웃
//	@GetMapping("/logout")
//  public String getLogout(HttpSession session) throws Exception {
//		logger.info("LOGOUT");
//		session.invalidate();
//		return "redirect:/";
//	}

	//아이디 중복체크
	@PostMapping("/idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("member_id") String member_id) throws Exception {
		logger.info("idCheck");
		logger.info(member_id);
		System.out.println(member_id);
		int cnt = service.idCheck(member_id);
		logger.info("cnt : " + cnt);
		return cnt;
	}
	
	//이메일 인증
	@Autowired
	private MailSendService mailService;
	
	@PostMapping("/mailCheck")
	@ResponseBody
	public String mailCheck(@RequestParam("member_id") String member_id) throws Exception {
		logger.info("이메일 인증 요청 접수");
		logger.info("이메일 인증 이메일 : " + member_id);
		return mailService.joinEmail(member_id);
	}
	
	//회원가입
	@GetMapping("/register")
	public String getRegister() throws Exception {
		logger.info("REGISTER PAGE");
		return "member/register";
	}
	
	@PostMapping("/register")
	public String postRegister(MemberDto dto) throws Exception {
		logger.info("REGISTER - 회원 가입 완료");
		logger.info("이메일 : " + dto.getMember_id());
		logger.info("비밀번호 : " + dto.getMember_pw());
		String encodePw = bCryptPasswordEncoder.encode(dto.getMember_pw());
		dto.setMember_pw(encodePw);
		logger.info("암호화 된 비밀 번호 : " + dto.getMember_pw());
		logger.info("닉네임 : " + dto.getMember_nick());
		logger.info("이름 : " + dto.getMember_name());
		logger.info("우편번호 : " + dto.getMember_zip());
		logger.info("주소 : " + dto.getMember_addr());
		logger.info("상세 주소 : " + dto.getMember_addr2());
		logger.info("이메일 수신 동의 여부 : " + dto.isMember_check());
		logger.info("문자 메시지 수신 동의 여부 : " + dto.isMember_smscheck());
		String member_id = dto.getMember_id();
		service.register(dto);
		service.insertAuthInfo(member_id);
		service.insertProfile(member_id);
		logger.info("REGISTER COMPLETE PAGE");
		return "member/complete";
	}

	//Recaptcha
	@ResponseBody
	@PostMapping("/VerifyRecaptcha")
	public int VerifyRecaptcha(HttpServletRequest request) {
	    VerifyRecaptcha.setSecretKey("시크릿 코드");
	    String gRecaptchaResponse = request.getParameter("recaptcha");
	    try {
	       if(VerifyRecaptcha.verify(gRecaptchaResponse)) {
	          return 0; // 성공
	       }
	       else {
	    	   return 1; // 실패
	       }
	    } catch (Exception e) {
	        e.printStackTrace();
	        return -1; //에러
	    }
	}

	//회원 정보 확인
	@GetMapping("/mypage")
	public String mypage(MemberDto dto, Model m, Principal principal) throws Exception {
		logger.info("MY PAGE");
		String member_id = principal.getName();
		MemberDto selectInfo = service.selectInfo(member_id);
		m.addAttribute("selectInfo",selectInfo);

		return "member/mypage";
	}
	
	//회원 정보 수정
	@PostMapping("/mypage")
	public String updateMember(MemberDto dto, Principal principal) throws Exception {
		logger.info("updateMember - " + principal.getName());

		service.updateMember(dto);
		System.out.println(dto.getMember_id());
		System.out.println(dto.getMember_pw());
		System.out.println(dto.getMember_nick());
		System.out.println(dto.getMember_name());
		System.out.println(dto.getMember_zip());
		System.out.println(dto.getMember_addr());
		System.out.println(dto.getMember_addr2());
		System.out.println(dto.isMember_check());
		System.out.println(dto.isMember_smscheck());

		return "redirect:/member/mypage";
	}
	
	//회원 삭제
	@PostMapping("/delete")
	public String memberDelete(Principal principal) throws Exception {
		String member_id = principal.getName();
		logger.info("MEMBER DELETE - " + member_id);
		service.deleteMember(member_id);
        return "redirect:/member/logout";
	}

}
