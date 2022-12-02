package kr.co.lookst.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.lookst.post.domain.OrderInfoDto;
/*import kr.co.lookst.post.domain.OrderPagePrdtDto;*/
import kr.co.lookst.post.domain.PostDto;
import kr.co.lookst.post.domain.ProdInfoDto;
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
         
         /*
          * List<sns_Main_ImgDto> snsmainimg = postService.snsmainimg(postTotalList);
          * m.addAttribute("snsmainimg", snsmainimg);
          */
           
         /* List<snsPrdtImgDto> snsPrdtImg = postService.snsPrdtImg(postTotalList);
          * m.addAttribute("snsPrdtImg", snsPrdtImg);
          * 
          * List<sns_com_tagDto> snsComTag = postService.snsComTag(postTotalList);
          * m.addAttribute("snsComTag", snsComTag);
          */
                   
         //List<Post_imgDto> post_list = postService.getpostlistimg();
         //m.addAttribute("post_list", post_list);
         
      } catch (Exception e) {
         e.printStackTrace();
      }
      return "/post/sns_list";
   }

   @GetMapping("/orderFormpage")
	public String orderFormpage(/* OrderPagePrdtDto orderPagePrdtDto, */OrderInfoDto orderInfoDto, Model m, HttpServletRequest req) {
      try {

    	 Integer product_no = Integer.parseInt(req.getParameter("product_no"));
         System.out.println("product_no" + product_no);
         
         String prdt_option_size = req.getParameter("prdt_option_size");
         System.out.println("prdt_option_size" + prdt_option_size);
         
         String prdt_option_color = req.getParameter("prdt_option_color");
         System.out.println("prdt_option_color" + prdt_option_color);
         
         String prdt_order_quan = req.getParameter("prdt_order_quan");
         System.out.println("prdt_order_quan" + prdt_order_quan);
         
         List<OrderInfoDto> orderInfo = postService.orderInfo(null);
         m.addAttribute("orderInfo", orderInfo);
         System.out.println(m);
         
			/*
			 * List<OrderPagePrdtDto> orderPagePrdt = postService.orderPagePrdt(product_no);
			 * m.addAttribute("orderPagePrdt", orderPagePrdt);
			 * System.out.println(orderPagePrdt);
			 */
         
         
      } catch (Exception e) {
         e.printStackTrace();
      }
      return "/post/orderFormpage";
   }
   
    

}