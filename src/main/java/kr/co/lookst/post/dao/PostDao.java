package kr.co.lookst.post.dao;

import java.util.List;

import kr.co.lookst.post.domain.OrderInfoDto;
import kr.co.lookst.post.domain.PostDto;
import kr.co.lookst.post.domain.Post_imgDto;
import kr.co.lookst.post.domain.ProdInfoDto;
import kr.co.lookst.post.domain.TpostDto;
/*import kr.co.lookst.post.domain.OrderPagePrdtDto;*/
import kr.co.lookst.post.domain.post_com_tagDto;
import kr.co.lookst.post.domain.snsPrdtImgDto;
import kr.co.lookst.post.domain.sns_Main_ImgDto;
import kr.co.lookst.post.domain.sns_com_tagDto;
import kr.co.lookst.post.domain.snslist_infoDto;

public interface PostDao {

	List<Post_imgDto> post_listimg() throws Exception;

	List<ProdInfoDto> prod_info() throws Exception;

	List<ProdInfoDto> postImgListCarousel(Integer post_no) throws Exception;

	List<snslist_infoDto> postImgListPrdt(Integer post_no) throws Exception;

	List<PostDto> snscommentlist(Integer post_no) throws Exception;

	List<post_com_tagDto> postComTaglist(Integer post_no) throws Exception;

	List<sns_Main_ImgDto> snsmainimg(Integer post_no) throws Exception;

	List<snsPrdtImgDto> snsPrdtImg(Integer post_no) throws Exception;

	List<sns_com_tagDto> snsComTag(Integer post_no) throws Exception;

	List<TpostDto> postTotalList() throws Exception;

	/* List<OrderPagePrdtDto> orderPagePrdt(Integer product_no) throws Exception; */

	List<OrderInfoDto> orderInfo(Integer product_no) throws Exception;



	




	

	/*
	 * orderFormPageDto orderFormpage(orderFormPageDto orderFormpage) throws
	 * Exception;
	 */







}
