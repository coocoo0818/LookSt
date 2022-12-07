package kr.co.lookst.sns;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
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

import kr.co.lookst.sns.dao.SnsProfileDao;
import kr.co.lookst.sns.domain.FollowDto;
import kr.co.lookst.sns.domain.ProfileFeedDto;
import kr.co.lookst.sns.domain.SnsProfileDto;
import kr.co.lookst.sns.service.SnsService;

@Controller
@RequestMapping("/sns")
public class SnsController {
	HttpSession session;

	@Autowired
	SnsService snsService;

	/* 프로필 화면 */
	@GetMapping("/snsProfile")
	public String snsProfile(@RequestParam("member_id") String member_id, Model m, HttpServletRequest request) {

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
		return "sns/snsProfile";
	}

	/* 팔로우 하기 */
	@RequestMapping(value = "/follow", method = { RequestMethod.POST })
	public String follow(String member_id, Model m, HttpServletRequest request) {

		HttpSession session = request.getSession();
		String login_id = (String) session.getAttribute("res");

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
	public String unfollow(String member_id, Model m, HttpServletRequest request) {

		HttpSession session = request.getSession();
		String login_id = (String) session.getAttribute("res");

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

//	/* 닉네임 수정 */
//	@RequestMapping(value = "/nickModify", method = { RequestMethod.POST })
//	public String nickModify(String member_id, String member_nickname, Model m, HttpServletRequest request) {
//
//		HttpSession session = request.getSession();
//
//		try {
//			int nickModify = snsService.nickNameMod(member_id, member_nickname);
//			m.addAttribute("nickModify", nickModify);
//
//			System.out.println(m);
//			System.out.println("닉네임변경 성공(컨트롤러)");
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		return "sns/snsProfile";
//	}

	@RequestMapping(value = "requestupload1")
	public String requestupload1(MultipartHttpServletRequest mtfRequest) {
		String src = mtfRequest.getParameter("src");
		System.out.println("src value : " + src);
		MultipartFile mf = mtfRequest.getFile("file");

		String path = "C:\\image\\";

		String originFileName = mf.getOriginalFilename(); // 원본 파일 명
		long fileSize = mf.getSize(); // 파일 사이즈

		System.out.println("originFileName : " + originFileName);
		System.out.println("fileSize : " + fileSize);

		String safeFile = path + System.currentTimeMillis() + originFileName;

		try {
			mf.transferTo(new File(safeFile));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return "redirect:/";
	}

	/* 포스트 이미지 업로드 */
	@RequestMapping(value = "postUpload", method = { RequestMethod.POST })
	public String postUpload(String member_id, Model m,MultipartHttpServletRequest mtfRequest, HttpServletRequest request) {
		List<MultipartFile> fileList = mtfRequest.getFiles("file");

		HttpSession session = request.getSession();
		String login_id = (String) session.getAttribute("res");

		String path = "C:\\workspace-spring\\LookSt\\src\\main\\webapp\\resources\\img\\post\\";

		for (MultipartFile mf : fileList) {
			String originFileName = mf.getOriginalFilename(); // 원본 파일 명
			long fileSize = mf.getSize(); // 파일 사이즈

			System.out.println("원본 파일명 : " + originFileName);
			System.out.println("파일 사이즈 : " + fileSize);
			System.out.println("작성자 아이디 : " + login_id);
			String safeFile = path + originFileName;
			try {
				mf.transferTo(new File(safeFile));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return "sns/snsProfile";
	}

	/* 피드 리스트 */
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

	@GetMapping("/postUpload")
	public String postUpload() {
		return "sns/postUpload";
	}

}
