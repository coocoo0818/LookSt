package kr.co.lookst.seller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.lookst.main.domain.PageResolver;
import kr.co.lookst.main.domain.SearchItem;
import kr.co.lookst.seller.domain.OrderListDto;
import kr.co.lookst.seller.domain.PrdtListDto;
import kr.co.lookst.seller.service.SellerService;

@Controller
@RequestMapping("/seller")
public class SellerController {

	@Autowired
	SellerService sellerService;
	
	
	@GetMapping("/prdtList")
	public String prdtpage(SearchItem sc, Model m) {
		try {
			int totalCnt = sellerService.getSearchResultCntP(sc);
			m.addAttribute("totalCnt", totalCnt);
			PageResolver pageResolver = new PageResolver(totalCnt, sc);
			
			List<PrdtListDto> prdtlist = sellerService.getsearchResultPageP(sc);
			m.addAttribute("prdtlist", prdtlist);
			m.addAttribute("pr",pageResolver);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "seller/prdtList";

	}
	
	@RequestMapping(value="/productStock", method={RequestMethod.POST})
	public String adminFormMemberModify(Model model,  
			@RequestParam(value="product_no") Integer product_no,
			@RequestParam(value="stock") int stock) {
		System.out.println(product_no);
		System.out.println(stock);
		
		try {
			sellerService.productStock(product_no, stock);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/seller/prdtList";
	}
	
	@RequestMapping(value="/productDelete", method={RequestMethod.POST})
	public String adminFormMemberKickOut(Model m,  
			@RequestParam("product_no") Integer product_no) {
		System.out.println(product_no);
		
		try {
			sellerService.productDelete(product_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/seller/prdtList";
	}
	
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
	
	@RequestMapping(value="/selectOrderinfo", method={RequestMethod.POST})
	public String orderpageselect(Model model,  
			@RequestParam("prdt_order_no") Integer prdt_order_no) {
		System.out.println(prdt_order_no);
		
		try {
			OrderListDto dto = sellerService.selectOrderinfo(prdt_order_no);
			model.addAttribute("dto", dto);
			
			ModelAndView mv = new ModelAndView();
			
			OrderListDto od = new OrderListDto();
			od.setPayment(dto.getPayment());
			
			mv.addObject(od);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/seller/orderList";
	}
	
	
	
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
	
	
	@GetMapping("/registerPrdt")
	public String adminForm4() {
		return "seller/registerPrdt";

	}
	
	@GetMapping("/mySales")
	public String adminForm5() {
		return "seller/mySales";

	}
}
