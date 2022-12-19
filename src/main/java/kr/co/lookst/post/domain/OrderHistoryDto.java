package kr.co.lookst.post.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class OrderHistoryDto {

	private String prdt_img_name;
	private Integer product_no;
	private String product_name;
	private int product_price;
	private String product_kind;
	private String product_info;
	
	
}
