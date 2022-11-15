package kr.co.lookst.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.lookst.member.dao.MemberDao;
import kr.co.lookst.member.domain.MemberDto;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDao dao;
	
	@Override
	public MemberDto login(MemberDto dto) {
		return dao.login(dto);
	}

}
