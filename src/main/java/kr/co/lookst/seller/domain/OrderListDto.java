package kr.co.lookst.seller.domain;

import java.util.Date;
import java.util.Objects;

public class OrderListDto {
	
	private Integer prdt_order_no;
	private String member_name;
	private String product_name;
	private Integer product_no;
	private Integer payment;
	private Date prdt_order_date;
	private String prdt_order_type;
	private String prdt_order_person;
	private String prdt_order_addr;
	private String prdt_order_addr2;
	private Integer prdt_order_phone;
	private Integer prdt_order_quan;
	private Integer product_price;
	private String prdt_order_way;
	
	
	public OrderListDto() {
		// TODO Auto-generated constructor stub
	}


	public OrderListDto(Integer prdt_order_no, String member_name, String product_name, Integer product_no,
			Integer payment, Date prdt_order_date, String prdt_order_type, String prdt_order_person,
			String prdt_order_addr, String prdt_order_addr2, Integer prdt_order_phone, Integer prdt_order_quan,
			Integer product_price, String prdt_order_way) {
		super();
		this.prdt_order_no = prdt_order_no;
		this.member_name = member_name;
		this.product_name = product_name;
		this.product_no = product_no;
		this.payment = payment;
		this.prdt_order_date = prdt_order_date;
		this.prdt_order_type = prdt_order_type;
		this.prdt_order_person = prdt_order_person;
		this.prdt_order_addr = prdt_order_addr;
		this.prdt_order_addr2 = prdt_order_addr2;
		this.prdt_order_phone = prdt_order_phone;
		this.prdt_order_quan = prdt_order_quan;
		this.product_price = product_price;
		this.prdt_order_way = prdt_order_way;
	}


	public Integer getPrdt_order_no() {
		return prdt_order_no;
	}


	public void setPrdt_order_no(Integer prdt_order_no) {
		this.prdt_order_no = prdt_order_no;
	}


	public String getMember_name() {
		return member_name;
	}


	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}


	public String getProduct_name() {
		return product_name;
	}


	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}


	public Integer getProduct_no() {
		return product_no;
	}


	public void setProduct_no(Integer product_no) {
		this.product_no = product_no;
	}


	public Integer getPayment() {
		return payment;
	}


	public void setPayment(Integer payment) {
		this.payment = payment;
	}


	public Date getPrdt_order_date() {
		return prdt_order_date;
	}


	public void setPrdt_order_date(Date prdt_order_date) {
		this.prdt_order_date = prdt_order_date;
	}


	public String getPrdt_order_type() {
		return prdt_order_type;
	}


	public void setPrdt_order_type(String prdt_order_type) {
		this.prdt_order_type = prdt_order_type;
	}


	public String getPrdt_order_person() {
		return prdt_order_person;
	}


	public void setPrdt_order_person(String prdt_order_person) {
		this.prdt_order_person = prdt_order_person;
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


	public Integer getPrdt_order_phone() {
		return prdt_order_phone;
	}


	public void setPrdt_order_phone(Integer prdt_order_phone) {
		this.prdt_order_phone = prdt_order_phone;
	}


	public Integer getPrdt_order_quan() {
		return prdt_order_quan;
	}


	public void setPrdt_order_quan(Integer prdt_order_quan) {
		this.prdt_order_quan = prdt_order_quan;
	}


	public Integer getProduct_price() {
		return product_price;
	}


	public void setProduct_price(Integer product_price) {
		this.product_price = product_price;
	}


	public String getPrdt_order_way() {
		return prdt_order_way;
	}


	public void setPrdt_order_way(String prdt_order_way) {
		this.prdt_order_way = prdt_order_way;
	}


	@Override
	public int hashCode() {
		return Objects.hash(member_name, payment, prdt_order_addr, prdt_order_addr2, prdt_order_date, prdt_order_no,
				prdt_order_person, prdt_order_phone, prdt_order_quan, prdt_order_type, prdt_order_way, product_name,
				product_no, product_price);
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		OrderListDto other = (OrderListDto) obj;
		return Objects.equals(member_name, other.member_name) && Objects.equals(payment, other.payment)
				&& Objects.equals(prdt_order_addr, other.prdt_order_addr)
				&& Objects.equals(prdt_order_addr2, other.prdt_order_addr2)
				&& Objects.equals(prdt_order_date, other.prdt_order_date)
				&& Objects.equals(prdt_order_no, other.prdt_order_no)
				&& Objects.equals(prdt_order_person, other.prdt_order_person)
				&& Objects.equals(prdt_order_phone, other.prdt_order_phone)
				&& Objects.equals(prdt_order_quan, other.prdt_order_quan)
				&& Objects.equals(prdt_order_type, other.prdt_order_type)
				&& Objects.equals(prdt_order_way, other.prdt_order_way)
				&& Objects.equals(product_name, other.product_name) && Objects.equals(product_no, other.product_no)
				&& Objects.equals(product_price, other.product_price);
	}
	
	
	
	
}
