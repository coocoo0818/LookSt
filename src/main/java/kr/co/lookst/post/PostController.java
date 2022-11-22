package kr.co.lookst.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.lookst.post.domain.PostDto;
import kr.co.lookst.post.domain.Post_imgDto;
import kr.co.lookst.post.domain.ProdInfoDto;
import kr.co.lookst.post.domain.post_com_tagDto;
import kr.co.lookst.post.domain.snsPrdtImgDto;
import kr.co.lookst.post.domain.sns_Main_ImgDto;
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
	public String sns_main(Model m, Integer post_no) {
		try {
			post_no = 1;
			List<sns_Main_ImgDto> snsmainimg = postService.snsmainimg(post_no);
			m.addAttribute("snsmainimg", snsmainimg);
			
			List<snsPrdtImgDto> snsPrdtImg = postService.snsPrdtImg(post_no);
			m.addAttribute("snsPrdtImg", snsPrdtImg);
			
			
			
			//List<Post_imgDto> post_list = postService.getpostlistimg();
			//m.addAttribute("post_list", post_list);
			
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
