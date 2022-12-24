package kr.co.lookst.main.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SnsCommentDto {
	
	private Integer post_no;
	private String member_id;
	private Integer sns_comment_no;
	private String sns_comment_con;
	private Date sns_comment_date;
	private int sns_comment_seq;
	private int sns_comment_class;
	private int sns_comment_group;
	private String sns_comment_nick;
	private String sns_comment_profile;
	
}
