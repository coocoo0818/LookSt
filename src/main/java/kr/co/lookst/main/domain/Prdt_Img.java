package kr.co.lookst.main.domain;

public class Prdt_Img {
	private int product_no;
	private int prdt_img_no;
	private String prdt_img_name;
	private int prdt_img_seq;
	
	

	public Prdt_Img() {
		// TODO Auto-generated constructor stub
	}

	
	
	public Prdt_Img(int product_no, int prdt_img_no, String prdt_img_name, int prdt_img_seq) {
		
		this.product_no = product_no;
		this.prdt_img_no = prdt_img_no;
		this.prdt_img_name = prdt_img_name;
		this.prdt_img_seq = prdt_img_seq;
	}



	public Prdt_Img(int product_no, String prdt_img_name, int prdt_img_seq) {
		//super();
		this.product_no = product_no;
		this.prdt_img_name = prdt_img_name;
		this.prdt_img_seq = prdt_img_seq;
		
	}
	
	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}

	public int getPrdt_img_no() {
		return prdt_img_no;
	}

	public void setPrdt_img_no(int prdt_img_no) {
		this.prdt_img_no = prdt_img_no;
	}

	public int getPrdt_img_seq() {
		return prdt_img_seq;
	}

	public void setPrdt_img_seq(int prdt_img_seq) {
		this.prdt_img_seq = prdt_img_seq;
	}

	public String getPrdt_img_name() {
		return prdt_img_name;
	}

	public void setPrdt_img_name(String prdt_img_name) {
		this.prdt_img_name = prdt_img_name;
	}


	@Override
	public String toString() {
		return "Prdt_Img [product_no=" + product_no + ", prdt_img_no=" + prdt_img_no + ", prdt_img_name="
				+ prdt_img_name + ", prdt_img_seq=" + prdt_img_seq + "]";
	}

	

	
}