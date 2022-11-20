package kr.co.lookst.main.domain;

import java.util.Date;

import lombok.Data;

@Data
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

    public NBoardDto() {
	}
    
    public NBoardDto(String member_id, Integer board_no, String board_title, Date board_date, String board_con,
			boolean board_secret, String board_type, int board_views, String board_kind, int board_com_cnt) {
		super();
		this.member_id = member_id;
		this.board_no = board_no;
		this.board_title = board_title;
		this.board_date = board_date;
		this.board_con = board_con;
		this.board_secret = board_secret;
		this.board_type = board_type;
		this.board_views = board_views;
		this.board_kind = board_kind;
		this.board_com_cnt = board_com_cnt;
	}

    
}
