package kr.co.lookst.board.domain;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Objects;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;


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
	
	

	
	
	
	public BoardDto(String member_id,  String board_title,  String board_con,
			 String board_type, String board_kind) {
//		super();
		this.member_id = member_id;
		this.board_title = board_title;
		this.board_con = board_con;
		this.board_type = board_type;
		this.board_kind = board_kind;
	}



	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public Integer getBoard_no() {
		return board_no;
	}

	public void setBoard_no(Integer board_no) {
		this.board_no = board_no;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public Date getBoard_date() {
		return board_date;
	}

	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}

	public String getBoard_con() {
		return board_con;
	}

	public void setBoard_con(String board_con) {
		this.board_con = board_con;
	}

	public boolean isBoard_secret() {
		return board_secret;
	}

	public void setBoard_secret(boolean board_secret) {
		this.board_secret = board_secret;
	}

	public String getBoard_type() {
		return board_type;
	}

	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}

	public Integer getBoard_views() {
		return board_views;
	}

	public void setBoard_views(Integer board_views) {
		this.board_views = board_views;
	}

	public String getBoard_kind() {
		return board_kind;
	}

	public void setBoard_kind(String board_kind) {
		this.board_kind = board_kind;
	}

	@Override
	public int hashCode() {
		return Objects.hash(board_con, board_date, board_kind, board_no, board_secret, board_title, board_type,
				board_views, member_id);
	}

	
	public String reg_date() {
		DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
		String reg_date = sdFormat.format(board_date);
		
		return reg_date;
	}
	
	
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BoardDto other = (BoardDto) obj;
		return Objects.equals(board_con, other.board_con) && Objects.equals(board_date, other.board_date)
				&& Objects.equals(board_kind, other.board_kind) && Objects.equals(board_no, other.board_no)
				&& board_secret == other.board_secret && Objects.equals(board_title, other.board_title)
				&& Objects.equals(board_type, other.board_type) && Objects.equals(board_views, other.board_views)
				&& Objects.equals(member_id, other.member_id);
	}

	@Override
	public String toString() {
		return "BoardDto [member_id=" + member_id + ", board_no=" + board_no + ", board_title=" + board_title
				+ ", board_date=" + board_date + ", board_con=" + board_con + ", board_secret=" + board_secret
				+ ", board_type=" + board_type + ", board_views=" + board_views + ", board_kind=" + board_kind + "]";
	}
	
	
	
	
}
