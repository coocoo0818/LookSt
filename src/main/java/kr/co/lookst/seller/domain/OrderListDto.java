package kr.co.lookst.seller.domain;

import java.util.Date;
import java.util.Objects;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderListDto {
	
	private int prdt_order_no;
	private String member_name;
	private String product_name;
	private int product_no;
	private int prdt_order_price;
	private Date prdt_order_date;
	private String prdt_order_type;
	private String prdt_order_person;
	private String prdt_order_addr;
	private String prdt_order_addr2;
	private String prdt_order_phone;
	private int prdt_order_quan;
	private int product_price;
	private String prdt_order_way;
	private String prdt_order_cancel;
	private String seller_no;
	private String prdt_order_size;
	private String prdt_order_color;

	
	
}
