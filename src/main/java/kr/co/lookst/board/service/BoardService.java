package kr.co.lookst.board.service;

import java.util.List;
import java.util.Map;

import kr.co.lookst.board.domain.BoardDto;
import kr.co.lookst.board.domain.Board_imgDto;
import kr.co.lookst.board.domain.MagazineSimpleDto;
import kr.co.lookst.board.domain.PrevAndNextDto;
import kr.co.lookst.board.domain.SearchItem;

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
	List<MagazineSimpleDto> boardList(Integer lastIndex) throws Exception;
	int removeM(Integer board_no, String member_id) throws Exception;
	int getsearchResultCntR(SearchItem sc) throws Exception;
	List<BoardDto> getsearchResultPageReview(SearchItem sc) throws Exception;
	int removeR(Integer board_no, String member_id) throws Exception;
	BoardDto readR(Integer board_no) throws Exception;
	int modifyR(BoardDto boardDto)throws Exception;
	int writeR(BoardDto boardDto) throws Exception;
	List<String> boardImgList(int board_no);
	int wirteM(BoardDto boardDto) throws Exception;
	BoardDto movePage(int board_no) throws Exception;
	int modifyM(BoardDto boardDto)throws Exception;

	void insertBoardImages(List<Board_imgDto> board_imgDtos);

	void deleteImage(int board_no);
	BoardDto movePageM(int board_no) throws Exception;

}
