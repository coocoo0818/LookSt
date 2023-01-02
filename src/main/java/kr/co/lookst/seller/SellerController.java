package kr.co.lookst.seller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
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
			m.addAttribute("pr",pageResolver);
			

			System.out.println(m);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "seller/prdtList";

	}
	
	// 상품 재고 수량 변경
	@RequestMapping(value="/productStock", method={RequestMethod.POST})
	public String prdtpageStockMod(Model model,  
			@RequestParam(value="product_no") Integer product_no,
			@RequestParam(value="stock") int stock) {
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
	@RequestMapping(value="/productDelete", method={RequestMethod.POST})
	public String prdtpagePrdtDel(Model m,  
			@RequestParam("product_no") Integer product_no) {
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
			m.addAttribute("pr",pageResolver);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "seller/orderList";

	}
	
	
	// 주문 상태 변경 
	@RequestMapping(value="/OstatusMod", method={RequestMethod.POST})
	public String orderpageStatusMod(Model model,  
			@RequestParam("prdt_order_no") Integer prdt_order_no,
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
			m.addAttribute("pr",pageResolver);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "seller/refundList";

	}
	
	// 취소, 환불, 상태 변경
	@RequestMapping(value="/RstatusMod", method={RequestMethod.POST})
	public String refundpageStatusMod(Model model,  
			@RequestParam("prdt_order_no") Integer prdt_order_no,
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
			if( monthSale == 0) {
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

	
	@ModelAttribute
	@RequestMapping(value = "registerPrdt", method={RequestMethod.POST})
	public String registerproduct(Product product, MultipartHttpServletRequest mtfRequest) throws Exception {
		sellerService.insertproduct(product);
		Integer product_no = product.getProduct_no();
		sellerService.insertprdtOpt(product_no);
		sellerService.insertprdtImg(product_no);
		
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		String src = mtfRequest.getParameter("src");
		System.out.println("src value : " + src);
		String path = "C:\\workspace-spring\\LookSt\\src\\main\\webapp\\resources\\img\\product\\";

		for (MultipartFile mf : fileList) {
			String originFileName = mf.getOriginalFilename(); // 원본 파일 명
			long fileSize = mf.getSize(); // 파일 사이즈

			UUID uuid = UUID.randomUUID();
			
			System.out.println("originFileName : " + originFileName);
			System.out.println("fileSize : " + fileSize);

			String safeFile = path + uuid + "_" + originFileName;
			try {
				mf.transferTo(new File(safeFile));
				
				
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return "redirect:/seller/prdtList";
	}
	

	
//	//썸머노트 이미지처리 ajax
//	@RequestMapping(value="/summernoteImage", method={RequestMethod.POST})
//	//썸머노트 이미지 처리
//	public String insertFormData2(
//			@RequestParam(value="file", required=false) MultipartFile file,HttpSession session
//			) {
//		Gson gson = new Gson();
//		Map<String, String> map = new HashMap<String, String>();
//		// 2) 웹 접근 경로(webPath) , 서버 저장 경로 (serverPath)
//		String WebPath = "C:\\workspace-spring\\LookSt\\src\\main\\webapp\\resources\\img\\product\\"; //DB에 저장되는 경로
//		String serverPath = session.getServletContext().getRealPath(WebPath);
//		String originalFileName=file.getOriginalFilename();
//		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
//		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
//		File targetFile = new File(serverPath + savedFileName);	
//		try {
//			InputStream fileStream = file.getInputStream();
//			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
//			System.out.println("originalFileName : " + originalFileName);
//			System.out.println("targetFile : " + targetFile);
//			
//			// contextroot + resources + 저장할 내부 폴더명
//			map.put("url", WebPath+savedFileName);
//			map.put("responseCode", "success");
//		} catch (IOException e) {
//			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
//			map.put("responseCode", "error");
//			e.printStackTrace();
//		}
//		return gson.toJson(map);
//	}
	


}
