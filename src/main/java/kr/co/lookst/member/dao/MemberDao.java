package kr.co.lookst.member.dao;

import kr.co.lookst.member.domain.MemAuthDto;
import kr.co.lookst.member.domain.MemberDto;
import kr.co.lookst.seller.domain.SellerDto;

public interface MemberDao {

	String NAMESPACE = "kr.co.lookst.member.dao.MemberMapper.";
	
	public MemberDto login(MemberDto dto) throws Exception;
	public int loginCheck(MemberDto dto) throws Exception;
	public int register(MemberDto dto) throws Exception;
	public int idCheck(String member_id) throws Exception;
	public MemberDto selectInfo(String member_id) throws Exception;
	public int updateInfo(MemberDto dto) throws Exception;
	public int deleteMember(String member_id) throws Exception;
	public int checkSellerInfo(String member_id) throws Exception;
	public SellerDto selectSellerInfo(String member_id) throws Exception;
	public int insertSellerInfo(SellerDto sellDto) throws Exception;
	public int updateSellerInfo(SellerDto sellDto) throws Exception;
	public int insertAuthInfo(String member_id) throws Exception;
	public String authCheck(String member_id) throws Exception;
	public int insertProfile(String member_id) throws Exception;

	
}
