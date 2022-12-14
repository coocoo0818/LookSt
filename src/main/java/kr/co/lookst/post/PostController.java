package kr.co.lookst.post;

import java.net.http.HttpResponse;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.lookst.main.domain.PageResolver;
import kr.co.lookst.main.domain.Product;
import kr.co.lookst.main.domain.SearchItem;
import kr.co.lookst.post.domain.OrderHistoryDto;
import kr.co.lookst.post.domain.PageResolver_prdtList;
/*import kr.co.lookst.post.domain.OrderPagePrdtDto;*/
import kr.co.lookst.post.domain.PostDto;
import kr.co.lookst.post.domain.ProdInfoDto;
import kr.co.lookst.post.domain.SearchItem_prdtList;
import kr.co.lookst.post.domain.TpostDto;
import kr.co.lookst.post.domain.post_com_tagDto;
import kr.co.lookst.post.domain.snslist_infoDto;
import kr.co.lookst.post.service.PostService;

@Controller
@RequestMapping("/post")
public class PostController {

   @Autowired
   PostService postService;
   
   @GetMapping("/mylist")
   public String sns_list(Model m, Integer post_no) {
      
      try {
         post_no =1;
         List<ProdInfoDto> postImgListCarousel = postService.postImgListCarousel(post_no);
         System.out.println(post_no);
         m.addAttribute("postImgListCarousel", postImgListCarousel);         
         
         List<snslist_infoDto> postImgListPrdt = postService.postImgListPrdt(post_no);
         m.addAttribute("postImgListPrdt", postImgListPrdt);   
         
         List<PostDto> snscommentlist = postService.snscommentlist(post_no); 
         m.addAttribute("snscommentlist", snscommentlist);
         
         List<post_com_tagDto> postComTaglist = postService.postComTaglist(post_no);
         m.addAttribute("postComTaglist", postComTaglist);
         
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      return "/post/my_list";
   }
   

   @GetMapping("/sns_list")
   public String sns_main(Model m) {
      try {
         List<TpostDto> postTotalList = postService.postTotalList();
         m.addAttribute("postTotalList", postTotalList);
         System.out.println(postTotalList);
         System.out.println(m);
         
      } catch (Exception e) {
         e.printStackTrace();
      }
      return "/post/sns_list";
   }

//   @GetMapping("/orderFormpage")
//	public String orderFormpage(Model m, @RequestParam(value="product_no", required=false) Integer product_no, @RequestParam(value="prdt_option_size", required=false) String prdt_option_size
//					, @RequestParam(value="prdt_option_color", required=false) String prdt_option_color, @RequestParam(value="prdt_order_quan", required=false) Integer prdt_order_quan, ServletRequest req) {
//	   System.out.println("data" + product_no);
//      try {
//
//    	 System.out.println("data" + product_no);
//         String prdt_option_size1 = req.getParameter("prdt_option_size");
//         String prdt_option_color1 = req.getParameter("prdt_option_color");
//         String prdt_order_quan1 = req.getParameter("prdt_order_quan");
//         
//         System.out.println();
//         List<OrderInfoDto> orderInfo = postService.orderInfo(product_no);
//         m.addAttribute("orderInfo", orderInfo);
//         System.out.println("test" + m);
//         return "/post/orderFormpage";
//      } catch (Exception e) {
//         e.printStackTrace();
//      }
//      return "/post/orderFormpage";
//   }
   
   
   @RequestMapping(value="${contextPath}/post/orderFormpage", method= {RequestMethod.GET})
   public void orderPageTest(@RequestParam("product_no") Integer product_no, @RequestParam("prdt_option_size") String prdt_option_size
		   				, @RequestParam("prdt_option_color") String prdt_option_color, @RequestParam("prdt_order_quan") Integer prdt_order_quan) {
	   System.out.println(product_no);
	   System.out.println(prdt_option_size);
	   System.out.println(prdt_option_color);
	   System.out.println(prdt_order_quan);
//	   return "/orderFormpage";
   }
   
	/* ??????????????? ????????? ??????!!! */ /*Dao, Service ??? ???????????? ?????????????????????*/
	@RequestMapping(value = "/productList", method = RequestMethod.GET)
	public String shopFormList(SearchItem_prdtList sc, Model model) {	/* SearchItem_prdtList ?????? String kind = "" */
		System.out.println(sc);
		try {
			/* ??????????????? ????????? ?????? */
			int totalCnt = postService.shopListCnt(sc); /* sc??? ???????????? kind??? ?????? T??? ???????????? ???????????? ??? ????????? DB?????? ????????? totalCnt??? ??????  */
			System.out.println(totalCnt);
			model.addAttribute("totalCnt", totalCnt);
			PageResolver_prdtList pageResolver_prdtList = new PageResolver_prdtList(totalCnt, sc); /* totalCnt??? ???????????? ???????????? ????????? ???????????????.*/
			/* ??????????????? ????????? ??? */

			/* ??????????????? ????????? ?????? */
			List<Product> shopTotalList = postService.shopListPage(sc);/* sc??? ???????????? ????????? ???????????? ????????? ????????????????????? ???????????? */
			System.out.println(shopTotalList);
			model.addAttribute("shopTotalList", shopTotalList); /* shopTotalList??? ???????????? ???????????? ?????? model??? ???????????? "post/productList"??? ????????????. */
			model.addAttribute("pr", pageResolver_prdtList);
				System.out.println(pageResolver_prdtList);
			/* ??????????????? ????????? ??? */
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "post/productList";
	}
	/* ?????????????????? */
	@GetMapping("/orderHistory") 
	public String orderHistory(Model m, HttpServletRequest request, Principal principal ) {
		
		/* HttpSession session = request.getSession(); */
		try {
			/* String member_id = (String) session.getAttribute("res"); */
			String member_id = principal.getName();
			List<OrderHistoryDto> orderHistory = postService.orderHistory(member_id);
			m.addAttribute("orderHistory", orderHistory);
			m.addAttribute("member_id", member_id);
			System.out.println(orderHistory);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/post/orderHistory";
	}

	/* ?????????????????? */
	@PostMapping("/orderCancel")
	public String orderCancel(Integer order_no, RedirectAttributes rattr, HttpSession session) {
		
		String member_id = (String) session.getAttribute("res");
		String msg = "DEL_OK";
		
		try {
			postService.orderCancel(order_no);
			System.out.println("prdt_order_no" + order_no);
			
//			if (postService.orderCancel(prdt_order_no) != 1)
//				throw new Exception("Delete failed.");
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:/post/orderHistory";
	}
	/* ???????????? ????????? */
	@PostMapping("/shoppingBag") 
	public void shoppingBag(Model m, HttpServletResponse response, HttpServletRequest request, String product_no ) {
		System.out.println(product_no);
		try {
			 Cookie cookie = new Cookie("id", product_no); 
			 response.addCookie(cookie);
			
			 System.out.println(cookie);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/* ???????????? ?????? ?????????(???????????? ???????????? ??????) */
	@GetMapping("/shoppingBag") 
	public String shoppingBag() {
		
	
		 return "/post/shoppingBag";
	}
   
   
}