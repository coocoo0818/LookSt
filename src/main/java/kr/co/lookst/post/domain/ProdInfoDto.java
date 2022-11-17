package kr.co.lookst.post.domain;

public class ProdInfoDto {

	private String post_tag_img;
	private String post_tag_name;
	private int post_tag_price;
	
	public ProdInfoDto() {
		
	}

	public ProdInfoDto(String post_tag_img, String post_tag_name, int post_tag_price) {
		//super();
		this.post_tag_img = post_tag_img;
		this.post_tag_name = post_tag_name;
		this.post_tag_price = post_tag_price;
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
		return "ProdInfoDto [post_tag_img=" + post_tag_img + ", post_tag_name=" + post_tag_name + ", post_tag_price="
				+ post_tag_price + "]";
	}

	
	

}