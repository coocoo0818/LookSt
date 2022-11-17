package kr.co.lookst.post.domain;

public class snslist_infoDto { 

	private String post_img_img;
	private String post_content;
	private String post_tag_con;
	private String prdt_img_name;
	private String product_name;
	private int product_price;
	
	public snslist_infoDto() {
		
	}

	public snslist_infoDto(String post_img_img, String post_content, String post_tag_con, String prdt_img_name,
			String product_name, int product_price) {
		//super();
		this.post_img_img = post_img_img;
		this.post_content = post_content;
		this.post_tag_con = post_tag_con;
		this.prdt_img_name = prdt_img_name;
		this.product_name = product_name;
		this.product_price = product_price;
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

	public String getPost_tag_con() {
		return post_tag_con;
	}

	public void setPost_tag_con(String post_tag_con) {
		this.post_tag_con = post_tag_con;
	}

	public String getPrdt_img_name() {
		return prdt_img_name;
	}

	public void setPrdt_img_name(String prdt_img_name) {
		this.prdt_img_name = prdt_img_name;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	@Override
	public String toString() {
		return "snslist_infoDto [post_img_img=" + post_img_img + ", post_content=" + post_content + ", post_tag_con="
				+ post_tag_con + ", prdt_img_name=" + prdt_img_name + ", product_name=" + product_name
				+ ", product_price=" + product_price + "]";
	}
	
	
	
}
