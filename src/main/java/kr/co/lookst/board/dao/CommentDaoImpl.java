package kr.co.lookst.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.lookst.board.domain.CommentDto;


@Repository
public class CommentDaoImpl implements CommentDao {
	
	@Autowired
	private SqlSession session;
	private static String namespace= "kr.co.lookst.board.dao.CommentMapper.";
	
	
	@Override
	public int delete(Integer board_no) throws Exception {
		return session.delete(namespace + "delete", board_no);
	}


	@Override
	public List<CommentDto> selectAll(Integer board_no) throws Exception {
		return session.selectList(namespace + "selectAll" , board_no);
	}


	@Override
	public int delete(Integer comment_no, String member_id) throws Exception {
		Map map = new HashMap();
		map.put("comment_no", comment_no);
		map.put("member_id", member_id);
		
		return session.delete(namespace + "delete", map);
	}


	@Override
	public int insert(CommentDto commentDto) throws Exception {
		
		return session.insert(namespace +"insert", commentDto);
	}


	@Override
	public int update(CommentDto commentdto) throws Exception {
		return session.update(namespace + "update", commentdto);
	}


	@Override
	public List<CommentDto> selectM(Integer board_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + "selectM", board_no);
	}





}
