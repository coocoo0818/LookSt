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
		return session.selectList(namespace+"selectPassiveUserList", member_id);
	}

	@Override
	public List<FollowDto> followingList(String member_id) throws Exception {
		return session.selectList(namespace+"selectActiveUserList", member_id);
	}

	@Override
	public int follow(FollowDto fd) {
		return session.insert(namespace+"follow", fd);
		
	}

	@Override
	public int unfollow(FollowDto fd) {
		return session.delete(namespace+"unfollow", fd);
	}

	@Override
	public int isFollow(FollowDto fd) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteUserAllFollow(String member_id) {
		// TODO Auto-generated method stub
		return session.delete(namespace+"deleteUserAllFollow", member_id);
	}

	


	
}
