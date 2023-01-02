package kr.co.lookst.board;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.lookst.board.domain.CommentDto;
import kr.co.lookst.board.service.CommentService;


@Controller
public class CommentController {

	@Autowired
	CommentService service;//ds
	
	@PatchMapping("/comments/{comment_no}")
	public ResponseEntity<String> modify(@PathVariable Integer comment_no, @RequestBody CommentDto dto, HttpSession session, Principal principal) {
		String member_id = principal.getName();
		dto.setMember_id(member_id);
		dto.setComment_no(comment_no);
		System.out.println("dto =" + dto);
		System.out.println(member_id);

		try {
			if(service.modify(dto) != 1 )
				throw new Exception("Update failed.");
			return new ResponseEntity<>("MOD_OK", HttpStatus.OK);
		} catch(Exception e) { e.printStackTrace(); 
			return new ResponseEntity<>("MOD_ERR", HttpStatus.BAD_REQUEST);
		}
	}	
	
	
	// 댓글을 등록하는 메서드 
	@PostMapping("/comments")
	public ResponseEntity<String> write(@RequestBody CommentDto dto, Integer board_no, HttpSession session, Principal principal){
		// 로그인을 안하고 commenter 정보를 입력해줘야한다.
		String member_id = principal.getName();
		dto.setMember_id(member_id);
		dto.setBoard_no(board_no);
		System.out.println("dto = " + dto);
		
		try {
			if(service.write(dto) != 1)
				throw new Exception("write failed");
			return new ResponseEntity<String>("WRT_OK", HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();}
		return new ResponseEntity<String>("WRT_ERR", HttpStatus.BAD_REQUEST);
	
	}
	
	
	
	
	
	
	// 지정된 댓글을 삭제하는 메서드
	
	@DeleteMapping("/comments/{cno}")
	public ResponseEntity<String> remove(@PathVariable Integer cno,  Integer board_no, HttpSession session, Principal principal){

		String member_id = principal.getName();
		
		try {
		int rowCnt = service.remove(cno, board_no, member_id);
		
		if(rowCnt != 1) 
			throw new Exception("Delete Failed");
			return new ResponseEntity<>("DEL_OK", HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<>("DEL_OK", HttpStatus.BAD_REQUEST);
			
		}
	}
	
	
	
	
	
	
	
	// 지정된 게시물의 모든 댓글을 가져오는 메서드
	@GetMapping("/comments")						// /comments?bon=758 GET
	@ResponseBody
	//public List<CommentDto> list(Integer bno)
	public ResponseEntity<List<CommentDto>> list(Integer board_no){
		
		
		List<CommentDto> list = null;
		
		try {
			list = service.getListM(board_no);				// 게시글의 댓글을 읽어 들인다. bno
			
			System.out.println("list = " + list);
			return new ResponseEntity<List<CommentDto>>(list, HttpStatus.OK);			//200
					
			
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<List<CommentDto>>(HttpStatus.BAD_REQUEST);		//400
		}
		
		
//	return list;
	}
}
