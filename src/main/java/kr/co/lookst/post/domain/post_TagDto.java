package kr.co.lookst.post.domain;

import lombok.Data;

@Data
public class post_TagDto {

	private String tag_content;
	private int post_no;
	private int tag_no;
	
	public post_TagDto() {
		
	}

	public post_TagDto(String tag_content, int post_no, int tag_no) {
		super();
		this.tag_content = tag_content;
		this.post_no = post_no;
		this.tag_no = tag_no;
	}

	
	
	
}
