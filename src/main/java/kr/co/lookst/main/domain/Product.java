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
public class Product {
	private String seller_no;
	private Integer product_no;
	private String product_kind;
	private String product_price;
	private Date product_date;
	private String product_name;
	private String product_type;
	private String product_info;
	private String product_detail;
	private String prdt_option_size;
	private int prdt_option_stock;
	private String prdt_option_color;
	
}