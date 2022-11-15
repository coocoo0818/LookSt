package kr.co.lookst.admin.domain;

import java.util.Date;

public class MemMGMDto {

	private String member_id;
	private	String member_pw;
	private String member_nick;
	private String member_name;
	private int member_phon;
	private String member_addr;
	private String member_addr2;
	private String member_zip;
	private Date member_since;
	private Date member_updt;
	private boolean member_check;
	private Character member_type;
	private String profile_img;
	private String mem_auth_auth;

	public MemMGMDto() {
		// TODO Auto-generated constructor stub
	}

	public MemMGMDto(String member_id, String member_pw, String member_nick, String member_name, int member_phon,
			String member_addr, String member_addr2, String member_zip, Date member_since, Date member_updt,
			boolean member_check, Character member_type, String profile_img, String mem_auth_auth) {
		//super();
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_nick = member_nick;
		this.member_name = member_name;
		this.member_phon = member_phon;
		this.member_addr = member_addr;
		this.member_addr2 = member_addr2;
		this.member_zip = member_zip;
		this.member_since = member_since;
		this.member_updt = member_updt;
		this.member_check = member_check;
		this.member_type = member_type;
		this.profile_img = profile_img;
		this.mem_auth_auth = mem_auth_auth;
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

	public Date getMember_updt() {
		return member_updt;
	}

	public void setMember_updt(Date member_updt) {
		this.member_updt = member_updt;
	}

	public boolean isMember_check() {
		return member_check;
	}

	public void setMember_check(boolean member_check) {
		this.member_check = member_check;
	}

	public Character getMember_type() {
		return member_type;
	}

	public void setMember_type(Character member_type) {
		this.member_type = member_type;
	}

	public String getProfile_img() {
		return profile_img;
	}

	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}

	public String getMem_auth_auth() {
		return mem_auth_auth;
	}

	public void setMem_auth_auth(String mem_auth_auth) {
		this.mem_auth_auth = mem_auth_auth;
	}

	@Override
	public String toString() {
		return "MemMGMDto [member_id=" + member_id + ", member_pw=" + member_pw + ", member_nick=" + member_nick
				+ ", member_name=" + member_name + ", member_phon=" + member_phon + ", member_addr=" + member_addr
				+ ", member_addr2=" + member_addr2 + ", member_zip=" + member_zip + ", member_since=" + member_since
				+ ", member_updt=" + member_updt + ", member_check=" + member_check + ", member_type=" + member_type
				+ ", profile_img=" + profile_img + ", mem_auth_auth=" + mem_auth_auth + "]";
	}

}
