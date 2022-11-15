package kr.co.lookst.sns.service;

import java.util.List;

import kr.co.lookst.sns.domain.ProfileFeedDto;
import kr.co.lookst.sns.domain.SnsProfileDto;

public interface SnsService {

	SnsProfileDto getinfoselect(String member_id) throws Exception;
	
	List<ProfileFeedDto> getProfileFeed(String member_id) throws Exception;
}
