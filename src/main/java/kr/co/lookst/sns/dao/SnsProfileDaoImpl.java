package kr.co.lookst.sns.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.lookst.sns.domain.FollowDto;
import kr.co.lookst.sns.domain.PostUpload;
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
	// 닉네임 수정
	@Override
	public int update(String member_id, String member_nick) throws Exception {
		Map map = new HashMap();
		map.put("member_nick", member_nick);
		map.put("member_id", member_id);
		return session.update(namespace + "nickmodify", map);
	}
	// 프로필 사진 변경
	@Override
	public int profileImg_Mod(String member_id, String profile_img, String profile_uuid) throws Exception {
		Map map = new HashMap();
		map.put("member_id", member_id);
		map.put("profile_img", profile_img);
		map.put("profile_uuid", profile_uuid);
		return session.update(namespace + "profileImg_Mod", map);
	}

	// 포스트 컨텐트 업로드
	@Override
	public int postCon_up(PostUpload pu) throws Exception {
		return session.insert(namespace + "postCon_up", pu);
	}
	// 포스트 이미지 업로드
	@Override
	public int postImg_up(PostUpload pu) throws Exception {
		return session.insert(namespace + "postImg_up", pu);
	}
	// 포스트 번호 가져오기
	/*
	@Override
	public int max_post_no() throws Exception {
		return session.selectOne(namespace+"max_post_no");
	}
	*/
	// 게시물 삭제
	@Override
	public int deletePost(Integer post_no) throws Exception {
		return session.update(namespace+"postDelete", post_no);
	}
	
	
	


	
}
