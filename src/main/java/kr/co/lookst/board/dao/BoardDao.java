package kr.co.lookst.board.dao;

import java.util.List;
import java.util.Map;

import kr.co.lookst.board.domain.BoardDto;
import kr.co.lookst.board.domain.MagazineSimpleDto;
import kr.co.lookst.board.domain.SearchItem;

public interface BoardDao {

	BoardDto select(Integer board_no) throws Exception; 
	
	int insert(BoardDto dto) throws Exception;
	int count() throws Exception;
	int deleteAll() throws Exception;
	
	List<BoardDto> selectPage(Map map) throws Exception;

	int increaseViewCnt(Integer board_no) throws Exception;

	int delete(Integer board_no, String member_id) throws Exception;

	int update(BoardDto boardDto) throws Exception;
	
	int searchResultCntQ(SearchItem sc) throws Exception;
	
	List<BoardDto> searchSelectPageQ(SearchItem sc) throws Exception;
	
	List<BoardDto> searchSelectPageN(SearchItem sc) throws Exception;

	List<BoardDto> searchSelectPageNotice(SearchItem sc) throws Exception;

	int searchResultCntN(SearchItem sc) throws Exception;

	List<BoardDto> searchSelectPageMagazine(SearchItem sc) throws Exception;

	int searchResultCntM(SearchItem sc) throws Exception;

	List<MagazineSimpleDto> boardList(Integer lastIndex) throws Exception;

	int deleteM(Integer board_no, String member_id) throws Exception;

	int searchResultCntR(SearchItem sc) throws Exception;

	List<BoardDto> searchSelectPageReview(SearchItem sc) throws Exception;

	int deleteR(Integer board_no, String member_id) throws Exception;

	BoardDto selectR(Integer board_no) throws Exception;

	int updateR(BoardDto boardDto) throws Exception;

	int insertR(BoardDto boardDto)throws Exception;

	int updateCommentCnt(Integer board_no, int cnt) throws Exception;
	
	List<String> boardImgList(int board_no);
	

	BoardDto movePage(Integer board_no) throws Exception;

	BoardDto movePage(int board_no) throws Exception;

	




	
}
