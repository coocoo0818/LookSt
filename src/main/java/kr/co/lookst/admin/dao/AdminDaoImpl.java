package kr.co.lookst.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.lookst.main.domain.IndexDto;

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
}
