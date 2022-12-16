package kr.co.lookst.main.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SnsHeartDto {

	private String member_id;
	private Integer post_no;
	private boolean sns_heart_bool;
	private Integer sns_heart_no;
}
