package kr.co.lookst.post.domain;

import java.sql.Timestamp;

public class OrderFormPageDto {

	private int prdt_order_no;
	private int product_no;
	private String member_id;
	private int prdt_order_quan;
	private Timestamp prdt_order_date;
	private String prdt_order_way;
	private int prdt_order_phone;
	private String prdt_order_addr;
	private String prdt_order_addr2;
	private String prdt_order_person;
	private String prdt_order_type;
	private String prdt_order_cancel;
	
	public OrderFormPageDto() {
		 
	}

	public int getPrdt_order_no() {
		return prdt_order_no;
	}

	public void setPrdt_order_no(int prdt_order_no) {
		this.prdt_order_no = prdt_order_no;
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getPrdt_order_quan() {
		return prdt_order_quan;
	}

	public void setPrdt_order_quan(int prdt_order_quan) {
		this.prdt_order_quan = prdt_order_quan;
	}

	public Timestamp getPrdt_order_date() {
		return prdt_order_date;
	}

	public void setPrdt_order_date(Timestamp prdt_order_date) {
		this.prdt_order_date = prdt_order_date;
	}

	public String getPrdt_order_way() {
		return prdt_order_way;
	}

	public void setPrdt_order_way(String prdt_order_way) {
		this.prdt_order_way = prdt_order_way;
	}

	public int getPrdt_order_phone() {
		return prdt_order_phone;
	}

	public void setPrdt_order_phone(int prdt_order_phone) {
		this.prdt_order_phone = prdt_order_phone;
	}

	public String getPrdt_order_addr() {
		return prdt_order_addr;
	}

	public void setPrdt_order_addr(String prdt_order_addr) {
		this.prdt_order_addr = prdt_order_addr;
	}

	public String getPrdt_order_addr2() {
		return prdt_order_addr2;
	}

	public void setPrdt_order_addr2(String prdt_order_addr2) {
		this.prdt_order_addr2 = prdt_order_addr2;
	}

	public String getPrdt_order_person() {
		return prdt_order_person;
	}

	public void setPrdt_order_person(String prdt_order_person) {
		this.prdt_order_person = prdt_order_person;
	}

	public String getPrdt_order_type() {
		return prdt_order_type;
	}

	public void setPrdt_order_type(String prdt_order_type) {
		this.prdt_order_type = prdt_order_type;
	}

	public String getPrdt_order_cancel() {
		return prdt_order_cancel;
	}

	public void setPrdt_order_cancel(String prdt_order_cancel) {
		this.prdt_order_cancel = prdt_order_cancel;
	}

	@Override
	public String toString() {
		return "OrderFormPageDto [prdt_order_no=" + prdt_order_no + ", product_no=" + product_no + ", member_id="
				+ member_id + ", prdt_order_quan=" + prdt_order_quan + ", prdt_order_date=" + prdt_order_date
				+ ", prdt_order_way=" + prdt_order_way + ", prdt_order_phone=" + prdt_order_phone + ", prdt_order_addr="
				+ prdt_order_addr + ", prdt_order_addr2=" + prdt_order_addr2 + ", prdt_order_person="
				+ prdt_order_person + ", prdt_order_type=" + prdt_order_type + ", prdt_order_cancel="
				+ prdt_order_cancel + "]";
	}


	
	
	
	
	
}
