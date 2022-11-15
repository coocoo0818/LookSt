package kr.co.lookst.post.dao;

import java.util.List;

import kr.co.lookst.post.domain.Post_imgDto;
import kr.co.lookst.post.domain.ProdInfoDto;

public interface PostDao {

	List<Post_imgDto> post_listimg() throws Exception;

	List<ProdInfoDto> prod_info() throws Exception;


}
