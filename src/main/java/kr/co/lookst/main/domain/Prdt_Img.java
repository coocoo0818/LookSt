package kr.co.lookst.main.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Prdt_Img {
   private int product_no;
   private int prdt_img_no;
   private int prdt_img_seq;
   private String prdt_img_name;
   private String prdt_img_uuid;

   
}