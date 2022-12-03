package kr.co.lookst.main.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class NPostDto {

	private String member_id;
	private Integer post_no;
	private String post_content;
	private Date post_date;
	private String post_type;
	
	
	
}
