package kr.co.lookst.main.domain;

import lombok.Data;

@Data
public class IndexDto {

	private Integer product_no;
	private String product_name;
	private char product_kind;
	private int product_price;
	private String product_info;
	private String prdt_img_name;
	
	public IndexDto() {
		// TODO Auto-generated constructor stub
	}

	public IndexDto(Integer product_no, String product_name, char product_kind, int product_price, String product_info,
			String prdt_img_name) {
		super();
		this.product_no = product_no;
		this.product_name = product_name;
		this.product_kind = product_kind;
		this.product_price = product_price;
		this.product_info = product_info;
		this.prdt_img_name = prdt_img_name;
	}


	
}
