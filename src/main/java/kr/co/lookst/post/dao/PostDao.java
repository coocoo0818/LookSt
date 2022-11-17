package kr.co.lookst.post.dao;

import java.util.List;

import kr.co.lookst.post.domain.Post_imgDto;
import kr.co.lookst.post.domain.ProdInfoDto;
import kr.co.lookst.post.domain.snslist_infoDto;

public interface PostDao {

	List<Post_imgDto> post_listimg() throws Exception;

	List<ProdInfoDto> prod_info() throws Exception;

	List<snslist_infoDto> postlist_Info() throws Exception;


}
