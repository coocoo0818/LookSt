package kr.co.lookst.board.service;

import java.util.List;
import java.util.Map;

import kr.co.lookst.board.domain.SearchItem;
import kr.co.lookst.board.domain.BoardDto;
import kr.co.lookst.board.domain.CommentDto;

public interface BoardService {
	
	List<BoardDto> getPage(Map map) throws Exception;
	int getCount() throws Exception;
	BoardDto read(Integer board_no) throws Exception;
	int remove(Integer board_no, String member_id) throws Exception;
	int write(BoardDto boardDto) throws Exception;
	int modify(BoardDto boardDto) throws Exception;
	
	int getsearchResultCntQ(SearchItem sc) throws Exception;
	List<BoardDto> getsearchResultPage(SearchItem sc) throws Exception;
	List<BoardDto> getsearchResultPageNotice(SearchItem sc) throws Exception;
	int member_id(BoardDto boardDto) throws Exception;
	int getsearchResultCntN(SearchItem sc) throws Exception;
	List<BoardDto> getsearchResultPageMagazine(SearchItem sc) throws Exception;
	int getsearchResultCntM(SearchItem sc) throws Exception;
	List<BoardDto> boardImgList(Integer board_no) throws Exception;
	int removeM(Integer board_no, String member_id) throws Exception;
	int getsearchResultCntR(SearchItem sc) throws Exception;
	List<BoardDto> getsearchResultPageReview(SearchItem sc) throws Exception;
	int removeR(Integer board_no, String member_id) throws Exception;
	BoardDto readR(Integer board_no) throws Exception;
	int modifyR(BoardDto boardDto)throws Exception;
	int writeR(BoardDto boardDto) throws Exception;
}
