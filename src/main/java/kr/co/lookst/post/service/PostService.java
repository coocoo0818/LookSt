package kr.co.lookst.post.service;

import java.util.List;

import kr.co.lookst.post.domain.Post_imgDto;

public interface PostService {

	List<Post_imgDto> getpostlistimg() throws Exception;
}
