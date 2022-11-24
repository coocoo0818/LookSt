package kr.co.lookst.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.lookst.admin.domain.MemMGMDto;
import kr.co.lookst.admin.service.AdminService;
import kr.co.lookst.main.domain.PageResolver;
import kr.co.lookst.main.domain.Prdt_Img;
import kr.co.lookst.main.domain.Prdt_Option;
import kr.co.lookst.main.domain.Product;
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
	
	/* SNS 관리 페이지 이동 */
	@RequestMapping(value="/sns_management", method=RequestMethod.GET)
	public String adminFormSns(SearchItem sc,Model model) {
		try {
			/* 포스트 페이징 시작 */
			int totalCnt = adminService.getPostSearchResultCnt(sc);
			model.addAttribute("totalCnt", totalCnt);
			PageResolver pageResolver = new PageResolver(totalCnt, sc);
			/* 포스트 페이징 끝 */
			
			/* 포스트 리스트 출력 */
			List<MemMGMDto> member_management = adminService.getPostsearchResultPage(sc);
			model.addAttribute("member_management", member_management);
			model.addAttribute("pr", pageResolver);
			/* 포스트 리스트 끝 */
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/sns_management";
	}
	/* SNS 관리 강제 삭제 */
	@RequestMapping(value="/postDelete", method={RequestMethod.POST})
	public String adminFormPostDelete(Model model,  
			@RequestParam("post_no") int post_no) {
		try {
			adminService.postDelete(post_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/admin/sns_management";
	}
	
	/* 게시판 관리 페이지 이동 */
	@RequestMapping(value="/board_management", method=RequestMethod.GET)
	public String adminFormBoard(SearchItem sc,Model model) {
		try {
			/* 게시판 페이징 시작 */
			int totalCnt = adminService.boardSearchResultCnt(sc);
			model.addAttribute("totalCnt", totalCnt);
			PageResolver pageResolver = new PageResolver(totalCnt, sc);
			/* 게시판 페이징 끝 */
			
			/* 게시판 리스트 출력 */
			List<MemMGMDto> board_management = adminService.boardSearchResultPage(sc);
			model.addAttribute("board_management", board_management);
			model.addAttribute("pr", pageResolver);
			/* 게시판 리스트 끝 */
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/board_management";
	}
	/* 게시글 상태 변경 */
	@RequestMapping(value="/boardModify", method={RequestMethod.POST})
	public String adminBoardModify(Model model,  
			@RequestParam("board_no") Integer board_no,
			@RequestParam("board_type") String board_type) {
		System.out.println(board_no);
		System.out.println(board_type);
		try {
			adminService.boardModify(board_no, board_type);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/admin/board_management";
	}
	/* 게시글 삭제 */
	@RequestMapping(value="/boardDelete", method={RequestMethod.POST})
	public String boardDelete(Model model,  
			@RequestParam("board_no") Integer board_no) {
		System.out.println(board_no);
		
		try {
			adminService.boardDelete(board_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/admin/board_management";
	}
		
	/* 매거진 신청 페이지 이동 */
	@RequestMapping(value="/magazin_request", method=RequestMethod.GET)
	public String adminFormMagazinRequest(SearchItem sc,Model model) {
		try {
			/* 메거진 신청 페이징 시작 */
			int totalCnt = adminService.boardApplyingSearchResultCnt(sc);
			model.addAttribute("totalCnt", totalCnt);
			PageResolver pageResolver = new PageResolver(totalCnt, sc);
			/* 메거진 신청 페이징 끝 */
			
			/* 메거진 신청 리스트 출력 */
			List<MemMGMDto> magazin_management = adminService.boardApplyingsearchResultPage(sc);
			model.addAttribute("magazin_management", magazin_management);
			model.addAttribute("pr", pageResolver);
			/* 메거진 신청 리스트 끝 */
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/magazin_request";
	}
	/* 메거진 수락 */
	@RequestMapping(value="/magazinAgree", method={RequestMethod.POST})
	public String magazinAgree(Model model,  
			@RequestParam("board_no") Integer board_no) {
		System.out.println(board_no);
		
		try {
			adminService.magazinAgree(board_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/admin/board_management";
	}
	/* 메거진 거부 */
	@RequestMapping(value="/magazinReject", method={RequestMethod.POST})
	public String magazinReject(Model model,  
			@RequestParam("board_no") Integer board_no) {
		System.out.println(board_no);
		
		try {
			adminService.magazinReject(board_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/admin/board_management";
	}
	
	/* 판매자 신청 페이지 이동 */
	@RequestMapping(value="/seller_request", method=RequestMethod.GET)
	public String adminFormSellerRequest(SearchItem sc,Model model) {
		try {
			/* 판매자 신청 페이징 시작 */
			int totalCnt = adminService.sellerApplyingSearchResultCnt(sc);
			model.addAttribute("totalCnt", totalCnt);
			PageResolver pageResolver = new PageResolver(totalCnt, sc);
			/* 판매자 신청 페이징 끝 */
			
			/* 판매자 신청 리스트 출력 */
			List<MemMGMDto> seller_management = adminService.sellerApplyingsearchResultPage(sc);
			model.addAttribute("seller_management", seller_management);
			model.addAttribute("pr", pageResolver);
			/* 판매자 신청 리스트 끝 */
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/seller_request";
	}
	/* 판매자 수락 */
	@RequestMapping(value="/sellerAgree", method={RequestMethod.POST})
	public String sellerAgree(Model model,  
			@RequestParam("seller_no") String seller_no) {
		System.out.println(seller_no);
		
		try {
			adminService.sellerAgree(seller_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/admin/board_management";
	}
	
	/* 판매자 거부 */
	@RequestMapping(value="/sellerReject", method={RequestMethod.POST})
	public String sellerReject(Model model,  
			@RequestParam("seller_no") String seller_no) {
		System.out.println(seller_no);
		
		try {
			adminService.sellerReject(seller_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/admin/board_management";
	}
	
	/* 상품 상세 페이지 이동 */
	@RequestMapping(value="/productDetail", method={RequestMethod.POST, RequestMethod.GET})
	public String productDetailPage(Model model,  
			@RequestParam("product_no") Integer product_no) {
			try {
				/* 상품 상세페이지 이동 */
				Product productInfo = adminService.getproductInfo(product_no);
				List<Prdt_Option> productSize = adminService.getproductSize(product_no);
				List<Prdt_Img> productImg = adminService.getproductImg(product_no);
				
				model.addAttribute("productInfo", productInfo);
				model.addAttribute("productSize", productSize);
				model.addAttribute("productImg", productImg);

				/* 상품 상세페이지 이동 끝 */
			} catch (Exception e) {
				e.printStackTrace();
			}
		return "/admin/productDetail";
	}
	/* 상품 컬러 출력 */
	@RequestMapping(value="/productColor", method={RequestMethod.GET})
	public ResponseEntity<List<Prdt_Option>> productColor(Model model, 
			@RequestParam("product_no")Integer product_no, @RequestParam("prdt_option_size")String prdt_option_size) {
		System.out.println(product_no);
		System.out.println(prdt_option_size);
		
		try {
			List<Prdt_Option> productColor = adminService.productColor(product_no, prdt_option_size);
			System.out.println(productColor);
			return new ResponseEntity<List<Prdt_Option>>(productColor, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<List<Prdt_Option>>(HttpStatus.BAD_REQUEST);
		}
		/* return "redirect:/admin/productDetail"; */
	}
}
