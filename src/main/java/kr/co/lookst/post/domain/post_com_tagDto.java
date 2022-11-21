package kr.co.lookst.post.domain;

public class post_com_tagDto {

	private String profile_img;
	private String member_nick;
	private String post_content;
	private String tag_content;
	
	public post_com_tagDto() {
		
	}

	public post_com_tagDto(String profile_img, String member_nick, String post_content, String tag_content) {
		super();
		this.profile_img = profile_img;
		this.member_nick = member_nick;
		this.post_content = post_content;
		this.tag_content = tag_content;
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

	public String getPost_content() {
		return post_content;
	}

	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}

	public String getTag_content() {
		return tag_content;
	}

	public void setTag_content(String tag_content) {
		this.tag_content = tag_content;
	}

	@Override
	public String toString() {
		return "post_com_tagDto [profile_img=" + profile_img + ", member_nick=" + member_nick + ", post_content="
				+ post_content + ", tag_content=" + tag_content + "]";
	}
	
	
	
}
