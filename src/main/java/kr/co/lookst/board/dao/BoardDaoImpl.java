package kr.co.lookst.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.lookst.board.domain.BoardDto;
import kr.co.lookst.board.domain.CommentDto;
import kr.co.lookst.board.domain.SearchItem;

@Repository
public class BoardDaoImpl implements BoardDao {
	
	@Autowired
	private SqlSession session;
	private static String namespace = "kr.co.lookst.board.dao.BoardMapper.";

	@Override
	public BoardDto select(Integer board_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + "select", board_no);
	}

	@Override
	public int insert(BoardDto dto) throws Exception {
		// TODO Auto-generated method stub
		return session.insert(namespace + "insert", dto);
	}

	@Override
	public int count() throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + "count");
	}

	@Override
	public int deleteAll() throws Exception {
		// TODO Auto-generated method stub
		return session.delete(namespace + "deleteAll");
	}

	@Override
	public List<BoardDto> selectPage(Map map) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + "selectPage", map);
	}

	@Override
	public int increaseViewCnt(Integer board_no) throws Exception {
		// TODO Auto-generated method stub
		return session.update(namespace + "increaseViewCnt", board_no);
	}

	@Override
	public int delete(Integer board_no, String member_id) throws Exception {
		Map map = new HashMap();
		map.put("board_no", board_no);
		map.put("member_id", member_id);
		return session.delete(namespace + "delete", map);
	}

	@Override
	public int update(BoardDto boardDto) throws Exception {
		// TODO Auto-generated method stub
		return session.update(namespace + "update", boardDto);
	}

	@Override
	public int searchResultCntQ(SearchItem sc) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + "searchResultCntQ", sc);
	}

	@Override
	public List<BoardDto> searchSelectPageQ(SearchItem sc) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + "searchSelectPageQ", sc);
	}

	@Override
	public List<BoardDto> searchSelectPageNotice(SearchItem sc) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + "searchSelectPageN", sc);
	}

	@Override
	public int searchResultCntN(SearchItem sc) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + "searchResultCntN", sc);
	}

	@Override
	public List<BoardDto> searchSelectPageN(SearchItem sc) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + "searchSelectPageN", sc);
	}

	@Override
	public List<BoardDto> searchSelectPageMagazine(SearchItem sc) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + "searchSelectPageM", sc);
	}

	@Override
	public int searchResultCntM(SearchItem sc) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + "searchResultCntM", sc);
	}

	@Override
	public List<BoardDto> boardImgList(Integer board_no) throws Exception {
		return session.selectList(namespace + "boardImgList", board_no);
	}

	@Override
	public int deleteM(Integer board_no, String member_id) throws Exception {
		Map map = new HashMap();
		map.put("board_no", board_no);
		map.put("member_id", member_id);
		return session.delete(namespace + "deleteM", map);
	}

	@Override
	public int searchResultCntR(SearchItem sc) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + "searchResultCntR", sc);
	}

	@Override
	public List<BoardDto> searchSelectPageReview(SearchItem sc) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + "searchSelectPageR", sc);
	}

	@Override
	public int deleteR(Integer board_no, String member_id) throws Exception {
		Map map = new HashMap();
		map.put("board_no", board_no);
		map.put("member_id", member_id);
		return session.delete(namespace + "deleteR", map);
	}

	@Override
	public BoardDto selectR(Integer board_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + "selectR", board_no);
	}

	@Override
	public int updateR(BoardDto boardDto) throws Exception {
		// TODO Auto-generated method stub
		return session.update(namespace + "updateR", boardDto);
	}

	@Override
	public int insertR(BoardDto boardDto) throws Exception {
		// TODO Auto-generated method stub
		return session.insert(namespace + "insertR", boardDto);
	}

	@Override
	public int updateCommentCnt(Integer board_no, int cnt) throws Exception {
		Map map = new HashMap();
		map.put("cnt", cnt);
		map.put("board_no", board_no);
		
		
		return session.update(namespace + "updateCommentCnt", map);
	}
}


