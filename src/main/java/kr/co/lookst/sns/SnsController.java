package kr.co.lookst.sns;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.lookst.board.domain.BoardDto;
import kr.co.lookst.board.domain.Board_imgDto;
import kr.co.lookst.image.service.ImageService;
import kr.co.lookst.sns.dao.SnsProfileDao;
import kr.co.lookst.sns.domain.FollowDto;
import kr.co.lookst.sns.domain.PostDto;
import kr.co.lookst.sns.domain.Post_imgDto;
import kr.co.lookst.sns.domain.ProfileFeedDto;
import kr.co.lookst.sns.domain.SnsProfileDto;
import kr.co.lookst.sns.service.SnsService;

@Controller
@RequestMapping("/sns")
public class SnsController {
	HttpSession session;

	@Autowired
	SnsService snsService;
	
	@Autowired
	ImageService imageService;

	/* 프로필 화면 */
	@GetMapping("/snsProfile")
	public String snsProfile(String member_id, @RequestParam("member_id") String member_nick, Model m,
			HttpServletRequest request, Principal principal) {


		try {
			String login_id = principal.getName();

			/* 프로필 정보 */
			SnsProfileDto pro_info = snsService.getinfoselect(member_id);
			/* 프로필 피드 */
			List<ProfileFeedDto> pro_feed = snsService.getProfileFeed(member_id);
			/* 팔로워 리스트 */
			List<FollowDto> pro_follower = snsService.getFollower(member_id);
			/* 팔로잉 리스트 */
			List<FollowDto> pro_following = snsService.getFollowing(member_id);
			/* 팔로우 유무 */
			int checkFollow = snsService.followCheck(login_id, member_id);

			m.addAttribute("pro_info", pro_info);
			m.addAttribute("pro_feed", pro_feed);
			m.addAttribute("pro_follower", pro_follower);
			m.addAttribute("pro_following", pro_following);
			m.addAttribute("login_Id", login_id);
			m.addAttribute("checkFollow", checkFollow);

			System.out.println("팔로우 유무(팔로우 중 : 1 , 아니면 0) : " + checkFollow);
			System.out.println("로그인아이디 : " + login_id);
			System.out.println("프로필아이디 : " + member_id);
			System.out.println(m);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "sns/snsProfile";
	}

	/* 팔로우 하기 */
	@RequestMapping(value = "/follow", method = { RequestMethod.POST })
	public String follow(String member_id, Model m, HttpServletRequest request, Principal principal) {

		String login_id = principal.getName();

		try {
			int checkFollow = snsService.followCheck(login_id, member_id);
			m.addAttribute("checkFollow", checkFollow);

			int follow = snsService.doFollow(login_id, member_id);

			System.out.println("팔로우 유무 :" + checkFollow);
			System.out.println("팔로우 성공(컨트롤러)");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "sns/snsProfile";
	}

	/* 팔로우 취소하기 */
	@RequestMapping(value = "/unfollow", method = { RequestMethod.POST })
	public String unfollow(String member_id, Model m, HttpServletRequest request, Principal principal) {

		String login_id = principal.getName();

		try {
			int checkFollow = snsService.followCheck(login_id, member_id);
			m.addAttribute("checkFollow", checkFollow);

			int unfollow = snsService.doUnFollow(login_id, member_id);

			System.out.println("팔로우 유무 :" + checkFollow);
			System.out.println("팔로우 취소 성공(컨트롤러)");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "sns/snsProfile";
	}

	/*
	 * 피드 리스트
	 */
	@GetMapping("/personalPost")
	public String personalPost(String member_id, Model m, @RequestParam("member_id") String member_nick,
			HttpServletRequest request) {

		HttpSession session = request.getSession();

		try {
			String login_id = (String) session.getAttribute("res");

			/* 프로필 정보 */
			SnsProfileDto pro_info = snsService.getinfoselect(member_id);
			/* 프로필 피드 */
			List<ProfileFeedDto> pro_feed = snsService.getProfileFeed(member_id);
			/* 팔로워 리스트 */
			List<FollowDto> pro_follower = snsService.getFollower(member_id);
			/* 팔로잉 리스트 */
			List<FollowDto> pro_following = snsService.getFollowing(member_id);
			/* 팔로우 유무 */
			int checkFollow = snsService.followCheck(login_id, member_id);

			m.addAttribute("pro_info", pro_info);
			m.addAttribute("pro_feed", pro_feed);
			m.addAttribute("pro_follower", pro_follower);
			m.addAttribute("pro_following", pro_following);
			m.addAttribute("login_Id", login_id);
			m.addAttribute("checkFollow", checkFollow);

			System.out.println("팔로우 유무(팔로우 중 : 1 , 아니면 0) : " + checkFollow);
			System.out.println("로그인아이디 : " + login_id);
			System.out.println("프로필아이디 : " + member_id);
			System.out.println(m);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "sns/personalPost";
	}

	
	// 게시물 삭제
	@RequestMapping(value = "/postDelete", method = { RequestMethod.POST })
	public String postDelete(Model m, Integer post_no) {
		System.out.println("삭제된 게시물 : " + post_no);

		try {
			snsService.deletePost(post_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "sns/personalPost";
	}

	@GetMapping("/postUpload")
	public String postUpload() {
		
		return "sns/postUpload";
	}

    @PostMapping("/postUpload")
    public String writeM(PostDto pDto, @RequestParam(value = "files") List<MultipartFile> files,
        RedirectAttributes rattr, Model m, HttpSession session, Principal principal) {
    	
    	String member_id = principal.getName();
        System.out.println("작성자 : member_id = " + member_id);
        pDto.setMember_id(member_id);
        
        try {
            if (snsService.insertPost(pDto) != 1)
                throw new Exception("Write failed");

            if (files.size() > 5) {					
                m.addAttribute("pDto", pDto);
                m.addAttribute("msg", "사진은 5개 이하만 업로드 가능합니다.");
                return "sns/postUpload";
            }

            if (files.size() > 0) {

                List<Post_imgDto> pImgDto = imageService
                .storepostImg(files, pDto.getPost_no());
                snsService.insertPostImg(pImgDto);
            }
            rattr.addFlashAttribute("msg", "WRT_OK");
            return "redirect:/sns/snsProfile/?member_id="+member_id;
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("pDto", pDto);
            m.addAttribute("msg", "WRT_ERR");
            return "sns/snsProfile";
        }
    }
}
