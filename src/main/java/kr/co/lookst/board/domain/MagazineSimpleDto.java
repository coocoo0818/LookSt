package kr.co.lookst.board.domain;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class MagazineSimpleDto {

	private int board_no;
	private String member_id;
	private Date board_date;
	private String board_title;
	private String board_img_img;
	
	
}
