package kr.co.lookst.main.domain;

import java.util.Date;

import lombok.Data;

@Data
public class NPostDto {

	private String member_id;
	private Integer post_no;
	private String post_content;
	private Date post_date;
	private String post_type;
	
	public NPostDto() {
		// TODO Auto-generated constructor stub
	}

	public NPostDto(String member_id, Integer post_no, String post_content, Date post_date, String post_type) {
		super();
		this.member_id = member_id;
		this.post_no = post_no;
		this.post_content = post_content;
		this.post_date = post_date;
		this.post_type = post_type;
	}
	
	
}
