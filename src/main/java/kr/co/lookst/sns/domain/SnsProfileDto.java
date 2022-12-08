package kr.co.lookst.sns.domain;

import java.util.Date;

import lombok.Data;

@Data
public class SnsProfileDto {

	private String member_id;
	private String member_nick;
	private String profile_img;
	private String profile_intro;
	private String profile_uuid;
	private Date profile_date;
	
	public SnsProfileDto() {
		// TODO Auto-generated constructor stub
	}

	public SnsProfileDto(String member_id, String member_nick, String profile_img, String profile_intro) {
		//super();
		this.member_id = member_id;
		this.member_nick = member_nick;
		this.profile_img = profile_img;
		this.profile_intro = profile_intro;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_nick() {
		return member_nick;
	}

	public void setMember_nick(String member_nick) {
		this.member_nick = member_nick;
	}

	public String getProfile_img() {
		return profile_img;
	}

	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}

	public String getProfile_intro() {
		return profile_intro;
	}

	public void setProfile_intro(String profile_intro) {
		this.profile_intro = profile_intro;
	}

	@Override
	public String toString() {
		return "SnsProfileDto [member_id=" + member_id + ", member_nick=" + member_nick + ", profile_img=" + profile_img
				+ ", profile_intro=" + profile_intro + "]";
	}
	
	
	
	
}
