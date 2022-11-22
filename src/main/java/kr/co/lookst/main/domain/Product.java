package kr.co.lookst.main.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Product {
	private String seller_no;
	private Integer product_no;
	private String product_kind;
	private int product_price;
	private Date product_date;
	private String product_name;
	private String product_type;
	private String product_info;

	public Product() {

	}

	public Product(String seller_no, Integer product_no, String product_kind, int product_price, Date product_date,
			String product_name, String product_type, String product_info) {
		super();
		this.seller_no = seller_no;
		this.product_no = product_no;
		this.product_kind = product_kind;
		this.product_price = product_price;
		this.product_date = product_date;
		this.product_name = product_name;
		this.product_type = product_type;
		this.product_info = product_info;
	}


}