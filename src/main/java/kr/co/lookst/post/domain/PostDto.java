package kr.co.lookst.post.domain;

public class PostDto {

	private String member_id;
	private int	post_no;
	private String post_content;
	private int post_date;
	private String post_type;
	
	public PostDto() {
		
	}

	public PostDto(String member_id, int post_no, String post_content, int post_date, String post_type) {
		super();
		this.member_id = member_id;
		this.post_no = post_no;
		this.post_content = post_content;
		this.post_date = post_date;
		this.post_type = post_type;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getPost_no() {
		return post_no;
	}

	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}

	public String getPost_content() {
		return post_content;
	}

	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}

	public int getPost_date() {
		return post_date;
	}

	public void setPost_date(int post_date) {
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
		return "PostDto [member_id=" + member_id + ", post_no=" + post_no + ", post_content=" + post_content
				+ ", post_date=" + post_date + ", post_type=" + post_type + "]";
	}
	
	
}
