package kr.co.lookst.main.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Prdt_Option {
	private Integer product_no;
	private Integer prdt_option_no;
	private String prdt_option_size;
	private int prdt_option_stock;
	private String prdt_option_color;
	
	
	
}
