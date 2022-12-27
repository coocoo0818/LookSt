package kr.co.lookst.sns.dao;

import java.util.List;

import kr.co.lookst.sns.domain.FollowDto;
import kr.co.lookst.sns.domain.PostUpload;
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
	
	// 닉네임 수정
	int update(String member_id, String member_nick) throws Exception;
	
	// 프로필 이미지 변경
	int profileImg_Mod(String member_id, String profile_img,String profile_uuid) throws Exception;

	// 포스트 컨텐트 업로드(member_id, post_content, post_date, post_type)
	int postCon_up(PostUpload pu) throws Exception;
	
	// 포스트 이미지 업로드(post_no, post_img_img, post_img_seq, post_img_uuid)
	int postImg_up(PostUpload pu) throws Exception;
	
	// 포스트 번호 가져오기
	//int max_post_no() throws Exception;
	
	// 게시물 삭제
	int deletePost(Integer post_no) throws Exception;

}
