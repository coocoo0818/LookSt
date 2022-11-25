package kr.co.lookst.board.domain;

import java.util.Objects;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//
//MEMBER_ID    character varying(30) NOT null,
//BOARD_NO    integer NOT NULL,
//COMMENT_NO    SERIAL not NULL,
//COMMENT_CON    character varying(500) NOT NULL,
//COMMENT_SEQ    integer NOT NULL,
//COMMENT_CLASS    integer NOT NULL,
//COMMENT_GROUP    integer NOT NULL,
//COMMENT_DATE    timestamp without time zone NOT NULL




@ToString
public class CommentDto {
	
	private String member_id;
	private Integer board_no;
	private Integer comment_no;
	private String comment_con;
	private String comment_seq;
	private String comment_class;
	private String comment_group;
	private String comment_date;
	
	
	
	
	@Override
	public int hashCode() {
		return Objects.hash(board_no, comment_class, comment_con, comment_date, comment_group, comment_no, comment_seq,
				member_id);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CommentDto other = (CommentDto) obj;
		return Objects.equals(board_no, other.board_no) && Objects.equals(comment_class, other.comment_class)
				&& Objects.equals(comment_con, other.comment_con) && Objects.equals(comment_date, other.comment_date)
				&& Objects.equals(comment_group, other.comment_group) && Objects.equals(comment_no, other.comment_no)
				&& Objects.equals(comment_seq, other.comment_seq) && Objects.equals(member_id, other.member_id);
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
	public Integer getComment_no() {
		return comment_no;
	}
	public void setComment_no(Integer comment_no) {
		this.comment_no = comment_no;
	}
	public String getComment_con() {
		return comment_con;
	}
	public void setComment_con(String comment_con) {
		this.comment_con = comment_con;
	}
	public String getComment_seq() {
		return comment_seq;
	}
	public void setComment_seq(String comment_seq) {
		this.comment_seq = comment_seq;
	}
	public String getComment_class() {
		return comment_class;
	}
	public void setComment_class(String comment_class) {
		this.comment_class = comment_class;
	}
	public String getComment_group() {
		return comment_group;
	}
	public void setComment_group(String comment_group) {
		this.comment_group = comment_group;
	}
	public String getComment_date() {
		return comment_date;
	}
	public void setComment_date(String comment_date) {
		this.comment_date = comment_date;
	}
	
	
	
	
	
	
	
}
