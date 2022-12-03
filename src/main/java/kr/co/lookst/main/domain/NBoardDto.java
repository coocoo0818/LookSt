package kr.co.lookst.main.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class NBoardDto {
	private String member_id;
	private Integer board_no;
	private String board_title;
	private Date board_date;
	private String board_con;
	private boolean board_secret;
	private String board_type;
    private int board_views;
    private String board_kind;
    private int board_com_cnt;

    
}
