package kr.co.lookst.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.lookst.admin.domain.MemMGMDto;
import kr.co.lookst.main.domain.IndexDto;
import kr.co.lookst.main.domain.SearchItem;

@Repository
public class AdminDaoImpl implements AdminDao{

	@Autowired
	private SqlSession session;
	private static String namespace = "kr.co.lookst.admin.dao.AdminMapper.";
	
	@Override
	public List<IndexDto> memberList() throws Exception{
		return session.selectList(namespace + "memberList");
	}

	@Override
	public int memberAuthModify(String member_id, String auth) throws Exception {
		Map map = new HashMap();
		map.put("member_id", member_id);
		map.put("auth", auth);
		return session.update(namespace + "authModify", map);
	}

	@Override
	public int memberKickOut(String member_id) throws Exception {
		return session.delete(namespace + "memberKickOut", member_id);
	}

	@Override
	public int count() throws Exception {
		return session.selectOne(namespace + "count");
	}
	
	@Override
	public int searchResultCnt(SearchItem sc) throws Exception {
		return session.selectOne(namespace + "searchResultCnt", sc);
	}

	@Override
	public List<MemMGMDto> searchSelectPage(SearchItem sc) throws Exception {
		return session.selectList(namespace + "searchSelectPage", sc);
	}
}
