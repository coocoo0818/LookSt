package kr.co.lookst.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import kr.co.lookst.member.domain.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public MemberDto login(MemberDto dto) {
		MemberDto res = null;
		try {
			res = sqlSession.selectOne(NAMESPACE + "login", dto);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	
	
	

}
