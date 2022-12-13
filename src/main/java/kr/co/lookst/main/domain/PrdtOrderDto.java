package kr.co.lookst.main.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PrdtOrderDto {
	
	private Integer prdt_order_no;
	private Integer product_no;
	private String member_id;
	private int prdt_order_quan;
	private Date prdt_order_date;
	private String prdt_order_way;
	private String prdt_order_phone;
	private String prdt_order_addr;
	private String prdt_order_addr2;
	private String prdt_order_person;
	private String prdt_order_type;
	private String prdt_order_cancel;
	private String prdt_order_size;
	private String prdt_order_color;
	private int prdt_order_price;
	
}
