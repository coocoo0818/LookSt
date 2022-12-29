package kr.co.lookst.sns.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PostUpload {

	private String member_id;
	private Integer post_no;
	private String post_img_img;
	private Integer post_img_seq;
	private String post_content;
	
	
}
