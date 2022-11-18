package kr.co.lookst.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.lookst.post.domain.Post_imgDto;
import kr.co.lookst.post.domain.ProdInfoDto;
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
			m.addAttribute("postImgListCarousel", postImgListCarousel);			
			
			
			List<snslist_infoDto> postImgListPrdt = postService.postImgListPrdt(post_no);
			m.addAttribute("postImgListPrdt", postImgListPrdt);	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/post/my_list";
	}
	
	@GetMapping("/sns_list")
	public String sns_main(Model m) {
		try {
			List<Post_imgDto> post_list = postService.getpostlistimg();
			m.addAttribute("post_list", post_list);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/post/sns_list";
	}

//	@GetMapping("/prodInfo")
//	public String prodInfo(int post_no, Model m) {
//		try {
//			
//			 List<ProdInfoDto> prod_info = postService.getprodInfo();
//			 m.addAttribute("prod_info", prod_info);
//			 
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "/post/sns_list";
//	}
//	
//	@GetMapping("/postlistInfo")
//	public String postlistInfo(Model m) {
//		try {
//			
//			List<snslist_infoDto> postlist_Info = postService.getpostlistInfo();
//			m.addAttribute("postlist_Info", postlist_Info);
//			
//		} catch(Exception e) {
//			e.printStackTrace();
//		}
//		return "/post/sns_list";
//	}

}
