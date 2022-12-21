package kr.co.lookst.post.service;

import java.util.List;

/*import kr.co.lookst.post.orderPagePrdtDto;*/
import kr.co.lookst.post.domain.PostDto;
import kr.co.lookst.post.domain.Post_imgDto;
import kr.co.lookst.post.domain.ProdInfoDto;
import kr.co.lookst.post.domain.SearchItem_prdtList;
import kr.co.lookst.post.domain.TpostDto;
import kr.co.lookst.main.domain.Product;
import kr.co.lookst.main.domain.SearchItem;
import kr.co.lookst.post.domain.OrderFormPageDto;
import kr.co.lookst.post.domain.OrderHistoryDto;
import kr.co.lookst.post.domain.OrderInfoDto;
/*import kr.co.lookst.post.domain.OrderPagePrdtDto;*/
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

	/* List<OrderPagePrdtDto> orderPagePrdt(Integer product_no) throws Exception; */

	List<OrderInfoDto> orderInfo(Integer product_no) throws Exception;

//	List<Product> shopListSearchResultPage(SearchItem_prdtList sc) throws Exception;

//	int shopListSearchResultCnt(SearchItem sc) throws Exception;

//	List<Product> shopListSearchResultPage(SearchItem sc) throws Exception;

	/* 상품 리스트 */
	int shopListCnt(SearchItem_prdtList sc) throws Exception;
	/* 상품 검색 리스트 */
	List<Product> shopListPage(SearchItem_prdtList sc) throws Exception;

	List<OrderHistoryDto> orderHistory(String member_id) throws Exception;

	int prdtOrderDel(Integer prdt_order_no, String member_id) throws Exception;

	


	/*
	 * orderFormPageDto orderFormpage(orderFormPageDto orderFormpage) throws
	 * Exception;
	 */



	

	
	
}
