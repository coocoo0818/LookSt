package kr.co.lookst.seller.domain;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class PrdtListDto {

	private int product_no;
	private String prdt_img_name;
	private String product_kind;
	private String product_name;
	private String prdt_option_size;
	private String prdt_option_color;
	private int product_price;
	private String prdt_option_stock;
	private String product_type;
	private String seller_no;
	private String member_id;
	
}