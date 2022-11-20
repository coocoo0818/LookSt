package kr.co.lookst.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.lookst.admin.domain.MemMGMDto;
import kr.co.lookst.main.domain.SearchItem;

@Repository
public class AdminDaoImpl implements AdminDao{

	@Autowired
	private SqlSession session;
	private static String namespace = "kr.co.lookst.admin.dao.AdminMapper.";
	/* 회원 리스트 */
	/*
	 * @Override public List<IndexDto> memberList() throws Exception{ return
	 * session.selectList(namespace + "memberList"); }
	 */
	/* 회원 권한 변경 */
	@Override
	public int memberAuthModify(String member_id, String auth) throws Exception {
		Map map = new HashMap();
		map.put("member_id", member_id);
		map.put("auth", auth);
		return session.update(namespace + "authModify", map);
	}

	/* 회원 강퇴 */
	@Override
	public int memberKickOut(String member_id) throws Exception {
		return session.delete(namespace + "memberKickOut", member_id);
	}

	/* 회원 토탈 */
	@Override
	public int searchResultCnt(SearchItem sc) throws Exception {
		return session.selectOne(namespace + "searchResultCnt", sc);
	}
	/* 회원 검색 리스트 */
	@Override
	public List<MemMGMDto> searchSelectPage(SearchItem sc) throws Exception {
		return session.selectList(namespace + "searchSelectPage", sc);
	}

	@Override
	public int postSearchResultCnt(SearchItem sc) throws Exception {
		return session.selectOne(namespace + "postSearchResultCnt", sc);
	}

	@Override
	public List<MemMGMDto> postSearchResultPage(SearchItem sc) throws Exception {
		return session.selectList(namespace + "postSearchResultPage", sc);
	}
}
