package kr.co.lookst.post.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class OrderPagePrdtDto {

	private String post_tag_img;
	private String post_tag_name;
	private int post_tag_price;
	private String product_info;
	


}
