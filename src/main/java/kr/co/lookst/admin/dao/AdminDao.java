package kr.co.lookst.admin.dao;

import java.util.List;

import kr.co.lookst.admin.domain.MemMGMDto;
import kr.co.lookst.main.domain.NPostDto;
import kr.co.lookst.main.domain.PrdtOrderDto;
import kr.co.lookst.main.domain.Prdt_Img;
import kr.co.lookst.main.domain.Prdt_Option;
import kr.co.lookst.main.domain.Product;
import kr.co.lookst.main.domain.SearchItem;
import kr.co.lookst.main.domain.SnsCommentDto;
import kr.co.lookst.main.domain.SnsHeartDto;
import kr.co.lookst.post.domain.OrderInfoDto;
import kr.co.lookst.post.domain.Post_TagDto;
import kr.co.lookst.post.domain.Post_imgDto;
import kr.co.lookst.post.domain.post_com_tagDto;

public interface AdminDao {

	/* 회원 리스트 */
	/* List<IndexDto> memberList() throws Exception; */
	/* 회원 권한 변경 */
	int memberAuthModify(String member_id, String auth) throws Exception;
	/* 회원 강퇴 */
	int memberKickOut(String member_id) throws Exception;
	/* 회원 토탈 */
	int searchResultCnt(SearchItem sc) throws Exception;
	/* 회원 검색 리스트 */
	List<MemMGMDto> searchSelectPage(SearchItem sc) throws Exception;
	
	
	/* SNS 토탈 */
	int postSearchResultCnt(SearchItem sc) throws Exception;
	/* SNS 검색 리스트 */
	List<MemMGMDto> postSearchResultPage(SearchItem sc) throws Exception;
	/* SNS 강제 삭제*/
	int postDelete(int postNo) throws Exception;

	/* 게시판 토탈 */
	int boardSearchResultCnt(SearchItem sc) throws Exception;
	/* 게시판 검색 리스트 */
	List<MemMGMDto> boardSearchResultPage(SearchItem sc) throws Exception;
	/* 게시글 상태 변경 */
	int boardModify(Integer board_no, String board_type) throws Exception;
	/* 게시글 삭제 */
	int boardDelete(Integer board_no) throws Exception;
	
	/* 메거진 신청 토탈 */
	int boardApplyingSearchResultCnt(SearchItem sc) throws Exception;
	/* 메거진 신청 검색 리스트 */
	List<MemMGMDto> boardApplyingsearchResultPage(SearchItem sc) throws Exception;
	/* 메거진 수락 */
	int magazinAgree(Integer board_no) throws Exception;
	/* 메거진 거부 */
	int magazinReject(Integer board_no) throws Exception;
	
	/* 판매자 신청 토탈 */
	int sellerApplyingSearchResultCnt(SearchItem sc) throws Exception;
	/* 판매자 신청 검색 리스트 */
	List<MemMGMDto> sellerApplyingsearchResultPage(SearchItem sc) throws Exception;
	/* 판매자 수락 */
	int sellerAgree(String seller_no) throws Exception;
	/* 판매자 거부 */
	int sellerReject(String seller_no) throws Exception;
	
	/* 상품 리스트 출력 */
	int shopListSearchResultCnt(SearchItem sc) throws Exception;
	/* 상품 정보 */
	Product getproductInfo(Integer product_no) throws Exception;
	/* 상품 검색 리스트 */
	List<Product> shopListSearchResultPage(SearchItem sc) throws Exception;
	/* 현재 상품 재고 사이즈 출력 */
	List<Prdt_Option> getproductSize(Integer product_no) throws Exception;
	/* 상품 이미지 출력 */
	List<Prdt_Img> getproductImg(Integer product_no) throws Exception;
	/* 현재 상품 재고 컬러 출력 */
	List<Prdt_Option> productColor(Integer product_no, String prdt_option_size) throws Exception;
	/* 오더 페이지 이동 */
	List<OrderInfoDto> orderInfo(Integer product_no) throws Exception;
	/* 주문 내용 삽입 */
	int orderInsert(PrdtOrderDto prdt_order) throws Exception;
	
	/* sns total list */
	List<Integer> snsTotalList() throws Exception;
	/* sns 이미지 및 정보 출력 */
	List<MemMGMDto> snsTotalListCarousel(Integer snsTotalList) throws Exception;
	/* 포스트 태그 정보 */
	List<Post_TagDto> postTagInfo(Integer snsTotalList) throws Exception;
	/* sns sns 상단 정보 출력 */
	List<MemMGMDto> snsTopList() throws Exception;
	/* sns 태그정보 출력 */
	List<post_com_tagDto> tagInfoList(Integer post_no) throws Exception;
	/* 좋아요 체크 */
	int postLikeInsert(SnsHeartDto snsHeartDto) throws Exception;
	/* 좋아요 취소 */
	int postLikeDelete(SnsHeartDto snsHeartDto) throws Exception;
	/* 좋아요 출력 */
	List<Integer> postLikeCheck(String login_id) throws Exception;
	/* sns 클릭 한 상세 포스트 */
	MemMGMDto snsDetailClick(Integer post_no) throws Exception;
	/* sns 클릭 한 이미지 */
	List<Post_imgDto> snsDetailClickImg(Integer post_no) throws Exception;
	/* sns 디테일 페이지 상품 태그 갯수 */
	int postTagInfoCnt(Integer post_no) throws Exception;
	/* sns 디테일 페이지 좋아요 갯수 */
	int postLikedCnt(Integer post_no) throws Exception;
	/* sns 디테일 페이지 좋아요 체크 */
	int postLikedCheck(SnsHeartDto snsHeartDto) throws Exception;
	/* sns 댓글 리스트 */
	List<SnsCommentDto> snsReplyList(Integer post_no) throws Exception;
	/* 개인 프로필, 닉네임 호출 */
	MemMGMDto myNickProfile(String login_id) throws Exception;
	/* sns 모댓글 작성 */
	NPostDto postWriteReply(SnsCommentDto snsCommentDto);
	/* sns 답글 댓글 작성 */
	NPostDto postWriteRereply(SnsCommentDto snsCommentDto);
	/* 모댓글 삭제 */
	NPostDto postDeleteReply(SnsCommentDto snsCommentDto);
	/* 답글 삭제 */
	NPostDto postDeleteRereply(SnsCommentDto snsCommentDto);
	
}
