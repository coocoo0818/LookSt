package kr.co.lookst.sns.domain;

public class Post_imgDto {

	private int post_no;
	private int post_img_no;
	private String post_img_img;
	private int post_img_seq;
	
	public Post_imgDto() {
		// TODO Auto-generated constructor stub
	}

	public Post_imgDto(int post_no, int post_img_no, String post_img_img, int post_img_seq) {
		// super();
		this.post_no = post_no;
		this.post_img_no = post_img_no;
		this.post_img_img = post_img_img;
		this.post_img_seq = post_img_seq;
	}

	public Post_imgDto(int post_no, String post_img_img, int post_img_seq) {
		// super();
		this.post_no = post_no;
		this.post_img_img = post_img_img;
		this.post_img_seq = post_img_seq;
	}

	public int getPost_no() {
		return post_no;
	}

	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}

	public int getPost_img_no() {
		return post_img_no;
	}

	public void setPost_img_no(int post_img_no) {
		this.post_img_no = post_img_no;
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

	@Override
	public String toString() {
		return "Post_imgDto [post_no=" + post_no + ", post_img_no=" + post_img_no + ", post_img_img=" + post_img_img
				+ ", post_img_seq=" + post_img_seq + "]";
	}
	
	
}
