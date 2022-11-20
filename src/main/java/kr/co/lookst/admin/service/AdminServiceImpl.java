package kr.co.lookst.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.lookst.admin.dao.AdminDao;
import kr.co.lookst.admin.domain.MemMGMDto;
import kr.co.lookst.main.domain.SearchItem;

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

}
