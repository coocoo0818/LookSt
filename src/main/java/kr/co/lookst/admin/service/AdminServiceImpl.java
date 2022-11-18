package kr.co.lookst.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.lookst.admin.dao.AdminDao;
import kr.co.lookst.admin.domain.MemMGMDto;
import kr.co.lookst.main.domain.IndexDto;
import kr.co.lookst.main.domain.SearchItem;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	AdminDao adminDao;
	
	@Override
	public List<IndexDto> getMemberList() throws Exception {
		return adminDao.memberList();
	}

	@Override
	public int authModify(String member_id, String auth) throws Exception {
		return adminDao.memberAuthModify(member_id, auth);
	}

	@Override
	public int memberKickOut(String member_id) throws Exception {
		return adminDao.memberKickOut(member_id);
	}

	@Override
	public int getSearchResultCnt(SearchItem sc) throws Exception {
		return adminDao.searchResultCnt(sc);
	}

	@Override
	public List<MemMGMDto> getsearchResultPage(SearchItem sc) throws Exception {
		return adminDao.searchSelectPage(sc);
	}

}
