package kr.co.lookst.seller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.security.Principal;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.lookst.board.domain.Board_imgDto;
import kr.co.lookst.image.service.ImageService;
import kr.co.lookst.main.domain.PageResolver;
import kr.co.lookst.main.domain.Prdt_Img;
import kr.co.lookst.main.domain.Prdt_Option;
import kr.co.lookst.main.domain.Product;
import kr.co.lookst.main.domain.SearchItem;
import kr.co.lookst.seller.domain.MySalesDto;
import kr.co.lookst.seller.domain.OrderListDto;
import kr.co.lookst.seller.domain.PrdtListDto;
import kr.co.lookst.seller.service.SellerService;

@Controller
@RequestMapping("/seller")
public class SellerController {

	HttpSession session;

	@Autowired
	SellerService sellerService;

	@Autowired
	ImageService imageService;
	
	// 상품리스트
	@GetMapping("/prdtList")
	public String prdtpage(SearchItem sc, Model m, HttpServletRequest request) {

		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("res");
		System.out.println("로그인아이디 : " + member_id);
		try {

			int totalCnt = sellerService.getSearchResultCntP(sc);
			m.addAttribute("totalCnt", totalCnt);
			PageResolver pageResolver = new PageResolver(totalCnt, sc);

			List<PrdtListDto> prdtlist = sellerService.getsearchResultPageP(sc);
			m.addAttribute("prdtlist", prdtlist);
			m.addAttribute("pr", pageResolver);

			System.out.println(m);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "seller/prdtList";

	}

	// 상품 재고 수량 변경
	@RequestMapping(value = "/productStock", method = { RequestMethod.POST })
	public String prdtpageStockMod(Model model, @RequestParam(value = "product_no") Integer product_no,
			@RequestParam(value = "stock") int stock) {
		System.out.println("상품번호 : " + product_no);
		System.out.println("재고수량 : " + stock);

		try {
			sellerService.productStock(product_no, stock);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/seller/prdtList";
	}

	// 등록한 상품 삭제
	@RequestMapping(value = "/productDelete", method = { RequestMethod.POST })
	public String prdtpagePrdtDel(Model m, @RequestParam("product_no") Integer product_no) {
		System.out.println(product_no);

		try {
			sellerService.productDelete(product_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/seller/prdtList";
	}

	// 주문 리스트
	@GetMapping("/orderList")
	public String orderpage(SearchItem sc, Model m) {

		try {
			int totalCnt = sellerService.getSearchResultCnt(sc);
			m.addAttribute("totalCnt", totalCnt);
			PageResolver pageResolver = new PageResolver(totalCnt, sc);

			List<OrderListDto> orderlist = sellerService.getsearchResultPage(sc);
			m.addAttribute("orderlist", orderlist);
			m.addAttribute("pr", pageResolver);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "seller/orderList";

	}

	// 주문 상태 변경
	@RequestMapping(value = "/OstatusMod", method = { RequestMethod.POST })
	public String orderpageStatusMod(Model model, @RequestParam("prdt_order_no") Integer prdt_order_no,
			@RequestParam("orderStatus") String orderStatus) {
		System.out.println(prdt_order_no);
		System.out.println(orderStatus);

		try {
			sellerService.OrderStatusMod(prdt_order_no, orderStatus);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/seller/orderList";
	}

	// 취소, 환불, 반품 리스트
	@GetMapping("/refundList")
	public String refundpage(SearchItem sc, Model m) {

		try {
			int totalCnt = sellerService.getSearchResultCntR(sc);
			m.addAttribute("totalCnt", totalCnt);
			PageResolver pageResolver = new PageResolver(totalCnt, sc);

			List<OrderListDto> refundlist = sellerService.getsearchResultPageR(sc);
			m.addAttribute("refundlist", refundlist);
			m.addAttribute("pr", pageResolver);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "seller/refundList";

	}

	// 취소, 환불, 상태 변경
	@RequestMapping(value = "/RstatusMod", method = { RequestMethod.POST })
	public String refundpageStatusMod(Model model, @RequestParam("prdt_order_no") Integer prdt_order_no,
			@RequestParam("ReqOrderStatus") String ReqOrderStatus) {
		System.out.println(prdt_order_no);
		System.out.println(ReqOrderStatus);

		try {
			sellerService.ReqOrderStatusMod(prdt_order_no, ReqOrderStatus);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/seller/refundList";
	}

	// 나의 매출 {오늘의 할일 - 신규주문(결제완료), 취소접수 수량 표시}
	@GetMapping("/mySales")
	public String mySalespage(Model m) {
		int todaySale = 0;
		int monthSale = 0;
		try {
			List<MySalesDto> newSalelist = sellerService.newSale();
			m.addAttribute("newSalelist", newSalelist);
			List<MySalesDto> newCancellist = sellerService.newCancel();
			m.addAttribute("newCancellist", newCancellist);
			monthSale = sellerService.monthSale();
			todaySale = sellerService.todaySale();

		} catch (Exception e) {
			if (monthSale == 0) {
				monthSale = 0;
				todaySale = 0;
			}
		} finally {
			m.addAttribute("todaySale", todaySale);
			m.addAttribute("monthSale", monthSale);
		}

		System.out.println("todaySale : " + todaySale);
		System.out.println("monthSale : " + monthSale);
		return "seller/mySales";

	}

	// 상품 등록 페이지
	@GetMapping("/registerPrdt")
	public String registerpage(String seller_no) {
		seller_no = "1";
		return "seller/registerPrdt";

	}

	@PostMapping("/registerPrdt/write")
	public String registerproduct(Product product, @RequestParam(value = "pfiles") List<MultipartFile> files,
			 RedirectAttributes rattr, Model m, HttpSession session, Principal principal) {
		String member_id = principal.getName();
        System.out.println("member_id = " + member_id);
        System.out.println(m);
        //product.setSeller_no(seller_no);
        try {
            if (sellerService.insertproduct(product) != 1)
                throw new Exception("Write failed");
           
            if (files.size() > 6) {					
                m.addAttribute("product", product);
                m.addAttribute("msg", "사진은 6개 이하만 업로드 가능합니다.");
                return "seller/registerPrdt";
            }
            // 첨부 파일(이미지)이 없을 경우에는 저장하지 않는다.
            if (files.size() > 0) {
                // 파일(이미지)이 있을 경우에만 저장함
                List<Prdt_Img> prdt_img = imageService
                .prdtstoreFile(files, product.getProduct_no());
                sellerService.insertprdtImg(prdt_img);
            }
            rattr.addFlashAttribute("msg", "WRT_OK");
            return "redirect:/seller/prdtList";
        } catch (Exception e) {
            e.printStackTrace();
            
            m.addAttribute("product", product);
            m.addAttribute("msg", "WRT_ERR");
            System.out.println(m);
            return "seller/registerPrdt";
        }
	}


}


