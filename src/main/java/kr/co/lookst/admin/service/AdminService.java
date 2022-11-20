package kr.co.lookst.admin.service;

import java.util.List;

import kr.co.lookst.admin.domain.MemMGMDto;
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
}
