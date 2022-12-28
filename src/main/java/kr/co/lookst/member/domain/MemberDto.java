package kr.co.lookst.member.domain;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class MemberDto {

	private String member_id;			//아이디(Email)
	private String member_pw;			//비밀번호
	private String member_nick;			//닉네임
	private String member_name;			//이름
	private String member_phon;			//폰번호
	private String member_addr;			//주소
	private String member_addr2;		//상세주소
	private String member_zip;			//우편번호
	private Date member_since;			//가입일
	private Date member_updp;			//수정일
	private boolean member_check;		//메일 수신여부
	private boolean member_smscheck;	//문자 수신여부
	private String member_type;			//가입 타입
	private List<MemAuthDto> authList;	//멤버 권한
	
}

