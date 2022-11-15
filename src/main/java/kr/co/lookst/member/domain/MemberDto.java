package kr.co.lookst.member.domain;

import java.util.Date;
import java.util.Objects;

public class MemberDto {

	private String member_id;			//아이디(Email)
	private String member_pw;			//비밀번호
	private String member_nick;			//닉네임
	private String member_name;			//이름
	private int member_phon;			//폰번호
	private String member_addr;			//주소
	private String member_addr2;		//상세주소
	private String member_zip;			//우편번호
	private Date member_since;			//가입일
	private Date member_updp;			//수정일
	private boolean member_check;		//메일 수신여부
	private boolean member_smscheck;	//문자 수신여부
	private String member_type;			//가입 타입
	
	public MemberDto(){}

	public MemberDto(String member_id, String member_pw, String member_nick, String member_name, int member_phon,
			String member_addr, String member_addr2, String member_zip, Date member_since, Date member_updp,
			boolean member_check, boolean member_smscheck, String member_type) {
		super();
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_nick = member_nick;
		this.member_name = member_name;
		this.member_phon = member_phon;
		this.member_addr = member_addr;
		this.member_addr2 = member_addr2;
		this.member_zip = member_zip;
		this.member_since = member_since;
		this.member_updp = member_updp;
		this.member_check = member_check;
		this.member_smscheck = member_smscheck;
		this.member_type = member_type;
	}

	@Override
	public int hashCode() {
		return Objects.hash(member_addr, member_addr2, member_check, member_id, member_name, member_nick, member_phon,
				member_pw, member_since, member_smscheck, member_type, member_updp, member_zip);
	}
 
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MemberDto other = (MemberDto) obj;
		return Objects.equals(member_addr, other.member_addr) && Objects.equals(member_addr2, other.member_addr2)
				&& Objects.equals(member_check, other.member_check) && Objects.equals(member_id, other.member_id)
				&& Objects.equals(member_name, other.member_name) && Objects.equals(member_nick, other.member_nick)
				&& member_phon == other.member_phon && Objects.equals(member_pw, other.member_pw)
				&& Objects.equals(member_since, other.member_since) && Objects.equals(member_smscheck, other.member_smscheck)
				&& Objects.equals(member_type, other.member_type) && Objects.equals(member_updp, other.member_updp)
				&& member_zip == other.member_zip;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public String getMember_nick() {
		return member_nick;
	}

	public void setMember_nick(String member_nick) {
		this.member_nick = member_nick;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public int getMember_phon() {
		return member_phon;
	}

	public void setMember_phon(int member_phon) {
		this.member_phon = member_phon;
	}

	public String getMember_addr() {
		return member_addr;
	}

	public void setMember_addr(String member_addr) {
		this.member_addr = member_addr;
	}

	public String getMember_addr2() {
		return member_addr2;
	}

	public void setMember_addr2(String member_addr2) {
		this.member_addr2 = member_addr2;
	}

	public String getMember_zip() {
		return member_zip;
	}

	public void setMember_zip(String member_zip) {
		this.member_zip = member_zip;
	}

	public Date getMember_since() {
		return member_since;
	}

	public void setMember_since(Date member_since) {
		this.member_since = member_since;
	}

	public Date getMember_updp() {
		return member_updp;
	}

	public void setMember_updp(Date member_updp) {
		this.member_updp = member_updp;
	}

	public boolean getMember_check() {
		return member_check;
	}

	public void setMember_check(boolean member_check) {
		this.member_check = member_check;
	}

	public boolean getMember_smscheck() {
		return member_smscheck;
	}

	public void setMember_smscheck(boolean member_smscheck) {
		this.member_smscheck = member_smscheck;
	}
	
	public String getMember_type() {
		return member_type;
	}

	public void setMember_type(String member_type) {
		this.member_type = member_type;
	}
	
}
