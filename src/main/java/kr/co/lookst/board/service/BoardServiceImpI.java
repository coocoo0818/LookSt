package kr.co.lookst.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.lookst.board.domain.SearchItem;
import kr.co.lookst.board.service.BoardService;
import kr.co.lookst.board.dao.BoardDao;
import kr.co.lookst.board.domain.BoardDto;
import kr.co.lookst.board.domain.CommentDto;

@Service
public class BoardServiceImpI implements BoardService {

	@Autowired
	BoardDao boardDao;

	@Override
	public List<BoardDto> getPage(Map map) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.selectPage(map);
	}

	@Override
	public int getCount() throws Exception {
		// TODO Auto-generated method stub
		return boardDao.count();
	}

	@Override
	public BoardDto read(Integer board_no) throws Exception {
	BoardDto boardDto =	boardDao.select(board_no);
	//비즈니스 로직 추가(조회수 증가)
	boardDao.increaseViewCnt(board_no);
	
		return boardDto;
	}

	@Override
	public int remove(Integer board_no, String member_id) throws Exception {
		return boardDao.delete(board_no, member_id);
	}

	@Override
	public int member_id(BoardDto boardDto) throws Exception {
		return boardDao.insert(boardDto);
	}

	@Override
	public int modify(BoardDto boardDto) throws Exception {
		return boardDao.update(boardDto);
	}

	@Override
	public int getsearchResultCntQ(SearchItem sc) throws Exception {
		return boardDao.searchResultCntQ(sc);
	}

	@Override
	public List<BoardDto> getsearchResultPage(SearchItem sc) throws Exception {
		return boardDao.searchSelectPageQ(sc);
	}

	@Override
	public List<BoardDto> getsearchResultPageNotice(SearchItem sc) throws Exception {
		return boardDao.searchSelectPageNotice(sc);
	}

	@Override
	public int getsearchResultCntN(SearchItem sc) throws Exception {
		return boardDao.searchResultCntN(sc);
	}

	@Override
	public List<BoardDto> getsearchResultPageMagazine(SearchItem sc) throws Exception {
		return boardDao.searchSelectPageMagazine(sc);
	}

	@Override
	public int getsearchResultCntM(SearchItem sc) throws Exception {
		return boardDao.searchResultCntM(sc);
	}

	@Override
	public int write(BoardDto boardDto) throws Exception {
		System.out.println("boardDto = " + boardDto);
		return boardDao.insert(boardDto);

	}

	@Override
	public List<BoardDto> boardImgList(Integer board_no) throws Exception {
		return boardDao.boardImgList(board_no);
	}

	@Override
	public int removeM(Integer board_no, String member_id) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.deleteM(board_no, member_id);
	}

	@Override
	public int getsearchResultCntR(SearchItem sc) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.searchResultCntR(sc);
	}

	@Override
	public List<BoardDto> getsearchResultPageReview(SearchItem sc) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.searchSelectPageReview(sc);
	}

	@Override
	public int removeR(Integer board_no, String member_id) throws Exception {
		// TODO Auto-generated method stub
		return  boardDao.deleteR(board_no, member_id);
	}

	@Override
	public BoardDto readR(Integer board_no) throws Exception {
		BoardDto boardDto =	boardDao.selectR(board_no);
		//비즈니스 로직 추가(조회수 증가)
		boardDao.increaseViewCnt(board_no);
		return boardDto;
	}

	@Override
	public int modifyR(BoardDto boardDto) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.updateR(boardDto);
	}

	@Override
	public int writeR(BoardDto boardDto) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.insertR(boardDto);
	}





}