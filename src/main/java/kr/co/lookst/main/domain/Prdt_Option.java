package kr.co.lookst.main.domain;

import java.util.Objects;

public class Prdt_Option {
	private Integer product_no;
	private Integer prdt_option_no;
	private String prdt_option_size;
	private int prdt_option_stock;
	private String prdt_option_color;
	
	
	public Prdt_Option() {
		
	}


	public Prdt_Option(Integer product_no, Integer prdt_option_no, String prdt_option_size, int prdt_option_stock,
			String prdt_option_color) {
		super();
		this.product_no = product_no;
		this.prdt_option_no = prdt_option_no;
		this.prdt_option_size = prdt_option_size;
		this.prdt_option_stock = prdt_option_stock;
		this.prdt_option_color = prdt_option_color;
	}


	public Integer getProduct_no() {
		return product_no;
	}


	public void setProduct_no(Integer product_no) {
		this.product_no = product_no;
	}


	public Integer getPrdt_option_no() {
		return prdt_option_no;
	}


	public void setPrdt_option_no(Integer prdt_option_no) {
		this.prdt_option_no = prdt_option_no;
	}


	public String getPrdt_option_size() {
		return prdt_option_size;
	}


	public void setPrdt_option_size(String prdt_option_size) {
		this.prdt_option_size = prdt_option_size;
	}


	public int getPrdt_option_stock() {
		return prdt_option_stock;
	}


	public void setPrdt_option_stock(int prdt_option_stock) {
		this.prdt_option_stock = prdt_option_stock;
	}


	public String getPrdt_option_color() {
		return prdt_option_color;
	}


	public void setPrdt_option_color(String prdt_option_color) {
		this.prdt_option_color = prdt_option_color;
	}


	@Override
	public String toString() {
		return "Prdt_Option [product_no=" + product_no + ", prdt_option_no=" + prdt_option_no + ", prdt_option_size="
				+ prdt_option_size + ", prdt_option_stock=" + prdt_option_stock + ", prdt_option_color="
				+ prdt_option_color + "]";
	}


	@Override
	public int hashCode() {
		return Objects.hash(prdt_option_color, prdt_option_no, prdt_option_size, prdt_option_stock, product_no);
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Prdt_Option other = (Prdt_Option) obj;
		return Objects.equals(prdt_option_color, other.prdt_option_color) && prdt_option_no == other.prdt_option_no
				&& Objects.equals(prdt_option_size, other.prdt_option_size)
				&& prdt_option_stock == other.prdt_option_stock && product_no == other.product_no;
	}
	
	
	
	
	
}
