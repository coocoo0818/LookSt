package kr.co.lookst.sns.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.lookst.sns.dao.SnsProfileDao;
import kr.co.lookst.sns.domain.FollowDto;
import kr.co.lookst.sns.domain.ProfileFeedDto;
import kr.co.lookst.sns.domain.SnsProfileDto;

@Service
public class SnsServiceImpl implements SnsService{

	@Autowired
	SnsProfileDao snsProfileDao;
	
	@Override
	public SnsProfileDto getinfoselect(String member_id) throws Exception {
		return snsProfileDao.infoselect(member_id);
	}

	@Override
	public List<ProfileFeedDto> getProfileFeed(String member_id) throws Exception {
		return snsProfileDao.profileFeed(member_id);
	}

	@Override
	public List<FollowDto> getFollower(String member_id) throws Exception {
		return snsProfileDao.followerList(member_id);
	}

	@Override
	public List<FollowDto> getFollowing(String member_id) throws Exception {
		return snsProfileDao.followingList(member_id);
	}



}
