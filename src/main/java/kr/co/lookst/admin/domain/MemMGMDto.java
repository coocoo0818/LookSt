package kr.co.lookst.admin.domain;

import java.util.Date;

import kr.co.lookst.main.domain.NBoardDto;
import kr.co.lookst.main.domain.NPostDto;
import kr.co.lookst.main.domain.NSellerDto;
import kr.co.lookst.post.domain.Post_imgDto;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
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
	private NPostDto nPostDto;
	
	
}
