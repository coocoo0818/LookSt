package kr.co.lookst.admin.dao;

import java.util.List;

import kr.co.lookst.admin.domain.MemMGMDto;
import kr.co.lookst.main.domain.IndexDto;
import kr.co.lookst.main.domain.SearchItem;

public interface AdminDao {


	List<IndexDto> memberList() throws Exception;
	int memberAuthModify(String member_id, String auth) throws Exception;
	int memberKickOut(String member_id) throws Exception;
	
	public int count() throws Exception;
	int searchResultCnt(SearchItem sc) throws Exception;
	List<MemMGMDto> searchSelectPage(SearchItem sc) throws Exception;

}
