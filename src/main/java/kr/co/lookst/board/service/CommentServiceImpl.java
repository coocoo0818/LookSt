package kr.co.lookst.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.lookst.board.dao.BoardDao;
import kr.co.lookst.board.dao.CommentDao;
import kr.co.lookst.board.domain.CommentDto;


@Service
public class CommentServiceImpl implements CommentService {
	
	BoardDao boardDao;
	CommentDao commentDao;
	
	

	@Autowired		// 둘 다 자동으로 Autowired 적용이 된다.
	public CommentServiceImpl(BoardDao boardDao, CommentDao commentDao) {		// boardDao, commentDao 생성자 무조건 있어야 함.
//		super();
		this.boardDao = boardDao;
		this.commentDao = commentDao;
	}



	@Override
	public List<CommentDto> getList(Integer board_no) throws Exception {
		// TODO Auto-generated method stub
		//throw new Exception("test"); 에러 보냄
		return commentDao.selectAll(board_no);
	}



	@Override
	@Transactional(rollbackFor = Exception.class)
	public int remove(Integer comment_no, Integer board_no, String member_id) throws Exception {
		int rowCnt = boardDao.updateCommentCnt(board_no, -1);				// 보드에 있는 댓글 총 개수 줄이는 메서드
		System.out.println("updateCommentCnt - rowCnt = " + rowCnt);
//		throw new Exception("test");
		
		
		rowCnt = commentDao.delete(comment_no, member_id);
		System.out.println("rowCnt = " + rowCnt);
		
		return rowCnt;
	}



	@Override
	@Transactional(rollbackFor = Exception.class)
	public int write(CommentDto commentDto) throws Exception {
		boardDao.updateCommentCnt(commentDto.getBoard_no(), 1);								// 어떠한 게시물의 카운트 값을 1 증가시킨다.
		return commentDao.insert(commentDto);											// commentDto를 insert
	}



	@Override
	public int modify(CommentDto commentdto) throws Exception {
		return commentDao.update(commentdto);
	}



	@Override
	public List<CommentDto> getListM(Integer board_no) throws Exception {
		// TODO Auto-generated method stub
		return commentDao.selectM(board_no);
	}

}
