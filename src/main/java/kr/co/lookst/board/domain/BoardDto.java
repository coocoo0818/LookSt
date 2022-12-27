package kr.co.lookst.board.domain;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Objects;

import org.springframework.web.multipart.MultipartFile;

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

	public int getNext() {
		return next;
	}

	public void setNext(int next) {
		this.next = next;
	}

	public int getLast() {
		return last;
	}

	public void setLast(int last) {
		this.last = last;
	}

	public String getNextTitle() {
		return nextTitle;
	}

	public void setNextTitle(String nextTitle) {
		this.nextTitle = nextTitle;
	}

	public String getLastTitle() {
		return lastTitle;
	}

	public void setLastTitle(String lastTitle) {
		this.lastTitle = lastTitle;
	}

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

	@Override
	public String toString() {
		return "BoardDto{" +
			"member_id='" + member_id + '\'' +
			", board_no=" + board_no +
			", board_title='" + board_title + '\'' +
			", board_date=" + board_date +
			", board_con='" + board_con + '\'' +
			", board_secret=" + board_secret +
			", board_type='" + board_type + '\'' +
			", board_views=" + board_views +
			", board_kind='" + board_kind + '\'' +
			", next=" + next +
			", last=" + last +
			", nextTitle='" + nextTitle + '\'' +
			", lastTitle='" + lastTitle + '\'' +
			'}';
	}
}
