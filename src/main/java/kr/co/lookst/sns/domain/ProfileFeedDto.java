package kr.co.lookst.sns.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ProfileFeedDto {
	
	private String member_id;
	private Integer post_no;
	private String post_img_img;
	private int post_img_seq;
	private Date post_date;
	private String post_type;
	private String post_content;
	private String post_img_uuid;
	
	public ProfileFeedDto() {
		// TODO Auto-generated constructor stub
	}

	public ProfileFeedDto(String member_id, Integer post_no) {
		//super();
		this.member_id = member_id;
		this.post_no = post_no;
	}



	public ProfileFeedDto(String member_id, Integer post_no, String post_img_img, 
							int post_img_seq, Date post_date, String post_type) {
		//super();
		this.member_id = member_id;
		this.post_no = post_no;
		this.post_img_img = post_img_img;
		this.post_img_seq = post_img_seq;
		this.post_date = post_date;
		this.post_type = post_type;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public Integer getPost_no() {
		return post_no;
	}

	public void setPost_no(Integer post_no) {
		this.post_no = post_no;
	}

	public String getPost_img_img() {
		return post_img_img;
	}

	public void setPost_img_img(String post_img_img) {
		this.post_img_img = post_img_img;
	}

	public int getPost_img_seq() {
		return post_img_seq;
	}

	public void setPost_img_seq(int post_img_seq) {
		this.post_img_seq = post_img_seq;
	}

	public Date getPost_date() {
		return post_date;
	}

	public void setPost_date(Date post_date) {
		this.post_date = post_date;
	}

	public String getPost_type() {
		return post_type;
	}

	public void setPost_type(String post_type) {
		this.post_type = post_type;
	}

	@Override
	public String toString() {
		return "ProfileFeedDto [member_id=" + member_id + ", post_no=" + post_no + ", post_img_img=" + post_img_img
				+ ", post_img_seq=" + post_img_seq + ", post_date=" + post_date + ", post_type=" + post_type + "]";
	}
	
	
}
