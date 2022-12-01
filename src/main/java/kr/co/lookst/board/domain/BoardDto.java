package kr.co.lookst.board.domain;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Objects;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class BoardDto {
	
	private String member_id;
	private Integer board_no;
	private String board_title;
	private Date board_date;
	private String board_con;
	private boolean board_secret;
	private String board_type;
	private Integer board_views;
	private String board_kind;
    private int next;
    private int last;
    private String nextTitle;
    private String lastTitle;

	

	
	
	
	public BoardDto(String member_id,  String board_title,  String board_con,
			 String board_type, String board_kind) {
//		super();
		this.member_id = member_id;
		this.board_title = board_title;
		this.board_con = board_con;
		this.board_type = board_type;
		this.board_kind = board_kind;
	}

	public String reg_date() {
		DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
		String reg_date = sdFormat.format(board_date);
		
		return reg_date;
	}

	
	
}
