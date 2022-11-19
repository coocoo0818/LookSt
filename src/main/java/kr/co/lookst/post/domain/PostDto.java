package kr.co.lookst.post.domain;

public class PostDto {

	private String member_nick;
	private String sns_comment_con;
	private String profile_img;
	private int sns_comment_date;
	
	public PostDto() {
		
	}

	public PostDto(String member_nick, String sns_comment_con, String profile_img, int sns_comment_date) {
		super();
		this.member_nick = member_nick;
		this.sns_comment_con = sns_comment_con;
		this.profile_img = profile_img;
		this.sns_comment_date = sns_comment_date;
	}

	public String getMember_nick() {
		return member_nick;
	}

	public void setMember_nick(String member_nick) {
		this.member_nick = member_nick;
	}

	public String getSns_comment_con() {
		return sns_comment_con;
	}

	public void setSns_comment_con(String sns_comment_con) {
		this.sns_comment_con = sns_comment_con;
	}

	public String getProfile_img() {
		return profile_img;
	}

	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}

	public int getSns_comment_date() {
		return sns_comment_date;
	}

	public void setSns_comment_date(int sns_comment_date) {
		this.sns_comment_date = sns_comment_date;
	}

	@Override
	public String toString() {
		return "PostDto [member_nick=" + member_nick + ", sns_comment_con=" + sns_comment_con + ", profile_img="
				+ profile_img + ", sns_comment_date=" + sns_comment_date + "]";
	}
	
	
	
	
	
	
}
