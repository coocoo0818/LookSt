package kr.co.lookst.sns;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.lookst.sns.domain.FollowDto;
import kr.co.lookst.sns.domain.ProfileFeedDto;
import kr.co.lookst.sns.domain.SnsProfileDto;
import kr.co.lookst.sns.service.SnsService;

@Controller
@RequestMapping("/sns")
public class SnsController {

	@Autowired
	SnsService snsService;

	@GetMapping("/snsProfile")
	public String snsProfile(String member_id, Model m) {
		try {
			member_id = "@database";

			SnsProfileDto pro_info = snsService.getinfoselect(member_id);
			List<ProfileFeedDto> pro_feed = snsService.getProfileFeed(member_id);
			List<FollowDto> pro_follower = snsService.getFollower(member_id);
			List<FollowDto> pro_following = snsService.getFollowing(member_id);
			
			m.addAttribute("pro_info", pro_info);
			m.addAttribute("pro_feed", pro_feed);
			m.addAttribute("pro_follower", pro_follower);
			m.addAttribute("pro_following", pro_following);
			System.out.println(m);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "sns/snsProfile";
	}
//
//	@PostMapping("/modify")
//	public String modify(SnsProfileDto snsProfileDto, Model model, HttpSession session, RedirectAttributes rattr) {
//		String member_id = (String) session.getAttribute("member_id");
//		snsProfileDto.setMember_id(member_id);
//
//		try {
//			
//			member_id = "@database";
//			
//			if (snsService.modify(snsProfileDto) != 1) {
//				throw new Exception("Modify failed");
//			}
//			
//			rattr.addFlashAttribute("msg", "MOD_OK");
//			return "redirect:/sns/snsProfile";
//		} catch (Exception e) {
//			e.printStackTrace();
//			model.addAttribute(snsProfileDto);
//			model.addAttribute("msg", "MOD_ERR");
//			return "/sns/snsProfile";
//		}
//	}

	@GetMapping("/postUpload")
	public String postUpload() {
		return "sns/postUpload";
	}

}
