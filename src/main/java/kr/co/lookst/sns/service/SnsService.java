package kr.co.lookst.sns.service;

import java.util.List;

import kr.co.lookst.sns.domain.FollowDto;
import kr.co.lookst.sns.domain.ProfileFeedDto;
import kr.co.lookst.sns.domain.SnsProfileDto;

public interface SnsService {
	
	//프로필정보	
	SnsProfileDto getinfoselect(String member_id) throws Exception;
	
	// 프로필 피드
	List<ProfileFeedDto> getProfileFeed(String member_id) throws Exception;
	
	// 팔로워 리스트
	List<FollowDto> getFollower(String member_id) throws Exception;
	
	// 팔로잉 리스트
	List<FollowDto> getFollowing(String member_id) throws Exception;
	
	//팔로우
	int doFollow(String member_id) throws Exception;
	
	//언팔로우
	int doUnFollow(String following) throws Exception;
	
	// 닉네임 수정
	int nickNameMod(String member_id, String member_nick) throws Exception;
}
