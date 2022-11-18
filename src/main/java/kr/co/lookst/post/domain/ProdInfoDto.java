package kr.co.lookst.post.domain;

public class ProdInfoDto {

	private String post_img_img;
	private String post_content;
	private String post_tag_img;
	private String post_tag_name;
	private int post_tag_price;
	
	public ProdInfoDto() {
		
	}

	public ProdInfoDto(String post_img_img, String post_content, String post_tag_img, String post_tag_name,
			int post_tag_price) {
		super();
		this.post_img_img = post_img_img;
		this.post_content = post_content;
		this.post_tag_img = post_tag_img;
		this.post_tag_name = post_tag_name;
		this.post_tag_price = post_tag_price;
	}

	public String getPost_img_img() {
		return post_img_img;
	}

	public void setPost_img_img(String post_img_img) {
		this.post_img_img = post_img_img;
	}

	public String getPost_content() {
		return post_content;
	}

	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}

	public String getPost_tag_img() {
		return post_tag_img;
	}

	public void setPost_tag_img(String post_tag_img) {
		this.post_tag_img = post_tag_img;
	}

	public String getPost_tag_name() {
		return post_tag_name;
	}

	public void setPost_tag_name(String post_tag_name) {
		this.post_tag_name = post_tag_name;
	}

	public int getPost_tag_price() {
		return post_tag_price;
	}

	public void setPost_tag_price(int post_tag_price) {
		this.post_tag_price = post_tag_price;
	}

	@Override
	public String toString() {
		return "ProdInfoDto [post_img_img=" + post_img_img + ", post_content=" + post_content + ", post_tag_img="
				+ post_tag_img + ", post_tag_name=" + post_tag_name + ", post_tag_price=" + post_tag_price + "]";
	}

	
	

}