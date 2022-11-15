package kr.co.lookst.post.domain;

public class ProdInfoDto {

	private String prdt_img_name;
	private String product_name;
	private int product_price;
	
	public ProdInfoDto() {
		
	}

	public ProdInfoDto(String prdt_img_name, String product_name, int product_price) {
		//super();
		this.prdt_img_name = prdt_img_name;
		this.product_name = product_name;
		this.product_price = product_price;
	}

	public String getPrdt_img_name() {
		return prdt_img_name;
	}

	public void setPrdt_img_name(String prdt_img_name) {
		this.prdt_img_name = prdt_img_name;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	@Override
	public String toString() {
		return "prodInfoDto [prdt_img_name=" + prdt_img_name + ", product_name=" + product_name + ", product_price="
				+ product_price + "]";
	}
	
	

}