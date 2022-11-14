package kr.co.lookst.main.domain;

public class IndexDto {

	private String product_name;
	private char product_kind;
	private int product_price;
	private String product_info;
	private String prdt_img_name;
	
	public IndexDto() {
		// TODO Auto-generated constructor stub
	}

	public IndexDto(String product_name, char product_kind, int product_price, String product_info,
			String prdt_img_name) {
		//super();
		this.product_name = product_name;
		this.product_kind = product_kind;
		this.product_price = product_price;
		this.product_info = product_info;
		this.prdt_img_name = prdt_img_name;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
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

	public String getProduct_info() {
		return product_info;
	}

	public void setProduct_info(String product_info) {
		this.product_info = product_info;
	}

	public String getPrdt_img_name() {
		return prdt_img_name;
	}

	public void setPrdt_img_name(String prdt_img_name) {
		this.prdt_img_name = prdt_img_name;
	}

	@Override
	public String toString() {
		return "IndexDto [product_name=" + product_name + ", product_kind=" + product_kind + ", product_price="
				+ product_price + ", product_info=" + product_info + ", prdt_img_name=" + prdt_img_name + "]";
	}	
	
}
