package kr.co.lookst.shop.domain;

import java.util.Date;
import java.util.Objects;

public class PrdtOrderDto {

	private Integer order_no;
	private Integer product_no;
	private Character member_id;
	private Integer order_quan;
	private Date order_date;
	private String order_way;
	private String order_phone;
	private String order_addr;
	private String order_addr2;
	private String order_person;
	private String order_type;
	private String order_cancel;

	
	public PrdtOrderDto() {
		// TODO Auto-generated constructor stub
	}
	
	
	 

	public PrdtOrderDto(Integer order_no, Integer product_no, Character member_id, Integer order_quan, Date order_date,
			String order_way, String order_phone, String order_addr, String order_addr2, String order_person,
			String order_type, String order_cancel) {
//		super();
		this.order_no = order_no;
		this.product_no = product_no;
		this.member_id = member_id;
		this.order_quan = order_quan;
		this.order_date = order_date;
		this.order_way = order_way;
		this.order_phone = order_phone;
		this.order_addr = order_addr;
		this.order_addr2 = order_addr2;
		this.order_person = order_person;
		this.order_type = order_type;
		this.order_cancel = order_cancel;
	}




	public Integer getOrder_no() {
		return order_no;
	}

	public void setOrder_no(Integer order_no) {
		this.order_no = order_no;
	}

	public Integer getProduct_no() {
		return product_no;
	}

	public void setProduct_no(Integer product_no) {
		this.product_no = product_no;
	}

	public Character getMember_id() {
		return member_id;
	}

	public void setMember_id(Character member_id) {
		this.member_id = member_id;
	}

	public Integer getOrder_quan() {
		return order_quan;
	}

	public void setOrder_quan(Integer order_quan) {
		this.order_quan = order_quan;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public String getOrder_way() {
		return order_way;
	}

	public void setOrder_way(String order_way) {
		this.order_way = order_way;
	}

	public String getOrder_phone() {
		return order_phone;
	}

	public void setOrder_phone(String order_phone) {
		this.order_phone = order_phone;
	}

	public String getOrder_addr() {
		return order_addr;
	}

	public void setOrder_addr(String order_addr) {
		this.order_addr = order_addr;
	}

	public String getOrder_addr2() {
		return order_addr2;
	}

	public void setOrder_addr2(String order_addr2) {
		this.order_addr2 = order_addr2;
	}

	public String getOrder_person() {
		return order_person;
	}

	public void setOrder_person(String order_person) {
		this.order_person = order_person;
	}

	public String getOrder_type() {
		return order_type;
	}

	public void setOrder_type(String order_type) {
		this.order_type = order_type;
	}

	public String getOrder_cancel() {
		return order_cancel;
	}

	public void setOrder_cancel(String order_cancel) {
		this.order_cancel = order_cancel;
	}

	@Override
	public int hashCode() {
		return Objects.hash(member_id, order_addr, order_addr2, order_cancel, order_date, order_no, order_person,
				order_phone, order_quan, order_type, order_way, product_no);
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PrdtOrderDto other = (PrdtOrderDto) obj;
		return Objects.equals(member_id, other.member_id) && Objects.equals(order_addr, other.order_addr)
				&& Objects.equals(order_addr2, other.order_addr2) && Objects.equals(order_cancel, other.order_cancel)
				&& Objects.equals(order_date, other.order_date) && Objects.equals(order_no, other.order_no)
				&& Objects.equals(order_person, other.order_person) && Objects.equals(order_phone, other.order_phone)
				&& Objects.equals(order_quan, other.order_quan) && Objects.equals(order_type, other.order_type)
				&& Objects.equals(order_way, other.order_way) && Objects.equals(product_no, other.product_no);
	}


	@Override
	public String toString() {
		return "PrdtOrderDto [order_no=" + order_no + ", product_no=" + product_no + ", member_id=" + member_id
				+ ", order_quan=" + order_quan + ", order_date=" + order_date + ", order_way=" + order_way
				+ ", order_phone=" + order_phone + ", order_addr=" + order_addr + ", order_addr2=" + order_addr2
				+ ", order_person=" + order_person + ", order_type=" + order_type + ", order_cancel=" + order_cancel
				+ "]";
	}
	
	
}
