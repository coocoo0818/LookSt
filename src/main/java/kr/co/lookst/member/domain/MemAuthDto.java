package kr.co.lookst.member.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class MemAuthDto {

	private String member_id;
	private String mem_auth_auth;
	private String mem_auth_key;
	
	
}
