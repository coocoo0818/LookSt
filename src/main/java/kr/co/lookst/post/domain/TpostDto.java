package kr.co.lookst.post.domain;

import java.util.Date;

import lombok.Data;

@Data
public class TpostDto {
	
	private String member_id;
	private Integer	post_no;
	private String post_content;
	private Date post_date;
	private String post_type;
	private String product_no;
	
	public TpostDto() {
		
	}

	public TpostDto(String member_id, Integer post_no, String post_content, Date post_date, String post_type,
			String product_no) {
		//super();
		this.member_id = member_id;
		this.post_no = post_no;
		this.post_content = post_content;
		this.post_date = post_date;
		this.post_type = post_type;
		this.product_no = product_no;
	}

	
}
