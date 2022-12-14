package kr.co.lookst.post.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class ProductListTopDto {

	private String prdt_img_name;
	private String product_name;
	private Integer product_price;
	private String product_info;
}
