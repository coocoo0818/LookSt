package kr.co.lookst.main.domain;

import java.util.Date;

public class Product {
	private int seller_no;
	private int product_no;
	private char product_kind;
	private int product_price;
	private Date product_date;
	private String product_name;
	private char product_type;
	private String product_info;

	public Product() {

	}

	public Product(int seller_no, int product_no, char product_kind, int product_price, Date product_date,
			String product_name, char product_type, String product_info) {
		// super();
		this.seller_no = seller_no;
		this.product_no = product_no;
		this.product_kind = product_kind;
		this.product_price = product_price;
		this.product_date = product_date;
		this.product_name = product_name;
		this.product_type = product_type;
		this.product_info = product_info;
	}

	public int getSeller_no() {
		return seller_no;
	}

	public void setSeller_no(int seller_no) {
		this.seller_no = seller_no;
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}

	public char getProduct_kind() {
		return product_kind;
	}

	public void setProduct_kind(char product_kind) {
		this.product_kind = product_kind;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public Date getProduct_date() {
		return product_date;
	}

	public void setProduct_date(Date product_date) {
		this.product_date = product_date;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public char getProduct_type() {
		return product_type;
	}

	public void setProduct_type(char product_type) {
		this.product_type = product_type;
	}

	public String getProduct_info() {
		return product_info;
	}

	public void setProduct_info(String product_info) {
		this.product_info = product_info;
	}

	@Override
	public String toString() {
		return "Product [seller_no=" + seller_no + ", product_no=" + product_no + ", product_kind=" + product_kind
				+ ", product_price=" + product_price + ", product_date=" + product_date + ", product_name="
				+ product_name + ", product_type=" + product_type + ", product_info=" + product_info + "]";
	}

}