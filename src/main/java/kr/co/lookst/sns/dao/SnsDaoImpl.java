package kr.co.lookst.sns.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SnsDaoImpl implements SnsDao{

	@Autowired
	private SqlSession session;
	private static String namespace = "kr.co.lookst.sns.dao.SnsMapper.";
}
