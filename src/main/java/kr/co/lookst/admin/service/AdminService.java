package kr.co.lookst.admin.service;

import java.util.List;

import kr.co.lookst.admin.domain.MemMGMDto;
import kr.co.lookst.main.domain.IndexDto;
import kr.co.lookst.main.domain.SearchItem;

public interface AdminService {

	List<IndexDto> getMemberList() throws Exception;
	int authModify(String member_id, String auth) throws Exception;
	int memberKickOut(String member_id) throws Exception;
	
	int getSearchResultCnt(SearchItem sc) throws Exception;
	List<MemMGMDto> getsearchResultPage(SearchItem sc) throws Exception;
}
