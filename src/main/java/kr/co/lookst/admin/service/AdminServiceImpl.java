package kr.co.lookst.admin.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.lookst.admin.dao.AdminDao;
import kr.co.lookst.admin.domain.MemMGMDto;
import kr.co.lookst.main.domain.Prdt_Img;
import kr.co.lookst.main.domain.Prdt_Option;
import kr.co.lookst.main.domain.Product;
import kr.co.lookst.main.domain.SearchItem;
import kr.co.lookst.post.domain.Post_imgDto;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	AdminDao adminDao;
	
	/* 회원 리스트 */
	/*
	 * @Override public List<IndexDto> getMemberList() throws Exception { return
	 * adminDao.memberList(); }
	 */

	/* 회원 권한 변경 */
	@Override
	public int authModify(String member_id, String auth) throws Exception {
		return adminDao.memberAuthModify(member_id, auth);
	}
	/* 회원 강퇴 */
	@Override
	public int memberKickOut(String member_id) throws Exception {
		return adminDao.memberKickOut(member_id);
	}
	/* 회원 토탈 */
	@Override
	public int getSearchResultCnt(SearchItem sc) throws Exception {
		return adminDao.searchResultCnt(sc);
	}
	/* 회원 검색 리스트 */
	@Override
	public List<MemMGMDto> getsearchResultPage(SearchItem sc) throws Exception {
		return adminDao.searchSelectPage(sc);
	}
	
	/* SNS 토탈 */
	@Override
	public int getPostSearchResultCnt(SearchItem sc) throws Exception {
		return adminDao.postSearchResultCnt(sc);
	}
	/* SNS 검색 리스트 */
	@Override
	public List<MemMGMDto> getPostsearchResultPage(SearchItem sc) throws Exception {
		return adminDao.postSearchResultPage(sc);
	}
	/* SNS 강제 삭제*/
	@Override
	public int postDelete(int postNo) throws Exception {
		return adminDao.postDelete(postNo);
	}
	
	/* 게시판 토탈 */
	@Override
	public int boardSearchResultCnt(SearchItem sc) throws Exception {
		return adminDao.boardSearchResultCnt(sc);
	}
	/* 게시판 검색 리스트 */
	@Override
	public List<MemMGMDto> boardSearchResultPage(SearchItem sc) throws Exception {
		return adminDao.boardSearchResultPage(sc);
	}
	/* 게시글 상태 변경 */
	@Override
	public int boardModify(Integer board_no, String board_type) throws Exception {
		return adminDao.boardModify(board_no, board_type);
	}
	/* 게시글 삭제 */
	@Override
	public int boardDelete(Integer board_no) throws Exception {
		return  adminDao.boardDelete(board_no);
	}
	
	/* 메거진 신청 토탈 */
	@Override
	public int boardApplyingSearchResultCnt(SearchItem sc) throws Exception {
		return adminDao.boardApplyingSearchResultCnt(sc);
	}
	/* 메거진 신청 검색 리스트 */
	@Override
	public List<MemMGMDto> boardApplyingsearchResultPage(SearchItem sc) throws Exception {
		return adminDao.boardApplyingsearchResultPage(sc);
	}
	/* 메거진 수락 */
	@Override
	public int magazinAgree(Integer board_no) throws Exception {
		return adminDao.magazinAgree(board_no);
	}
	/* 메거진 거부 */
	@Override
	public int magazinReject(Integer board_no) throws Exception {
		return adminDao.magazinReject(board_no);
	}
	
	/* 판매자 신청 토탈 */
	@Override
	public int sellerApplyingSearchResultCnt(SearchItem sc) throws Exception {
		return adminDao.sellerApplyingSearchResultCnt(sc);
	}
	/* 판매자 신청 검색 리스트 */
	@Override
	public List<MemMGMDto> sellerApplyingsearchResultPage(SearchItem sc) throws Exception {
		return adminDao.sellerApplyingsearchResultPage(sc);
	}
	/* 판매자 수락 */
	@Override
	public int sellerAgree(String seller_no) throws Exception {
		return adminDao.sellerAgree(seller_no);
	}
	/* 판매자 거부 */
	@Override
	public int sellerReject(String seller_no) throws Exception {
		return adminDao.sellerReject(seller_no);
	}
	
	/* 상품 정보 */
	@Override
	public Product getproductInfo(Integer product_no) throws Exception {
		return adminDao.getproductInfo(product_no);
	}
	@Override
	public List<Prdt_Option> getproductSize(Integer product_no) throws Exception {
		return adminDao.getproductSize(product_no);
	}
	@Override
	public List<Prdt_Img> getproductImg(Integer product_no) throws Exception {
		return adminDao.getproductImg(product_no);
	}
	@Override
	public List<Prdt_Option> productColor(Integer product_no, String prdt_option_size) throws Exception {
		return adminDao.productColor(product_no, prdt_option_size);
	}
	
	/* sns total list */
	@Override
	public List<Integer> snsTotalList() throws Exception {
		return adminDao.snsTotalList();
	}
	/* sns total 이미지 list */
	@Override
	public List<String> snsTotalListCarousel(List<Integer> snsTotalList) throws Exception {
		return adminDao.snsTotalListCarousel(snsTotalList);
	}


}
