package kr.co.lookst.board;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;

import kr.co.lookst.board.domain.BoardDto;
import kr.co.lookst.board.domain.CommentDto;
import kr.co.lookst.board.domain.SearchItem;
import kr.co.lookst.board.domain.pageResolver;
import kr.co.lookst.board.domain.pageResolverM;
import kr.co.lookst.board.domain.pageResolverN;
import kr.co.lookst.board.domain.pageResolverR;
import kr.co.lookst.board.service.BoardService;



@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	BoardService boardService;
	
	@PostMapping("/modify")
	public String modify(BoardDto boardDto, Integer page, Integer pageSize, 
						 RedirectAttributes rattr, Model m, HttpSession session) {
		String member_id = (String) session.getAttribute("res");
		boardDto.setMember_id(member_id);
		System.out.println(member_id);
		System.out.println(boardDto);
		
		try {
			if(boardService.modify(boardDto) != 1)
				throw new Exception("Modify failed");
			
			rattr.addAttribute("page", page);
			rattr.addAttribute("pageSize", pageSize);
			rattr.addFlashAttribute("msg", "MOD_OK");
			
			return "redirect:/board/list/";
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute(boardDto); // 같은 문장 -> m.addAttribute("boardDto", boardDto);
			rattr.addAttribute("page", page);
			rattr.addAttribute("pageSize", pageSize);
			m.addAttribute("msg", "MOD_ERR");
			
			return "board/board"; // 수정등록하려던 내용을 보여줌 
		}
	}
	
	@PostMapping("/write")
	public String write(BoardDto boardDto, RedirectAttributes rattr, Model m, HttpSession session) {
		String member_id = (String) session.getAttribute("res");
		System.out.println("member_id = " + member_id);
		boardDto.setMember_id(member_id);
		
		try {
			if (boardService.write(boardDto) != 1)
				throw new Exception("Write failed");
			
			rattr.addFlashAttribute("msg", "WRT_OK");
			return "redirect:/board/list/";
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("mode", "new"); // 글쓰기 모드 
			m.addAttribute("boardDto", boardDto); // 등록하려던 내용을 보여줘야 함 -> m.addAttribute(boardDto); // 동일한 문장 
			m.addAttribute("msg", "WRT_ERR");
			return "board/board";
		}
	}
	@GetMapping("/write")
	public String write(Model m) {
		m.addAttribute("mode", "new");
		
		return "board/board"; // board.jsp 읽기와 쓰기에 사용. 쓰기에 사용할 때는 mode=new
	}
	
	@GetMapping("/writeN")
	public String writeN(Model m) {
		m.addAttribute("mode", "new");
		
		return "board/board"; // board.jsp 읽기와 쓰기에 사용. 쓰기에 사용할 때는 mode=new
	}
	
	@PostMapping("/remove")
	public String remove(Integer board_no, Integer page, Integer pageSize,
						 RedirectAttributes rattr, HttpSession session) {
		String member_id = (String) session.getAttribute("res");
		String msg = "DEL_OK";
		
		try {
			if(boardService.remove(board_no, member_id) != 1)
				throw new Exception("Delete failed.");
			
		} catch (Exception e) {
			e.printStackTrace();
			msg = "DEL_ERR";
		}
		
		// 삭제 후 메시지가 한 번만 나와야 함. Model이 아닌 RedirectAttributes에 저장하면 메시지가 한 번만 나옴.
		// addFlashAttribute() : 한 번 저장하고 없어지는 것임. 세션에 잠깐 저장했다가 한 번 쓰고 지워버림. 세션에도 부담이 덜함.
		rattr.addAttribute("page", page);
		rattr.addAttribute("pageSize", pageSize);
		rattr.addFlashAttribute("msg", msg);
		
		return "redirect:/board/list/";
	}
	
	@GetMapping("/read")
	public String read(Integer board_no, SearchItem sc, Model m) {
		try {
			BoardDto boardDto = boardService.read(board_no);
			m.addAttribute(boardDto); // 동일한 문장 -> m.addAttribute("boardDto", boardDto);
			
		} catch (Exception e) { 
			e.printStackTrace(); 
			return "redirect:/board/list/";
		}
		
		return "board/board";
	}
	
	@GetMapping("/read/notice")
	public String readNoitce(Integer board_no, SearchItem sc, Model m) {
		try {
			BoardDto boardDtoN = boardService.read(board_no);
			m.addAttribute(boardDtoN); // 동일한 문장 -> m.addAttribute("boardDto", boardDto);
			
		} catch (Exception e) { 
			e.printStackTrace(); 
			return "redirect:/board/list/notice/";
		}
		
		return "board/post1";
	}
	

	
	
	
	@GetMapping("/list")
	public String listqna(SearchItem sc, Model m, HttpServletRequest request) {
//		if(!loginCheck(request))
//			return "redirect:/login?toURL="+request.getRequestURL();
		
		try {
			
//			if (page==null) page=1;
//			if (pageSize==null) pageSize=10;
			
			int totalCnt = boardService.getsearchResultCntQ(sc);
			m.addAttribute("totalCnt", totalCnt);
			System.out.println(totalCnt);
			pageResolver pageResolver = new pageResolver(totalCnt, sc);

			List<BoardDto> list = boardService.getsearchResultPage(sc);
			m.addAttribute("list", list);
			m.addAttribute("pr", pageResolver);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "board/boardqna"; // 로그인 한 상태, 게시판 목록 화면으로 이동 
	}
	
	
	@GetMapping("/list/notice")
	public String listnotice(SearchItem sc, Model m, HttpServletRequest request) {
//		if(!loginCheck(request))
//			return "redirect:/login/login?toURL="+request.getRequestURL();
		
		try {
			
//			if (page==null) page=1;
//			if (pageSize==null) pageSize=10;
			
			int totalCntN = boardService.getsearchResultCntN(sc);
			m.addAttribute("totalCntN", totalCntN);
			pageResolverN pageResolverN = new pageResolverN(totalCntN, sc);
				
			
			List<BoardDto> list2 = boardService.getsearchResultPageNotice(sc);
			m.addAttribute("list2", list2);
			m.addAttribute("prN", pageResolverN);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "board/boardnotice"; // 로그인 한 상태, 게시판 목록 화면으로 이동 
	}
	
	
	
	@GetMapping("/list/faq")
	public String listFAQ() {
		return "board/boardfaq";
	}
	
	
	
	@GetMapping("/post1")
	public String post(){
		return "board/post1";
		
	}
	
	@RequestMapping("/submit")
	public String submit(){
		return "board/submit";
		
	}
	
	@GetMapping("/notice1")
	public String notice(){
		return "board/notice1";
		
	}
	

	/* 메거진 컨트롤러 */
	
	@GetMapping("/magazine")
	public String magazinelist(SearchItem sc, Model m, HttpServletRequest request,  Integer board_no) {
		
try {
			
//			if (page==null) page=1;
//			if (pageSize==null) pageSize=10;
	
			System.out.println(board_no);
			List<BoardDto> boardImgList = boardService.boardImgList(board_no);
			m.addAttribute("boardImgList", boardImgList);			
//			System.out.println(board_no);
			
//			List<BoardDto> postImgListPrdt = boardService.boardImgListView(board_no);
//			m.addAttribute("postImgListPrdt", postImgListPrdt);
	
	
			
			int totalCntM = boardService.getsearchResultCntM(sc);
			m.addAttribute("totalCntM", totalCntM);
			pageResolverM pageResolverM = new pageResolverM(totalCntM, sc);
				
			
			List<BoardDto> list3 = boardService.getsearchResultPageMagazine(sc);
			m.addAttribute("list3", list3);
			m.addAttribute("prM", pageResolverM);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return "board/magazinelist";
	}
	
	
	@GetMapping("/read/magazine")
	public String readMagazine(Integer board_no, SearchItem sc, Model m) {
		try {
			BoardDto boardDtoM = boardService.read(board_no);
			m.addAttribute(boardDtoM); // 동일한 문장 -> m.addAttribute("boardDto", boardDto);
			
		} catch (Exception e) { 
			e.printStackTrace(); 
			return "redirect:/board/magazine/";
		}
		
		return "board/magazineview";
	}
	

	
	
	@PostMapping("/removeM")
	public String removeM(Integer board_no, Integer page, Integer pageSize,
						 RedirectAttributes rattr, HttpSession session) {
		String member_id = (String) session.getAttribute("res");
		String msg = "DEL_OK";
		
		try {
			if(boardService.removeM(board_no, member_id) != 1)
				throw new Exception("Delete failed.");
			
		} catch (Exception e) {
			e.printStackTrace();
			msg = "DEL_ERR";
		}
		
		// 삭제 후 메시지가 한 번만 나와야 함. Model이 아닌 RedirectAttributes에 저장하면 메시지가 한 번만 나옴.
		// addFlashAttribute() : 한 번 저장하고 없어지는 것임. 세션에 잠깐 저장했다가 한 번 쓰고 지워버림. 세션에도 부담이 덜함.
		rattr.addAttribute("page", page);
		rattr.addAttribute("pageSize", pageSize);
		rattr.addFlashAttribute("msg", msg);
		
		return "redirect:/board/magazine/";
	}
	
	

	
	
	
	
	@GetMapping("/magazineview")
	public String magazineview() {
		return "board/magazineview";
	}
	
	@GetMapping("/magazine/writer")
	public String magazinewrite() {
		return "board/magazine";
		
	}
	
	
	/* 리뷰 컨트롤러 */
	
	@GetMapping("/review")
	public String reviewlist(SearchItem sc, Model m, HttpServletRequest request) {
//		if(!loginCheck(request))
//			return "redirect:/login/login?toURL="+request.getRequestURL();
		try {
			
//			if (page==null) page=1;
//			if (pageSize==null) pageSize=10;
			
			int totalCntR = boardService.getsearchResultCntR(sc);
			m.addAttribute("totalCntR", totalCntR);
			
			pageResolverR pageResolverR = new pageResolverR(totalCntR, sc);

			List<BoardDto> list4 = boardService.getsearchResultPageReview(sc);
			m.addAttribute("list4", list4);
			m.addAttribute("prR", pageResolverR);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "board/review"; // 로그인 한 상태, 리뷰게시판 목록 화면으로 이동 
	}
	
	@GetMapping("/read/review")
	public String readReview(Integer board_no, SearchItem sc, Model m) {
		try {
			BoardDto boardDtoR = boardService.read(board_no);
			m.addAttribute(boardDtoR); // 동일한 문장 -> m.addAttribute("boardDto", boardDto);
			
		} catch (Exception e) { 
			e.printStackTrace(); 
			return "redirect:/board/review/";
		}
		
		return "board/boardR";
	}
	
	
	@PostMapping("/review/modify")
	public String modifyR(BoardDto boardDto, Integer page, Integer pageSize, 
						 RedirectAttributes rattr, Model m, HttpSession session) {
		String member_id = (String) session.getAttribute("res");
		boardDto.setMember_id(member_id);
		System.out.println(member_id);
		System.out.println(boardDto);
		
		try {
			if(boardService.modifyR(boardDto) != 1)
				throw new Exception("Modify failed");
			
			rattr.addAttribute("page", page);
			rattr.addAttribute("pageSize", pageSize);
			rattr.addFlashAttribute("msg", "MOD_OK");
			
			return "redirect:/board/review/";
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute(boardDto); // 같은 문장 -> m.addAttribute("boardDto", boardDto);
			rattr.addAttribute("page", page);
			rattr.addAttribute("pageSize", pageSize);
			m.addAttribute("msg", "MOD_ERR");
			
			return "board/boardR"; // 수정등록하려던 내용을 보여줌 
		}
	}
	
	@PostMapping("/review/write")
	public String writeR(BoardDto boardDto, RedirectAttributes rattr, Model m, HttpSession session) {
		String member_id = (String) session.getAttribute("res");
		System.out.println("member_id = " + member_id);
		boardDto.setMember_id(member_id);
		
		try {
			if (boardService.writeR(boardDto) != 1)
				throw new Exception("Write failed");
			
			rattr.addFlashAttribute("msg", "WRT_OK");
			return "redirect:/board/review/";
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("mode", "new"); // 글쓰기 모드 
			m.addAttribute("boardDto", boardDto); // 등록하려던 내용을 보여줘야 함 -> m.addAttribute(boardDto); // 동일한 문장 
			m.addAttribute("msg", "WRT_ERR");
			return "board/boardR";
		}
	}
	@GetMapping("/review/write")
	public String writeR(Model m) {
		m.addAttribute("mode", "new");
		
		return "board/boardR"; // board.jsp 읽기와 쓰기에 사용. 쓰기에 사용할 때는 mode=new
	}
	
	
	@PostMapping("/review/remove")
	public String removeR(Integer board_no, Integer page, Integer pageSize,
						 RedirectAttributes rattr, HttpSession session) {
		String member_id = (String) session.getAttribute("res");
		String msg = "DEL_OK";
		
		try {
			if(boardService.remove(board_no, member_id) != 1)
				throw new Exception("Delete failed.");
			
		} catch (Exception e) {
			e.printStackTrace();
			msg = "DEL_ERR";
		}
		
		// 삭제 후 메시지가 한 번만 나와야 함. Model이 아닌 RedirectAttributes에 저장하면 메시지가 한 번만 나옴.
		// addFlashAttribute() : 한 번 저장하고 없어지는 것임. 세션에 잠깐 저장했다가 한 번 쓰고 지워버림. 세션에도 부담이 덜함.
		rattr.addAttribute("page", page);
		rattr.addAttribute("pageSize", pageSize);
		rattr.addFlashAttribute("msg", msg);
		
		return "redirect:/board/review/";
	}
	
	
	

	private boolean loginCheck(HttpServletRequest request) {
		// TODO Auto-generated method stub

		// 1. 세션을 얻어서
		HttpSession session = request.getSession(false); // false는 session이 없더라도 새로 생성하지 않는다. 반환 값 null
		// 2. 세션에 id가 있는지 확인, 있으면 true를 반환한다.
		return session != null && session.getAttribute("id")!=null;
	}
	
	
	
	@PostMapping(value="/uploadSummernoteImageFile", produces = "application/json")
	@ResponseBody
	public JsonObject uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) {
		
		JsonObject jsonObject = new JsonObject();
		
		String fileRoot = "C:\\summernote_image\\";	//저장될 외부 파일 경로
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
				
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/summernoteImage/"+savedFileName);
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		
		return jsonObject;
	}
	
	
	@GetMapping("/submit1")
	public String submit1() {
		return "board/submit";
		
	}
	
	
}