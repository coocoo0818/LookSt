package kr.co.lookst.admin.service;

import java.util.List;

import kr.co.lookst.main.domain.IndexDto;

public interface AdminService {

	List<IndexDto> getMemberList() throws Exception;

	int authModify(String member_id, String auth) throws Exception;
}
