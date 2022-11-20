package kr.co.lookst.main.domain;

import lombok.Data;

@Data
public class NSellerDto {

    private String seller_no;
    private String seller_name;
    private String seller_type;
    private String seller_addr;
    private String seller_addr2;
    private String seller_zip;
    private String seller_number;
    private String member_id;
    
    public NSellerDto() {
	}

	public NSellerDto(String seller_no, String seller_name, String seller_type, String seller_addr, String seller_addr2,
			String seller_zip, String seller_number, String member_id) {
		super();
		this.seller_no = seller_no;
		this.seller_name = seller_name;
		this.seller_type = seller_type;
		this.seller_addr = seller_addr;
		this.seller_addr2 = seller_addr2;
		this.seller_zip = seller_zip;
		this.seller_number = seller_number;
		this.member_id = member_id;
	}
    
    
}
