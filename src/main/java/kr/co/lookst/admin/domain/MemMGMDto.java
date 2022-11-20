package kr.co.lookst.admin.domain;

import java.util.Date;

import kr.co.lookst.main.domain.NBoardDto;
import kr.co.lookst.main.domain.NSellerDto;
import kr.co.lookst.post.domain.Post_imgDto;
import lombok.Data;

@Data
public class MemMGMDto {

	private String member_id;
	private	String member_pw;
	private String member_nick;
	private String member_name;
	private String member_phon;
	private String member_addr;
	private String member_addr2;
	private String member_zip;
	private Date member_since;
	private Date member_updt;
	private boolean member_check;
	private String member_type;
	private String profile_img;
	private String mem_auth_auth;
	private Post_imgDto post_imgDto;
	private NBoardDto nBoardDto;
	private NSellerDto nSellerDto;
	
	public MemMGMDto() {
	}

	public MemMGMDto(String member_id, String member_pw, String member_nick, String member_name, String member_phon,
			String member_addr, String member_addr2, String member_zip, Date member_since, Date member_updt,
			boolean member_check, String member_type, String profile_img, String mem_auth_auth) {
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
	
}
