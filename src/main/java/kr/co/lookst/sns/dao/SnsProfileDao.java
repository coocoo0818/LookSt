package kr.co.lookst.sns.dao;

import java.util.List;


import kr.co.lookst.sns.domain.FollowDto;
import kr.co.lookst.sns.domain.PostDto;
import kr.co.lookst.sns.domain.Post_imgDto;
import kr.co.lookst.sns.domain.ProfileFeedDto;
import kr.co.lookst.sns.domain.SnsProfileDto;

public interface SnsProfileDao {
	
	// 프로필정보
	SnsProfileDto infoselect(String member_id) throws Exception;
	
	// 프로필 피드
	List<ProfileFeedDto> profileFeed(String member_id) throws Exception;
	
	// 팔로잉 리스트
	List<FollowDto> followingList(String member_id) throws Exception;
	
	// 팔로워 리스트
	List<FollowDto> followerList(String member_id) throws Exception;
	
	// 팔로우
	int follow(String member_id, String following) throws Exception;
	
	// 언팔로우
	int unfollow(String member_id, String following) throws Exception;
	
	// 팔로우 유무
	int isFollow(String member_id, String following) throws Exception;
	
	// 탈퇴 시 팔로우 삭제
	int deleteUserAllFollow(String member_id) throws Exception;
	
	// 게시물 업로드
	int uploadpost(PostDto pDto) throws Exception;
	
	// 게시물 이미지 업로드
	void uploadimg(List<Post_imgDto> pImgDto);
	
	// 게시물 삭제
	int deletePost(Integer post_no) throws Exception;

}
