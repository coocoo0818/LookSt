package kr.co.lookst.main.domain;

import lombok.Data;

@Data
public class StylePickDto {

	private Integer product_no;
	private String profile_img;
	private String member_nick;
	private String post_img_img;

	public StylePickDto() {
		// TODO Auto-generated constructor stub
	}

	public StylePickDto(Integer product_no, String profile_img, String member_nick, String post_img_img) {
		super();
		this.product_no = product_no;
		this.profile_img = profile_img;
		this.member_nick = member_nick;
		this.post_img_img = post_img_img;
	}

	
}
