package kr.co.lookst.sns.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PostDto {

	private String member_id;
	private Integer post_no;
	private String post_content;
	private Date post_date;
	private String post_type;
	
}
