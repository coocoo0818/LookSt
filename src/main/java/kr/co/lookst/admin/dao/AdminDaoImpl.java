package kr.co.lookst.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

@Repository
public class AdminDaoImpl implements AdminDao{

	@Autowired
	private SqlSession session;
	private static String namespace = "kr.co.lookst.admin.dao.AdminMapper.";

	/* 회원 권한 변경 */
	@Override
	public int memberAuthModify(String member_id, String auth) throws Exception {
		Map map = new HashMap();
		map.put("member_id", member_id);
		map.put("auth", auth);
		return session.update(namespace + "authModify", map);
	}
	/* 회원 강퇴 */
	@Override
	public int memberKickOut(String member_id) throws Exception {
		return session.delete(namespace + "memberKickOut", member_id);
	}
	/* 회원 토탈 */
	@Override
	public int searchResultCnt(SearchItem sc) throws Exception {
		return session.selectOne(namespace + "searchResultCnt", sc);
	}
	/* 회원 검색 리스트 */
	@Override
	public List<MemMGMDto> searchSelectPage(SearchItem sc) throws Exception {
		return session.selectList(namespace + "searchSelectPage", sc);
	}
	
	/* SNS 토탈 */
	@Override
	public int postSearchResultCnt(SearchItem sc) throws Exception {
		return session.selectOne(namespace + "postSearchResultCnt", sc);
	}
	/* SNS 검색 리스트 */
	@Override
	public List<MemMGMDto> postSearchResultPage(SearchItem sc) throws Exception {
		return session.selectList(namespace + "postSearchResultPage", sc);
	}
	/* SNS 강제 삭제*/
	@Override
	public int postDelete(int postNo) throws Exception {
		return session.delete(namespace + "postDelete", postNo);
	}
	
	/* 게시판 토탈 */
	@Override
	public int boardSearchResultCnt(SearchItem sc) throws Exception {
		return session.selectOne(namespace + "boardSearchResultCnt", sc);
	}
	/* 게시판 검색 리스트 */
	@Override
	public List<MemMGMDto> boardSearchResultPage(SearchItem sc) throws Exception {
		return session.selectList(namespace + "boardSearchResultPage", sc);
	}
	/* 게시글 상태 변경 */
	@Override
	public int boardModify(Integer board_no, String board_type) throws Exception {
		Map map = new HashMap();
		map.put("board_no", board_no);
		map.put("board_type", board_type);
		return session.update(namespace + "boardModify", map);
	}
	/* 게시글 삭제 */
	@Override
	public int boardDelete(Integer board_no) throws Exception {
		return session.delete(namespace + "boardDelete", board_no);
	}
	
	/* 메거진 신청 토탈 */
	@Override
	public int boardApplyingSearchResultCnt(SearchItem sc) throws Exception {
		return session.selectOne(namespace + "boardApplyingSearchResultCnt", sc);
	}
	/* 메거진 신청 검색 리스트 */
	@Override
	public List<MemMGMDto> boardApplyingsearchResultPage(SearchItem sc) throws Exception {
		return session.selectList(namespace + "boardApplyingsearchResultPage", sc);
	}
	/* 메거진 수락 */
	@Override
	public int magazinAgree(Integer board_no) throws Exception {
		return session.update(namespace + "magazinAgree", board_no);
	}
	/* 메거진 거부 */
	@Override
	public int magazinReject(Integer board_no) throws Exception {
		return session.update(namespace + "magazinReject", board_no);
	}

	/* 판매자 신청 토탈 */
	@Override
	public int sellerApplyingSearchResultCnt(SearchItem sc) throws Exception {
		return session.selectOne(namespace + "sellerApplyingSearchResultCnt", sc);
	}
	/* 판매자 신청 검색 리스트 */
	@Override
	public List<MemMGMDto> sellerApplyingsearchResultPage(SearchItem sc) throws Exception {
		return session.selectList(namespace + "sellerApplyingsearchResultPage", sc);
	}
	/* 판매자 수락 */
	@Override
	public int sellerAgree(String seller_no) throws Exception {
		return session.update(namespace + "sellerAgree", seller_no);
	}
	/* 메거진 거부 */
	@Override
	public int sellerReject(String seller_no) throws Exception {
		return session.update(namespace + "sellerReject", seller_no);
	}
	
	/* 상품 리스트 출력 */
	@Override
	public int shopListSearchResultCnt(SearchItem sc) throws Exception {
		return session.selectOne(namespace + "shopListSearchResultCnt", sc);
	}
	/* 상품 검색 리스트 */
	@Override
	public List<Product> shopListSearchResultPage(SearchItem sc) throws Exception {
		return session.selectList(namespace + "shopListSearchResultPage", sc);
	}
	/* 상품 정보 */
	@Override
	public Product getproductInfo(Integer product_no) throws Exception {
		return session.selectOne(namespace + "getproductInfo", product_no);
	}
	/* 현재 상품 재고 사이즈 출력 */
	@Override
	public List<Prdt_Option> getproductSize(Integer product_no) {
		return session.selectList(namespace + "getproductSize", product_no);
	}
	/* 상품 이미지 출력 */
	@Override
	public List<Prdt_Img> getproductImg(Integer product_no) {
		return session.selectList(namespace + "getproductImg", product_no);
	}
	/* 현재 상품 재고 컬러 출력 */
	@Override
	public List<Prdt_Option> productColor(Integer product_no, String prdt_option_size) throws Exception {
		Map map = new HashMap();
		map.put("product_no", product_no);
		map.put("prdt_option_size", prdt_option_size);
		return session.selectList(namespace + "productColor", map);
	}
	/* 오더 페이지 이동 */
	@Override
	public List<OrderInfoDto> orderInfo(Integer product_no) throws Exception {
		 return session.selectList(namespace + "orderInfo", product_no);
	}
	/* 주문 내용 삽입 */
	@Override
	public int orderInsert(PrdtOrderDto prdt_order) throws Exception {
		System.out.println(prdt_order);
		return session.insert(namespace + "orderInsert", prdt_order);
	}
	
	/* sns total list */
	@Override
	public List<Integer> snsTotalList() throws Exception {
		return session.selectList(namespace + "snsTotalList");
	}
	/* sns 이미지 및 정보 출력 */
	@Override
	public List<MemMGMDto> snsTotalListCarousel(Integer snsTotalList) throws Exception {
		return session.selectList(namespace + "snsTotalListCarousel", snsTotalList);
	}
	/* sns sns 상단 정보 출력 */
	@Override
	public List<MemMGMDto> snsTopList() throws Exception {
		return session.selectList(namespace + "snsTopList");
	}
	/* 포스트 태그 정보 */
	@Override
	public List<Post_TagDto> postTagInfo(Integer snsTotalList) throws Exception {
		return session.selectList(namespace + "postTagInfo", snsTotalList);
	}
	/* sns 태그정보 출력 */
	@Override
	public List<post_com_tagDto> tagInfoList(Integer post_no) throws Exception {
		return session.selectList(namespace + "tagInfoList", post_no);
	}
	/* 좋아요 체크 */
	@Override
	public int postLikeInsert(SnsHeartDto snsHeartDto) throws Exception {
		return session.insert(namespace + "postLikeInsert", snsHeartDto);
	}
	/* 좋아요 취소 */
	@Override
	public int postLikeDelete(SnsHeartDto snsHeartDto) throws Exception {
		return session.delete(namespace + "postLikeDelete", snsHeartDto);
	}
	/* 좋아요 출력 */
	@Override
	public List<Integer> postLikeCheck(String login_id) throws Exception {
		return session.selectList(namespace + "postLikeCheck", login_id);
	}
	/* sns 클릭 한 상세 포스트 */
	@Override
	public MemMGMDto snsDetailClick(Integer post_no) throws Exception {
		return session.selectOne(namespace + "snsDetailClick", post_no);
	}
	/* sns 클릭 한 이미지 */
	@Override
	public List<Post_imgDto> snsDetailClickImg(Integer post_no) throws Exception {
		return session.selectList(namespace + "snsDetailClickImg", post_no);
	}
	/* sns 디테일 페이지 상품 태그 갯수 */
	@Override
	public int postTagInfoCnt(Integer post_no) throws Exception {
		return session.selectOne(namespace + "postTagInfoCnt", post_no);
	}
	/* sns 디테일 페이지 좋아요 갯수 */
	@Override
	public int postLikedCnt(Integer post_no) throws Exception {
		return session.selectOne(namespace + "postLikedCnt", post_no);
	}
	/* sns 디테일 페이지 좋아요 체크 */
	@Override
	public int postLikedCheck(SnsHeartDto snsHeartDto) throws Exception {
		return session.selectOne(namespace + "postLikedCheck", snsHeartDto);
	}
	/* sns 댓글 리스트 */
	@Override
	public List<SnsCommentDto> snsReplyList(Integer post_no) throws Exception {
		return session.selectList(namespace + "snsReplyList", post_no);
	}
	/* 개인 프로필, 닉네임 호출 */
	@Override
	public MemMGMDto myNickProfile(String login_id) throws Exception {
		return session.selectOne(namespace + "myNickProfile", login_id);
	}
	/* sns 모댓글 작성 */
	@Override
	public NPostDto postWriteReply(SnsCommentDto snsCommentDto) {
		// p_board 테이블에 해당 게시물의 reply수를 +1 하기위한 to세팅
		NPostDto postDto = new NPostDto();
		postDto.setPost_no(snsCommentDto.getPost_no());
		
		// 해당 게시물의 reply를 +1 한다.
		session.update(namespace + "postReplyUp", postDto);
		
		// 현재 sns_comment 테이블의 가장 큰 no값을 가져온다.
		Integer replyMaxNo = session.selectOne(namespace + "postReplyMaxNo", postDto);

		int sns_comment_group = 0;
		 
		if (replyMaxNo == null) {
			sns_comment_group = 0;
		} else {
			sns_comment_group = (int)replyMaxNo;
		}
		// sns_comment_group 세팅
		snsCommentDto.setSns_comment_group(sns_comment_group + 1);

		int result = session.insert(namespace + "postReplyWrite", snsCommentDto);

		if (result == 1) {	// p_reply 테이블에 새로운 댓글 추가가 성공한다면..
			// 갱신된 댓글 갯수를 가져옴
			postDto = session.selectOne(namespace + "postReplyCount", postDto);
		}
		return postDto;
	}
	/* sns 답글 댓글 작성 */
	@Override
	public NPostDto postWriteRereply(SnsCommentDto snsCommentDto) {
		// p_board 테이블에 해당 게시물의 reply수를 +1 하기위한 to세팅
		NPostDto postDto = new NPostDto();
		postDto.setPost_reply(snsCommentDto.getPost_no());
		
		// 해당 게시물의 reply를 +1 한다.
		session.update(namespace + "postReplyUp", postDto);
		System.out.println("업데이트 전" + snsCommentDto);
		// 현재 sns_comment 테이블의 가장 큰 no값을 가져온다.
		Integer replySeqMaxNo = session.selectOne(namespace + "replySeqMaxNo", snsCommentDto);
		System.out.println("최고값 " + replySeqMaxNo);
		int sns_comment_seq = 0;
		 
		if (replySeqMaxNo == null) {
			sns_comment_seq = 0;
		} else {
			sns_comment_seq = (int)replySeqMaxNo;
		}
		// sns_comment_group 세팅
		snsCommentDto.setSns_comment_seq(sns_comment_seq + 1);
		System.out.println("업데이트 후 " + snsCommentDto);
		// p_reply 테이블에 추가 (댓글 작성과 동일)
		int result = session.insert(namespace + "postRereplyWrite", snsCommentDto);
		
		if (result == 1) {	// p_reply 테이블에 새로운 댓글 추가가 성공한다면..
			// 갱신된 댓글 갯수를 가져옴
			postDto = session.selectOne(namespace + "postReplyCount", postDto);
		}
		return postDto;
	}
	/* 모댓글 삭제 */
	@Override
	public NPostDto postDeleteReply(SnsCommentDto snsCommentDto) {
		// post 테이블에 해당 게시물의 reply수를 -1 하기위한 to세팅
		NPostDto postDto = new NPostDto();
		postDto.setPost_no(snsCommentDto.getPost_no());
		
		// grp가 reply의 no와 일치하는 댓글이 몇갠지 카운트한다. 모댓글에 딸린 답글이 몇갠지 카운트하기 위함
		System.out.println("댓글 카운트 확인" + snsCommentDto);
		Integer rereplyCount = session.selectOne(namespace + "postCountRereply", snsCommentDto);
		System.out.println("rereplyCount" + rereplyCount);
		int count_rereply = 0;
		if (rereplyCount == null) {
			count_rereply = 0;
		} else {
			count_rereply = (int)rereplyCount;
		}
		
		int result = 0;
		
		// 해당 게시물의 reply를 -1 한다.
		session.update(namespace + "postReplyDown", postDto);
		
		if(count_rereply==0) {	// 답글이 없을 때 - 그냥 삭제
			// p_reply 테이블에서 삭제
			result = session.delete(namespace + "postReplyDelete", snsCommentDto);
		}else {					// 답글이 있을 때 - content에 공백을 넣음 ("삭제된 게시물입니다" 라고 표기하기 위함)
			// p_reply 테이블에서 삭제하지 않고 content에 공백을 넣음 
			result = session.update(namespace + "postReplyNotDelete", snsCommentDto);
			System.out.println("업데이트 성공");
		}
		
		if (result == 1) {	// p_reply 테이블에서 댓글삭제가 성공한다면..
			// 갱신된 댓글 갯수를 가져옴
			postDto = session.selectOne(namespace + "postReplyCount", postDto);
		}
		return postDto;
	}
	/* 답글 삭제 */
	@Override
	public NPostDto postDeleteRereply(SnsCommentDto snsCommentDto) {
		// p_board 테이블에 해당 게시물의 reply수를 -1 하기위한 to세팅
		NPostDto postDto = new NPostDto();
		postDto.setPost_no(snsCommentDto.getPost_no());
			
		// 해당 게시물의 reply를 -1 한다.
		session.update(namespace + "postReplyDown", postDto);
				
		// p_reply 테이블에서 삭제
		int result = session.delete(namespace + "postReplyDelete", snsCommentDto);
		
		// group이 일치하는 답글이 몇갠지 카운트 한다. 카운트가 없고 모댓글의 content가 ""이면 모댓글을 삭제하기 위함.
		int count_rereply = session.selectOne(namespace + "postCountRereplyFromrereply", snsCommentDto);
		
		
		System.out.println("count_rereply = " + count_rereply);
		if(count_rereply == 1) {
			session.delete(namespace + "postReplyDeleteAfterRereplyDelete", snsCommentDto);
		}
		
		if (result == 1) {	// p_reply 테이블에서 댓글삭제가 성공한다면..
			// 갱신된 댓글 갯수를 가져옴
			postDto = session.selectOne(namespace + "postReplyCount", postDto);
		}
		return postDto;
	}

}
