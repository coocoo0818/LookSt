package kr.co.lookst.board.service;

import java.util.List;

import kr.co.lookst.board.domain.CommentDto;


public interface CommentService {

	List<CommentDto> getList(Integer board_no) throws Exception;

	int remove(Integer comment_no, Integer board_no, String member_id) throws Exception;

	int write(CommentDto dto)throws Exception ;

	int modify(CommentDto dto) throws Exception;

	List<CommentDto> getListM(Integer board_no)throws Exception ;

}
