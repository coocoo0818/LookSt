package kr.co.lookst.post.domain;

import lombok.Data;

@Data
public class Post_TagDto {
	
	private Integer product_no;
	private Integer post_no;
	private Integer post_tag_no;
	private String post_tag_img;
	private String post_tag_name;
	private int post_tag_price;
	
	public Post_TagDto() {
		
	}

	public Post_TagDto(Integer product_no, Integer post_no, Integer post_tag_no, String post_tag_img,
			String post_tag_name, int post_tag_price) {
		super();
		this.product_no = product_no;
		this.post_no = post_no;
		this.post_tag_no = post_tag_no;
		this.post_tag_img = post_tag_img;
		this.post_tag_name = post_tag_name;
		this.post_tag_price = post_tag_price;
	}

}
