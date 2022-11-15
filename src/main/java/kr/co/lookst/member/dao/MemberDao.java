package kr.co.lookst.member.dao;

import kr.co.lookst.member.domain.MemberDto;

public interface MemberDao {

	String NAMESPACE = "kr.co.lookst.member.dao.MemberMapper.";
	
	public MemberDto login(MemberDto dto);

	
}
