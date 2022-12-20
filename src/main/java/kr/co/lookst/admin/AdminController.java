package kr.co.lookst.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import kr.co.lookst.main.domain.PrdtOrderDto;
import kr.co.lookst.main.domain.Prdt_Img;
import kr.co.lookst.main.domain.Prdt_Option;
import kr.co.lookst.main.domain.Product;
import kr.co.lookst.main.domain.SearchItem;
import kr.co.lookst.main.domain.SnsHeartDto;
import kr.co.lookst.member.domain.MemberDto;
import kr.co.lookst.post.domain.OrderInfoDto;
import kr.co.lookst.post.domain.Post_TagDto;
import kr.co.lookst.post.domain.post_com_tagDto;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	AdminService adminService;

	/* 회원 리스트 */
	@GetMapping("/member_management")
	public String adminFormMember(SearchItem sc, Model model) {
		try {
			/* 회원 페이징 시작 */
			int totalCnt = adminService.getSearchResultCnt(sc);
			model.addAttribute("totalCnt", totalCnt);
			PageResolver pageResolver = new PageResolver(totalCnt, sc);
			System.out.println(sc);
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
	@RequestMapping(value = "/authModify", method = { RequestMethod.POST })
	public String adminFormMemberModify(Model model, @RequestParam("member_id") String member_id,
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
	@RequestMapping(value = "/memberKickOut", method = { RequestMethod.POST })
	public String adminFormMemberKickOut(Model model, @RequestParam("member_id") String member_id) {
		System.out.println(member_id);

		try {
			adminService.memberKickOut(member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/admin/member_management";
	}

	/* SNS 관리 페이지 이동 */
	@RequestMapping(value = "/sns_management", method = RequestMethod.GET)
	public String adminFormSns(SearchItem sc, Model model) {
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
	@RequestMapping(value = "/postDelete", method = { RequestMethod.POST })
	public String adminFormPostDelete(Model model, @RequestParam("post_no") int post_no) {
		try {
			adminService.postDelete(post_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/admin/sns_management";
	}

	/* 게시판 관리 페이지 이동 */
	@RequestMapping(value = "/board_management", method = RequestMethod.GET)
	public String adminFormBoard(SearchItem sc, Model model) {
		try {
			/* 게시판 페이징 시작 */
			int totalCnt = adminService.boardSearchResultCnt(sc);
			model.addAttribute("totalCnt", totalCnt);
			PageResolver pageResolver = new PageResolver(totalCnt, sc);
			System.out.println(sc);
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
	@RequestMapping(value = "/boardModify", method = { RequestMethod.POST })
	public String adminBoardModify(Model model, @RequestParam("board_no") Integer board_no,
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
	@RequestMapping(value = "/boardDelete", method = { RequestMethod.POST })
	public String boardDelete(Model model, @RequestParam("board_no") Integer board_no) {
		System.out.println(board_no);

		try {
			adminService.boardDelete(board_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/admin/board_management";
	}

	/* 매거진 신청 페이지 이동 */
	@RequestMapping(value = "/magazin_request", method = RequestMethod.GET)
	public String adminFormMagazinRequest(SearchItem sc, Model model) {
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
	@RequestMapping(value = "/magazinAgree", method = { RequestMethod.POST })
	public String magazinAgree(Model model, @RequestParam("board_no") Integer board_no) {
		System.out.println(board_no);

		try {
			adminService.magazinAgree(board_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/admin/board_management";
	}

	/* 메거진 거부 */
	@RequestMapping(value = "/magazinReject", method = { RequestMethod.POST })
	public String magazinReject(Model model, @RequestParam("board_no") Integer board_no) {
		System.out.println(board_no);

		try {
			adminService.magazinReject(board_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/admin/board_management";
	}

	/* 쇼핑리스트 페이지 이동 */
	@RequestMapping(value = "/productList", method = RequestMethod.GET)
	public String shopFormList(SearchItem sc, Model model) {
		try {
			/* 쇼핑리스트 페이징 시작 */
			int totalCnt = adminService.shopListSearchResultCnt(sc);
			model.addAttribute("totalCnt", totalCnt);
			PageResolver pageResolver = new PageResolver(totalCnt, sc);
			/* 쇼핑리스트 페이징 끝 */

			/* 쇼핑리스트 리스트 출력 */
			List<Product> shopTotalList = adminService.shopListSearchResultPage(sc);
			model.addAttribute("shopTotalList", shopTotalList);
			model.addAttribute("pr", pageResolver);
			/* 쇼핑리스트 리스트 끝 */
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/productList";
	}

	/* 판매자 신청 페이지 이동 */
	@RequestMapping(value = "/seller_request", method = RequestMethod.GET)
	public String adminFormSellerRequest(SearchItem sc, Model model) {
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
	@RequestMapping(value = "/sellerAgree", method = { RequestMethod.POST })
	public String sellerAgree(Model model, @RequestParam("seller_no") String seller_no) {
		System.out.println(seller_no);

		try {
			adminService.sellerAgree(seller_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/admin/board_management";
	}

	/* 판매자 거부 */
	@RequestMapping(value = "/sellerReject", method = { RequestMethod.POST })
	public String sellerReject(Model model, @RequestParam("seller_no") String seller_no) {
		System.out.println(seller_no);

		try {
			adminService.sellerReject(seller_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/admin/board_management";
	}

	/* 상품 상세 페이지 이동 */
	@RequestMapping(value = "/productDetail", method = { RequestMethod.POST, RequestMethod.GET })
	public String productDetailPage(Model model, @RequestParam("product_no") Integer product_no, HttpServletRequest request) {
		HttpSession session = request.getSession();
		try {
			/* 상품 상세페이지 이동 */
			String login_id = (String) session.getAttribute("res");
			Product productInfo = adminService.getproductInfo(product_no);
			List<Prdt_Option> productSize = adminService.getproductSize(product_no);
			List<Prdt_Img> productImg = adminService.getproductImg(product_no);

			model.addAttribute("productInfo", productInfo);
			model.addAttribute("productSize", productSize);
			model.addAttribute("productImg", productImg);
			model.addAttribute("member_id", login_id);
			/* 상품 상세페이지 이동 끝 */
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/admin/productDetail";
	}
	
	/* 오더 페이지 이동 */
    @GetMapping("/orderFormpage")
	  public String orderFormpage(Model m, MemberDto dto, @RequestParam(value="product_no", required=false) Integer product_no, @RequestParam(value="prdt_option_size", required=false) String prdt_option_size
					, @RequestParam(value="prdt_option_color", required=false) String prdt_option_color, @RequestParam(value="prdt_order_quan", required=false) Integer prdt_order_quan, HttpServletRequest request) {
	    HttpSession session = request.getSession();
	    try {		
	  	  String login_id = (String) session.getAttribute("res");
          List<OrderInfoDto> orderInfo = adminService.orderInfo(product_no);
          m.addAttribute("orderInfo", orderInfo);
          m.addAttribute("prdt_option_size", prdt_option_size);
          m.addAttribute("prdt_option_color", prdt_option_color);
          m.addAttribute("prdt_order_quan", prdt_order_quan);
          m.addAttribute("member_id", login_id);
          System.out.println("test" + m);
          return "/post/orderFormpage";
       } catch (Exception e) {
          e.printStackTrace();
       }
       return "/post/orderFormpage";
    }
    
	/* 주문 인설트 */
	@RequestMapping(value = "/orderInsert", method = { RequestMethod.POST })
	@ResponseBody
	public int orderInsert(Model model, @RequestParam(value="prdt_order_no", required=false) Integer prdt_order_no, @RequestParam(value="product_no", required=false) Integer product_no, String member_id, 
			 String prdt_order_way, String prdt_order_phone, 
			String prdt_order_addr, String prdt_order_addr2, String prdt_order_person, 
			String prdt_option_size, String prdt_option_color, Integer prdt_order_price, Integer prdt_order_quan) {
		int mvc = 0;
		PrdtOrderDto prdt_order = new PrdtOrderDto();
		
		prdt_order.setPrdt_order_no(prdt_order_no);		
		prdt_order.setProduct_no(product_no);
		prdt_order.setMember_id(member_id);
		prdt_order.setPrdt_order_quan(prdt_order_quan);
		prdt_order.setPrdt_order_way(prdt_order_way);
		prdt_order.setPrdt_order_phone(prdt_order_phone);
		prdt_order.setPrdt_order_addr(prdt_order_addr);
		prdt_order.setPrdt_order_addr2(prdt_order_addr2);
		prdt_order.setPrdt_order_person(prdt_order_person);
		prdt_order.setPrdt_order_size(prdt_option_size);
		prdt_order.setPrdt_order_color(prdt_option_color);
		prdt_order.setPrdt_order_price(prdt_order_price);
		try {
			mvc = adminService.orderInsert(prdt_order);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mvc;
	}
	
	/* 결제 완료 페이지 */
	@RequestMapping(value = "/orderComplete", method = { RequestMethod.GET })
	public String orderComplete() {
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/admin/orderComplete";
	}

	/* 상품 컬러 출력 */
	@RequestMapping(value = "/productColor", method = { RequestMethod.GET })
	public ResponseEntity<List<Prdt_Option>> productColor(Model model, @RequestParam("product_no") Integer product_no,
			@RequestParam("prdt_option_size") String prdt_option_size) {
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

	/* sns total list */
	@RequestMapping(value = "/snsTotalList", method = { RequestMethod.GET })
	public String snsTotalList(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String login_id = (String) session.getAttribute("res");
		try {
			/* sns total list */
			List<MemMGMDto> snsTopList = adminService.snsTopList();
			model.addAttribute("snsTopList", snsTopList);

			List<Integer> snsTotalList = adminService.snsTotalList();
			model.addAttribute("snsTotalList", snsTotalList);
			model.addAttribute("member_id", login_id);
			
			List<Integer> postLikeCheck = adminService.postLikeCheck(login_id);
			model.addAttribute("postLikeCheck", postLikeCheck);
			/* System.out.println(model); */
			/* sns total list */
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/admin/snsTotalList";
	}

	/* sns tagInfo list */
	@RequestMapping(value = "/tagInfoList", method = { RequestMethod.GET })
	@ResponseBody
	public ResponseEntity<List<post_com_tagDto>> tagInfoList(Model model, Integer post_no) {
		List<post_com_tagDto> tagInfoList = null;
		try {
			System.out.println(post_no);
			/* sns tagInfo list */
			tagInfoList = adminService.tagInfoList(post_no);
			model.addAttribute("tagInfoList", tagInfoList);
			System.out.println(model);
			return new ResponseEntity<List<post_com_tagDto>>(tagInfoList, HttpStatus.OK); // 200
			/* sns tagInfo list */
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<List<post_com_tagDto>>(HttpStatus.BAD_REQUEST); // 400
		}
		/* return "/admin/tagInfoList"; */
	}

	/* sns PrdtTagInfo list */
	@RequestMapping(value = "/postTagInfo", method = { RequestMethod.GET })
	@ResponseBody
	public ResponseEntity<List<Post_TagDto>> postTagInfo(Model model, Integer post_no) {
		List<Post_TagDto> postTagInfo = null;
		try {
			System.out.println(post_no);
			/* sns PrdtTagInfo list */
			postTagInfo = adminService.postTagInfo(post_no);
			model.addAttribute("postTagInfo", postTagInfo);
			System.out.println(postTagInfo);
			return new ResponseEntity<List<Post_TagDto>>(postTagInfo, HttpStatus.OK); // 200
			/* sns PrdtTagInfo list */
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<List<Post_TagDto>>(HttpStatus.BAD_REQUEST); // 400
		}
		/* return "/admin/tagInfoList"; */
	}
	
	/* 좋아요 체크 */
	@RequestMapping(value = "/postLikeInsert", method = { RequestMethod.POST })
	@ResponseBody
	public int postLikeInsert(Model model, @RequestParam(value="member_id", required=false) String member_id, 
							@RequestParam(value="post_no", required=false) Integer post_no, HttpServletRequest request) {
		HttpSession session = request.getSession();
		int mvc = 0;
		String login_id = (String) session.getAttribute("res");
		SnsHeartDto snsHeartDto = new SnsHeartDto();
			
		snsHeartDto.setPost_no(post_no);
		snsHeartDto.setMember_id(login_id);
		try {
			mvc = adminService.postLikeInsert(snsHeartDto);
			model.addAttribute("member_id", login_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mvc;
	}
	
	/* 좋아요 취소 */
	@RequestMapping(value = "/postLikeDelete", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public int postLikeDelete(Model model, @RequestParam(value="member_id", required=false) String member_id, 
							@RequestParam(value="post_no", required=false) Integer post_no, HttpServletRequest request) {
		HttpSession session = request.getSession();
		int mvc = 0;
		String login_id = (String) session.getAttribute("res");
		SnsHeartDto snsHeartDto = new SnsHeartDto();
			
		snsHeartDto.setPost_no(post_no);
		snsHeartDto.setMember_id(login_id);
		try {
			mvc = adminService.postLikeDelete(snsHeartDto);
			model.addAttribute("member_id", login_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mvc;
	}
	
	/* sns Detail List */
	@RequestMapping(value = "/snsDetailList", method = { RequestMethod.GET })
	public String snsDetailList(Model model, HttpServletRequest request, Integer post_no) {
		System.out.println(post_no);
		HttpSession session = request.getSession();
		String login_id = (String) session.getAttribute("res");
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/admin/snsDetailList";
	}
	
}
