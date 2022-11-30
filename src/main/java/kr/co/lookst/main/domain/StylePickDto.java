package kr.co.lookst.main.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class StylePickDto {

	private String member_id;
	private Integer product_no;
	private String profile_img;
	private String member_nick;
	private String post_img_img;
	
}
