package kr.co.lookst.post.service;

import java.util.List;

import kr.co.lookst.post.domain.Post_imgDto;
import kr.co.lookst.post.domain.ProdInfoDto;

public interface PostService {

	List<Post_imgDto> getpostlistimg() throws Exception;
	List<ProdInfoDto> getprodInfo() throws Exception;
}
