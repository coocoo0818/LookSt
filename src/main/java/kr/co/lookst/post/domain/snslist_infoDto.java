package kr.co.lookst.post.domain;

public class snslist_infoDto { 

	private String post_tag_img;
	private String post_tag_price;
	private String post_tag_name;
	
	public snslist_infoDto() {
		
	}

	public snslist_infoDto(String post_tag_img, String post_tag_price, String post_tag_name) {
		//super();
		this.post_tag_img = post_tag_img;
		this.post_tag_price = post_tag_price;
		this.post_tag_name = post_tag_name;
	}

	public String getPost_tag_img() {
		return post_tag_img;
	}

	public void setPost_tag_img(String post_tag_img) {
		this.post_tag_img = post_tag_img;
	}

	public String getPost_tag_price() {
		return post_tag_price;
	}

	public void setPost_tag_price(String post_tag_price) {
		this.post_tag_price = post_tag_price;
	}

	public String getPost_tag_name() {
		return post_tag_name;
	}

	public void setPost_tag_name(String post_tag_name) {
		this.post_tag_name = post_tag_name;
	}

	@Override
	public String toString() {
		return "snslist_infoDto [post_tag_img=" + post_tag_img + ", post_tag_price=" + post_tag_price
				+ ", post_tag_name=" + post_tag_name + "]";
	}
	
	
	
	
	
	
	
}
