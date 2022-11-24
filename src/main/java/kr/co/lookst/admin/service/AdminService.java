package kr.co.lookst.admin.service;

import java.util.List;

import kr.co.lookst.admin.domain.MemMGMDto;
import kr.co.lookst.main.domain.Prdt_Img;
import kr.co.lookst.main.domain.Prdt_Option;
import kr.co.lookst.main.domain.Product;
import kr.co.lookst.main.domain.SearchItem;

public interface AdminService {
	/* 회원 리스트 */
	/* List<IndexDto> getMemberList() throws Exception; */
	/* 회원 권한 변경 */
	int authModify(String member_id, String auth) throws Exception;
	/* 회원 강퇴 */
	int memberKickOut(String member_id) throws Exception;
	/* 회원 토탈 */
	int getSearchResultCnt(SearchItem sc) throws Exception;
	/* 회원 검색 리스트 */
	List<MemMGMDto> getsearchResultPage(SearchItem sc) throws Exception;
	
	/* SNS 토탈 */
	int getPostSearchResultCnt(SearchItem sc) throws Exception;
	/* SNS 검색 리스트 */
	List<MemMGMDto> getPostsearchResultPage(SearchItem sc) throws Exception;
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
	
	/* 상품 정보 */
	Product getproductInfo(Integer product_no) throws Exception;
	List<Prdt_Option> getproductSize(Integer product_no) throws Exception;
	List<Prdt_Img> getproductImg(Integer product_no) throws Exception;
	List<Prdt_Option> productColor(Integer product_no, String prdt_option_size) throws Exception;

	

}
