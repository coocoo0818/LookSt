package kr.co.lookst.board.domain;

import java.util.Date;
import java.util.Objects;

public class ReviewDto {
	
	private String member_id;	
	private int review_no;
	private String review_title;
	private Date review_date;
	private String review_con;
	private boolean review_secret;
	private String review_type;
	private int product_no;
	private int review_views;
	
	
	public ReviewDto(String member_id, int review_no, String review_title, Date review_date, String review_con,
			boolean review_secret, String review_type, int product_no, int review_views) {
//		super();
		this.member_id = member_id;
		this.review_no = review_no;
		this.review_title = review_title;
		this.review_date = review_date;
		this.review_con = review_con;
		this.review_secret = review_secret;
		this.review_type = review_type;
		this.product_no = product_no;
		this.review_views = review_views;
	}


	@Override
	public int hashCode() {
		return Objects.hash(member_id, product_no, review_con, review_date, review_no, review_secret, review_title,
				review_type, review_views);
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ReviewDto other = (ReviewDto) obj;
		return Objects.equals(member_id, other.member_id) && product_no == other.product_no
				&& Objects.equals(review_con, other.review_con) && Objects.equals(review_date, other.review_date)
				&& review_no == other.review_no && review_secret == other.review_secret
				&& Objects.equals(review_title, other.review_title) && Objects.equals(review_type, other.review_type)
				&& review_views == other.review_views;
	}


	public String getMember_id() {
		return member_id;
	}


	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}


	public int getReview_no() {
		return review_no;
	}


	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}


	public String getReview_title() {
		return review_title;
	}


	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}


	public Date getReview_date() {
		return review_date;
	}


	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}


	public String getReview_con() {
		return review_con;
	}


	public void setReview_con(String review_con) {
		this.review_con = review_con;
	}


	public boolean isReview_secret() {
		return review_secret;
	}


	public void setReview_secret(boolean review_secret) {
		this.review_secret = review_secret;
	}


	public String getReview_type() {
		return review_type;
	}


	public void setReview_type(String review_type) {
		this.review_type = review_type;
	}


	public int getProduct_no() {
		return product_no;
	}


	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}


	public int getReview_views() {
		return review_views;
	}


	public void setReview_views(int review_views) {
		this.review_views = review_views;
	}


	@Override
	public String toString() {
		return "ReviewDto [member_id=" + member_id + ", review_no=" + review_no + ", review_title=" + review_title
				+ ", review_date=" + review_date + ", review_con=" + review_con + ", review_secret=" + review_secret
				+ ", review_type=" + review_type + ", product_no=" + product_no + ", review_views=" + review_views
				+ "]";
	}

	
	
	
}
