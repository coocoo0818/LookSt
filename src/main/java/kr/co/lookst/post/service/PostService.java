package kr.co.lookst.post.service;

import java.util.List;

import kr.co.lookst.post.domain.PostDto;
import kr.co.lookst.post.domain.Post_imgDto;
import kr.co.lookst.post.domain.ProdInfoDto;
import kr.co.lookst.post.domain.TpostDto;
import kr.co.lookst.post.domain.post_com_tagDto;
import kr.co.lookst.post.domain.snsPrdtImgDto;
import kr.co.lookst.post.domain.sns_Main_ImgDto;
import kr.co.lookst.post.domain.sns_com_tagDto;
import kr.co.lookst.post.domain.snslist_infoDto;

public interface PostService {

	List<Post_imgDto> getpostlistimg() throws Exception;
	
	List<ProdInfoDto> postImgListCarousel(Integer post_no) throws Exception;			// my_list 페이지 캐러셀이미지
	
	List<snslist_infoDto> postImgListPrdt(Integer post_no) throws Exception;			// my_list 페이지 상품 
	
	List<ProdInfoDto> getprodInfo() throws Exception;									
	
	List<PostDto> snscommentlist(Integer post_no) throws Exception;						// my_list 페이지 댓글
	
	List<post_com_tagDto> postComTaglist(Integer post_no) throws Exception;				// my_list 페이지 닉네임 및 게시글
	
	List<sns_Main_ImgDto> snsmainimg(Integer post_no) throws Exception;					// sns_list페이지 
	
	List<snsPrdtImgDto> snsPrdtImg(Integer post_no) throws Exception;					// sns_list페이지 상품
	
	List<sns_com_tagDto> snsComTag(Integer post_no) throws Exception;					// sns_list페이지 닉네임 및 게실글, 태그

	List<TpostDto> postTotalList() throws Exception;
	
}
