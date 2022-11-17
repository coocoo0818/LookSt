package kr.co.lookst.post.service;

import java.util.List;

import kr.co.lookst.post.domain.Post_imgDto;
import kr.co.lookst.post.domain.ProdInfoDto;
import kr.co.lookst.post.domain.snslist_infoDto;

public interface PostService {

	List<Post_imgDto> getpostlistimg() throws Exception;
	List<ProdInfoDto> getprodInfo() throws Exception;
	List<snslist_infoDto> getpostlistInfo() throws Exception;
}
