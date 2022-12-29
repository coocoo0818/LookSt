package kr.co.lookst.member.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class MemInfoDto {

	private String member_id;
	private String mem_info_gender;
	private Date mem_info_birth;
	private String mem_info_bank;
	private String mem_info_account;
	private String mem_info_reci;
		
}
