package kr.co.lookst.sns.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.lookst.sns.domain.FollowDto;
import kr.co.lookst.sns.domain.PostDto;
import kr.co.lookst.sns.domain.Post_imgDto;
import kr.co.lookst.sns.domain.ProfileFeedDto;
import kr.co.lookst.sns.domain.SnsProfileDto;

@Repository
public class SnsProfileDaoImpl implements SnsProfileDao {

	@Autowired
	private SqlSession session;
	private static String namespace = "kr.co.lookst.sns.dao.snsMapper.";
	
	// 프로필 정보
	@Override
	public SnsProfileDto infoselect(String member_id) throws Exception {
		return session.selectOne(namespace+"profileInfo", member_id);
	}
	// 프로필 피드
	@Override
	public List<ProfileFeedDto> profileFeed(String member_id) throws Exception {
		return session.selectList(namespace+"profileFeed", member_id);
	}
	// 팔로잉 리스트
	@Override
	public List<FollowDto> followingList(String member_id) throws Exception {
		return session.selectList(namespace+"selectActiveUserList", member_id);
	}
	// 팔로워 리스트
	@Override
	public List<FollowDto> followerList(String member_id) throws Exception {
		return session.selectList(namespace+"selectPassiveUserList", member_id);
	}
	// 팔로우
	@Override
	public int follow(String member_id, String following) {
		Map map = new HashMap();
		map.put("member_id", member_id);
		map.put("following", following);
		return session.insert(namespace+"follow", map);
	}
	// 언팔로우
	@Override
	public int unfollow(String member_id, String following) {
		Map map = new HashMap();
		map.put("member_id", member_id);
		map.put("following", following);
		return session.delete(namespace+"unfollow", map);
	}
	// 팔로우 유무
	@Override
	public int isFollow(String member_id, String following) {
		Map map = new HashMap();
		map.put("member_id", member_id);
		map.put("following", following);
		/* System.out.println(map); */
		return session.selectOne(namespace+"isFollow", map);
	}

	@Override
	public int deleteUserAllFollow(String member_id) {
		// TODO Auto-generated method stub
		return session.delete(namespace+"deleteUserAllFollow", member_id);
	}
	
	// 게시물 삭제
	@Override
	public int deletePost(Integer post_no) throws Exception {
		return session.update(namespace+"postDelete", post_no);
	}
	
	// 게시물 업로드
	@Override
	public int uploadpost(PostDto pDto) throws Exception {
		return session.insert(namespace + "uploadpost", pDto);
	}
	
	// 게시물 이미지 업로드
	@Override
	public void uploadimg(List<Post_imgDto> pImgDto) {
		session.insert(namespace + "uploadimg", pImgDto);
	}
	
	
	


	
}
