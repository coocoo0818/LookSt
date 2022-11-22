package kr.co.lookst.sns.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.lookst.sns.domain.FollowDto;
import kr.co.lookst.sns.domain.ProfileFeedDto;
import kr.co.lookst.sns.domain.SnsProfileDto;

@Repository
public class SnsProfileDaoImpl implements SnsProfileDao {

	@Autowired
	private SqlSession session;
	private static String namespace = "kr.co.lookst.sns.dao.snsMapper.";
	
	@Override
	public SnsProfileDto infoselect(String member_id) throws Exception {
		return session.selectOne(namespace+"profileInfo", member_id);
	}

	@Override
	public List<ProfileFeedDto> profileFeed(String member_id) throws Exception {
		return session.selectList(namespace+"profileFeed", member_id);
	}

	@Override
	public List<FollowDto> followerList(String member_id) throws Exception {
		return session.selectList(namespace+"followerList", member_id);
	}

	@Override
	public List<FollowDto> followingList(String member_id) throws Exception {
		return session.selectList(namespace+"followingList", member_id);
	}
	
}
