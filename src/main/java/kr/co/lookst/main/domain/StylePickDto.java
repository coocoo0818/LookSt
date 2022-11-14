package kr.co.lookst.main.domain;

public class StylePickDto {

	private String profile_img;
	private String member_nick;
	private String post_img_img;

	public StylePickDto() {
		// TODO Auto-generated constructor stub
	}

	public StylePickDto(String profile_img, String member_nick, String post_img_img) {
		//super();
		this.profile_img = profile_img;
		this.member_nick = member_nick;
		this.post_img_img = post_img_img;
	}

	public String getProfile_img() {
		return profile_img;
	}

	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}

	public String getMember_nick() {
		return member_nick;
	}

	public void setMember_nick(String member_nick) {
		this.member_nick = member_nick;
	}

	public String getPost_img_img() {
		return post_img_img;
	}

	public void setPost_img_img(String post_img_img) {
		this.post_img_img = post_img_img;
	}

	@Override
	public String toString() {
		return "StylePickDto [profile_img=" + profile_img + ", member_nick=" + member_nick + ", post_img_img="
				+ post_img_img + "]";
	}
	
	
}
