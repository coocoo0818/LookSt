package kr.co.lookst.sns.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.lookst.sns.domain.PostDto;
import kr.co.lookst.sns.domain.Post_imgDto;
import kr.co.lookst.sns.dao.SnsProfileDao;
import kr.co.lookst.sns.domain.FollowDto;
import kr.co.lookst.sns.domain.ProfileFeedDto;
import kr.co.lookst.sns.domain.SnsProfileDto;

@Service
public class SnsServiceImpl implements SnsService{

	@Autowired
	SnsProfileDao snsProfileDao;
	
	//프로필정보
	@Override
	public SnsProfileDto getinfoselect(String member_id) throws Exception {
		return snsProfileDao.infoselect(member_id);
	}
	// 프로필 피드
	@Override
	public List<ProfileFeedDto> getProfileFeed(String member_id) throws Exception {
		return snsProfileDao.profileFeed(member_id);
	}
	// 팔로잉 리스트
	@Override
	public List<FollowDto> getFollowing(String member_id) throws Exception {
		return snsProfileDao.followingList(member_id);
	}
	// 팔로워 리스트
	@Override
	public List<FollowDto> getFollower(String member_id) throws Exception {
		return snsProfileDao.followerList(member_id);
	}
	// 팔로우
	@Override
	public int doFollow(String member_id, String following) throws Exception {
		return snsProfileDao.follow(member_id, following);
	}
	// 언팔로우
	@Override
	public int doUnFollow(String member_id, String following) throws Exception {
		return snsProfileDao.unfollow(member_id, following);
	}
	// 팔로우 유무
	@Override
	public int followCheck(String member_id, String following) throws Exception {
		return snsProfileDao.isFollow(member_id, following);
	}
	// 게시물 삭제
	@Override
	public int deletePost(Integer post_no) throws Exception {
		return snsProfileDao.deletePost(post_no);
	}
	// 게시물 업로드
	@Override
	public int insertPost(PostDto pDto) throws Exception {
		return snsProfileDao.uploadpost(pDto);
	}
	// 게시물 이미지 업로드
	@Override
	public void insertPostImg(List<Post_imgDto> pImgDto) {
		snsProfileDao.uploadimg(pImgDto);
		
	}
	
	


}
