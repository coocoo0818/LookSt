package kr.co.lookst.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.log.LogFormatUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.lookst.member.domain.MemAuthDto;
import kr.co.lookst.member.domain.MemberDto;
import kr.co.lookst.member.service.MemberService;
import kr.co.lookst.seller.domain.SellerDto;

@Controller
public class MemberController {	
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	LogFormatUtils formatUtils;
	
	@Autowired
	private MemberService service;
	
	//로그인
	@GetMapping("/login")
	public String getLogin() throws Exception {
		logger.info("LOGIN PAGE");
		return "member/login";
	}
	
	@PostMapping("/loginCheck")
	@ResponseBody
	public int loginCheck(@RequestBody MemberDto dto) throws Exception {
		logger.info("loginCheck");
		int cnt = service.loginCheck(dto);
		System.out.println("로그인 시도 아이디 : " + dto.getMember_id());
		System.out.println("로그인 시도 비밀번호 : " + dto.getMember_pw());
		System.out.println("로그인 체크 (1:성공, 0:실패) : " + cnt);
		return cnt;
	}
	
	@PostMapping("/login")
	public String postLogin(MemberDto dto, HttpServletRequest request) throws Exception {
		logger.info("LOGIN");
		//세션 생성
		HttpSession session = request.getSession();
		MemberDto res = service.login(dto);
		String member_id = res.getMember_id();
		String auth = service.authCheck(member_id);
		
		if(res.getMember_id() != null) {
			//세션 저장
			session.setAttribute("res", res.getMember_id());
			session.setAttribute("auth", auth);
			System.out.println("로그인 아이디 : " + session.getAttribute("res"));
			System.out.println("회원 권한 : " + session.getAttribute("auth"));
			return "redirect:/";
		} else {
			System.out.println(res);
			return "redirect:/login";
		}
	}
	
	//로그아웃
	@GetMapping("/logout")
    public String logout(HttpSession session) throws Exception {
		logger.info("LOGOUT");
        session.invalidate();
        return "redirect:/";
    }
	
	//아이디 중복체크
	@PostMapping("/idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("member_id") String member_id) throws Exception {
		logger.info("idCheck");
		logger.info(member_id);
		int cnt = service.idCheck(member_id);
		logger.info("cnt : " + cnt);
		return cnt;
	}
	
	//회원가입
	@GetMapping("/register")
	public String getRegister() throws Exception {
		logger.info("REGISTER PAGE");
		return "member/register";
	}
	
	@PostMapping("/register")
	public String postRegister(MemberDto dto) throws Exception {
		service.register(dto);
		logger.info("REGISTER - 회원 가입 완료");
		logger.info("이메일 : " + dto.getMember_id());
		logger.info("비밀번호 : " + dto.getMember_pw());
		logger.info("닉네임 : " + dto.getMember_nick());
		logger.info("이름 : " + dto.getMember_name());
		logger.info("우편번호 : " + dto.getMember_zip());
		logger.info("주소 : " + dto.getMember_addr());
		logger.info("상세 주소 : " + dto.getMember_addr2());
		logger.info("이메일 수신 동의 여부 : " + dto.isMember_check());
		logger.info("문자 메시지 수신 동의 여부 : " + dto.isMember_smscheck());
		String member_id = dto.getMember_id();
		service.insertAuthInfo(member_id);
		service.insertProfile(member_id);
		
		return "redirect:/register/complete";
	}
	//회원가입 완료
	@GetMapping("/register/complete")
	public String regComplete() throws Exception {
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
	@GetMapping("/member/mypage")
	public String mypage(MemberDto dto, HttpServletRequest request, Model m) throws Exception {
		HttpSession session = request.getSession();

		if(session.getAttribute("res") != null) {
			//로그인 상태일 때
			logger.info("MY PAGE");
			System.out.println(session.getAttribute("res"));
			String member_id = (String)session.getAttribute("res");
			MemberDto selectInfo = service.selectInfo(member_id);
			m.addAttribute("selectInfo",selectInfo);
			return "member/mypage";
		} else {
			//로그아웃 상태일 때
			logger.info("LOGIN PAGE");
			System.out.println(session.getAttribute("res"));
			return "redirect:/login";
		}
	}
	
	//회원 정보 수정
	@PostMapping("/member/mypage")
	public String updateMember(MemberDto dto, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		logger.info("updateMember - " + session.getAttribute("res"));

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
	@PostMapping("/member/delete")
	public String memberDelete(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();

		if(session.getAttribute("res") != null) {
			//로그인 상태일 때
			logger.info("MEMBER DELETE - " + session.getAttribute("res"));
			String member_id = (String)session.getAttribute("res");
			service.deleteMember(member_id);
	        session.invalidate();
			return "redirect:/";
		} else {
			//로그아웃 상태일 때
			logger.info("LOGIN PAGE");
			System.out.println(session.getAttribute("res"));
			return "redirect:/";
		}
	}
	
	//판매자 정보 확인
	@GetMapping("/partner/mypage")
	public String memberAuth(SellerDto sellDto, HttpServletRequest request, Model m) throws Exception {
		HttpSession session = request.getSession();

		if(session.getAttribute("res") != null) {
			//로그인 상태일 때
			logger.info("MY PAGE - REG SELLER");
			System.out.println(session.getAttribute("res"));
			String member_id = (String)session.getAttribute("res");
			
			int cnt = service.checkSellerInfo(member_id);
			logger.info("cnt : " + cnt);
			
			if(cnt == 1) {
				SellerDto selectSellerInfo = service.selectSellerInfo(member_id);
				m.addAttribute("selectSellerInfo",selectSellerInfo);
				return "member/regSeller";
			}
		} else {
			//로그아웃 상태일 때
			logger.info("LOGIN PAGE");
			System.out.println(session.getAttribute("res"));
			return "redirect:/login";
		}
		return "member/regSeller";
	}
	
	//판매자 정보 등록
	@PostMapping("/partner/mypage")
	public String updateMember(SellerDto sellDto, HttpServletRequest request, Model m) throws Exception {
		HttpSession session = request.getSession();
		logger.info("updateMember - " + session.getAttribute("res"));

		String member_id = (String)session.getAttribute("res");
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
	
	
//	//이메일 인증
//	@Autowired
//	private MailSendService mailService;
//	
//	//회원가입 페이지 이동
//	@GetMapping("/userJoin")
//	public void userJoin() {}
//		
//	//이메일 인증
//	@GetMapping("/mailCheck")
//	@ResponseBody
//	public String mailCheck(String email) {
//		System.out.println("이메일 인증 요청 접수");
//		System.out.println("이메일 인증 이메일 : " + email);
//		return mailService.joinEmail(email);
//	}
}
