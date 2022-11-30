package kr.co.lookst.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.lookst.member.dao.MemberDao;
import kr.co.lookst.member.domain.MemAuthDto;
import kr.co.lookst.member.domain.MemberDto;
import kr.co.lookst.seller.domain.SellerDto;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDao dao;
	
	@Override
	public MemberDto login(MemberDto dto) throws Exception {
		return dao.login(dto);
	}

	@Override
	public int register(MemberDto dto) throws Exception {
		return dao.register(dto);
	}

	@Override
	public int idCheck(String member_id) throws Exception {
		int cnt = dao.idCheck(member_id);
		return cnt;
	}

	@Override
	public MemberDto selectInfo(String member_id) throws Exception {
		return dao.selectInfo(member_id);
	}

	@Override
	public int updateMember(MemberDto dto) throws Exception {
		// TODO Auto-generated method stub
		return dao.updateInfo(dto);
	}
	
	@Override
	public int deleteMember(String member_id) throws Exception {
		return dao.deleteMember(member_id);
	}

	@Override
	public int checkSellerInfo(String member_id) throws Exception {
		int cnt = dao.checkSellerInfo(member_id);
		return cnt;
	}

	@Override
	public SellerDto selectSellerInfo(String member_id) throws Exception {
		return dao.selectSellerInfo(member_id);
	}

	@Override
	public int insertSellerInfo(SellerDto sellDto) throws Exception {
		return dao.insertSellerInfo(sellDto);
	}

	@Override
	public int updateSellerInfo(SellerDto sellDto) throws Exception {
		return dao.updateSellerInfo(sellDto);
	}

	@Override
	public int insertAuthInfo(String member_id) throws Exception {
		return dao.insertAuthInfo(member_id);
	}



}
