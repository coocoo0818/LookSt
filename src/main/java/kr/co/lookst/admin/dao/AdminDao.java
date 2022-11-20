package kr.co.lookst.admin.dao;

import java.util.List;

import kr.co.lookst.admin.domain.MemMGMDto;
import kr.co.lookst.main.domain.SearchItem;

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


}
