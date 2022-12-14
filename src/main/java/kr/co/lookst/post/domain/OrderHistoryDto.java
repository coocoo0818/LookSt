package kr.co.lookst.post.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class OrderHistoryDto {

	private Integer prdt_order_no;
	private String prdt_img_name;
	private String product_name;
	private String prdt_order_size;
	private String prdt_order_color;
	private Integer prdt_order_price;
	private Integer prdt_order_quan;
	private Date prdt_order_date;
	private String prdt_order_type;
	private String prdt_order_cancel;
	
}
