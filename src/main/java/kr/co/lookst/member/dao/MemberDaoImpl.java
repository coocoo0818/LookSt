package kr.co.lookst.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.lookst.member.domain.MemAuthDto;
import kr.co.lookst.member.domain.MemberDto;
import kr.co.lookst.seller.domain.SellerDto;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public MemberDto login(MemberDto dto) throws Exception {
		MemberDto res = null;
		try {
			res = sqlSession.selectOne(NAMESPACE + "login", dto);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	public int loginCheck(MemberDto dto) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "loginCheck", dto);
	}

	@Override
	public int register(MemberDto dto) throws Exception {
		return sqlSession.insert(NAMESPACE + "register", dto);
	}

	@Override
	public int idCheck(String member_id) throws Exception {
		int cnt = sqlSession.selectOne(NAMESPACE + "idCheck", member_id);
		return cnt;
	}

	@Override
	public MemberDto selectInfo(String member_id) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "selectInfo", member_id);
	}
	
	@Override
	public int updateInfo(MemberDto dto) throws Exception {
		return sqlSession.update(NAMESPACE + "updateInfo", dto);
	}

	@Override
	public int deleteMember(String member_id) throws Exception {
		return sqlSession.delete(NAMESPACE + "deleteMember", member_id);
	}

	@Override
	public int checkSellerInfo(String member_id) throws Exception {
		int cnt = sqlSession.selectOne(NAMESPACE + "checkSellerInfo", member_id);
		return cnt;
	}

	@Override
	public SellerDto selectSellerInfo(String member_id) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "selectSellerInfo", member_id);
	}

	@Override
	public int insertSellerInfo(SellerDto sellDto) throws Exception {
		return sqlSession.insert(NAMESPACE + "insertSellerInfo", sellDto);
	}

	@Override
	public int updateSellerInfo(SellerDto sellDto) throws Exception {
		return sqlSession.update(NAMESPACE + "updateSellerInfo", sellDto);
	}

	@Override
	public int insertAuthInfo(String member_id) throws Exception {
		return sqlSession.insert(NAMESPACE + "insertAuthInfo", member_id);
	}

	@Override
	public String authCheck(String member_id) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "authCheck", member_id);
	}

	@Override
	public int insertProfile(String member_id) throws Exception {
		return sqlSession.insert(NAMESPACE + "insertProfile", member_id);
	}

	
}
