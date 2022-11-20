package kr.co.lookst.post.dao;

import java.util.List;

import kr.co.lookst.post.domain.PostDto;
import kr.co.lookst.post.domain.Post_imgDto;
import kr.co.lookst.post.domain.ProdInfoDto;
import kr.co.lookst.post.domain.snslist_infoDto;

public interface PostDao {

	List<Post_imgDto> post_listimg() throws Exception;

	List<ProdInfoDto> prod_info() throws Exception;

	List<ProdInfoDto> postImgListCarousel(Integer post_no) throws Exception;

	List<snslist_infoDto> postImgListPrdt(Integer post_no) throws Exception;

	List<PostDto> snscommentlist(Integer post_no) throws Exception;


}
