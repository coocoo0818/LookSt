package kr.co.lookst.seller.domain;

import java.util.Objects;

public class PrdtListDto {

	private int product_no;
	private String prdt_img_name;
	private String product_kind;
	private String product_name;
	private String prdt_option_size;
	private String prdt_option_color;
	private int product_price;
	private String prdt_option_stock;
	
	public PrdtListDto() {
		// TODO Auto-generated constructor stub
	}

	public PrdtListDto(int product_no, String prdt_img_name, String product_kind, String product_name,
			String prdt_option_size, String prdt_option_color, int product_price, String prdt_option_stock) {
		super();
		this.product_no = product_no;
		this.prdt_img_name = prdt_img_name;
		this.product_kind = product_kind;
		this.product_name = product_name;
		this.prdt_option_size = prdt_option_size;
		this.prdt_option_color = prdt_option_color;
		this.product_price = product_price;
		this.prdt_option_stock = prdt_option_stock;
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}

	public String getPrdt_img_name() {
		return prdt_img_name;
	}

	public void setPrdt_img_name(String prdt_img_name) {
		this.prdt_img_name = prdt_img_name;
	}

	public String getProduct_kind() {
		return product_kind;
	}

	public void setProduct_kind(String product_kind) {
		this.product_kind = product_kind;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getPrdt_option_size() {
		return prdt_option_size;
	}

	public void setPrdt_option_size(String prdt_option_size) {
		this.prdt_option_size = prdt_option_size;
	}

	public String getPrdt_option_color() {
		return prdt_option_color;
	}

	public void setPrdt_option_color(String prdt_option_color) {
		this.prdt_option_color = prdt_option_color;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public String getPrdt_option_stock() {
		return prdt_option_stock;
	}

	public void setPrdt_option_stock(String prdt_option_stock) {
		this.prdt_option_stock = prdt_option_stock;
	}

	
	
	
	@Override
	public String toString() {
		return "PrdtListDto [product_no=" + product_no + ", prdt_img_name=" + prdt_img_name + ", product_kind="
				+ product_kind + ", product_name=" + product_name + ", prdt_option_size=" + prdt_option_size
				+ ", prdt_option_color=" + prdt_option_color + ", product_price=" + product_price
				+ ", prdt_option_stock=" + prdt_option_stock + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(prdt_img_name, prdt_option_color, prdt_option_size, prdt_option_stock, product_kind,
				product_name, product_no, product_price);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PrdtListDto other = (PrdtListDto) obj;
		return Objects.equals(prdt_img_name, other.prdt_img_name)
				&& Objects.equals(prdt_option_color, other.prdt_option_color)
				&& Objects.equals(prdt_option_size, other.prdt_option_size)
				&& Objects.equals(prdt_option_stock, other.prdt_option_stock)
				&& Objects.equals(product_kind, other.product_kind) && Objects.equals(product_name, other.product_name)
				&& product_no == other.product_no && product_price == other.product_price;
	}
	
	
	
}
