package kr.co.lookst.board.dao;

import java.util.List;

import kr.co.lookst.board.domain.CommentDto;


public interface CommentDao {

	int delete(Integer board_no) throws Exception;

	List<CommentDto> selectAll(Integer board_no) throws Exception;

	int delete(Integer comment_no, String member_id) throws Exception;

	int insert(CommentDto member_id) throws Exception;

	int update(CommentDto member_id) throws Exception;

	List<CommentDto> selectM(Integer board_no) throws Exception;
	
}
