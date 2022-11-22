package kr.co.lookst.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.lookst.admin.domain.MemMGMDto;
import kr.co.lookst.main.domain.Prdt_Img;
import kr.co.lookst.main.domain.Prdt_Option;
import kr.co.lookst.main.domain.Product;
import kr.co.lookst.main.domain.SearchItem;

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
	@Override
	public int sellerAgree(String seller_no) throws Exception {
		return session.update(namespace + "sellerAgree", seller_no);
	}
	@Override
	public int sellerReject(String seller_no) throws Exception {
		return session.update(namespace + "sellerReject", seller_no);
	}
	@Override
	public Product getproductInfo(Integer product_no) throws Exception {
		return session.selectOne(namespace + "getproductInfo", product_no);
	}
	@Override
	public List<Prdt_Option> getproductSize(Integer product_no) {
		return session.selectList(namespace + "getproductSize", product_no);
	}
	@Override
	public List<Prdt_Img> getproductImg(Integer product_no) {
		return session.selectList(namespace + "getproductImg", product_no);
	}


}
