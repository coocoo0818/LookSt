package kr.co.lookst.admin.dao;

import java.util.List;

import kr.co.lookst.main.domain.IndexDto;

public interface AdminDao {


	List<IndexDto> memberList() throws Exception;
	int memberAuthModify(String member_id, String auth) throws Exception;
	int memberKickOut(String member_id) throws Exception;

}
