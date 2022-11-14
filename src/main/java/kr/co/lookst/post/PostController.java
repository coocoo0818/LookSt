package kr.co.lookst.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.lookst.post.domain.Post_imgDto;
import kr.co.lookst.post.service.PostService;

@Controller
@RequestMapping("/post")
public class PostController {

	@Autowired
	PostService postService;

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

	@GetMapping("/mylist")
	public String sns_list() {
		return "/post/my_list";
	}

}
