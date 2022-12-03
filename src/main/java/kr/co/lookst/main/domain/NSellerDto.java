package kr.co.lookst.main.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class NSellerDto {

    private String seller_no;
    private String seller_name;
    private String seller_type;
    private String seller_addr;
    private String seller_addr2;
    private String seller_zip;
    private String seller_number;
    private String member_id;

    
}
