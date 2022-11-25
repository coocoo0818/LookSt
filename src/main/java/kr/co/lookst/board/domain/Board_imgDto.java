package kr.co.lookst.board.domain;

public class Board_imgDto {

	private int board_no;
	private int board_img_no;
	private String board_img_img;
	private int board_img_seq;
	
	public Board_imgDto() {
		// TODO Auto-generated constructor stub
	}

	public Board_imgDto(int board_no, int board_img_no, String board_img_img, int board_img_seq) {
		super();
		this.board_no = board_no;
		this.board_img_no = board_img_no;
		this.board_img_img = board_img_img;
		this.board_img_seq = board_img_seq;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public int getBoard_img_no() {
		return board_img_no;
	}

	public void setBoard_img_no(int board_img_no) {
		this.board_img_no = board_img_no;
	}

	public String getBoard_img_img() {
		return board_img_img;
	}

	public void setBoard_img_img(String board_img_img) {
		this.board_img_img = board_img_img;
	}

	public int getBoard_img_seq() {
		return board_img_seq;
	}

	public void setBoard_img_seq(int board_img_seq) {
		this.board_img_seq = board_img_seq;
	}

	@Override
	public String toString() {
		return "Board_imgDto [board_no=" + board_no + ", board_img_no=" + board_img_no + ", board_img_img="
				+ board_img_img + ", board_img_seq=" + board_img_seq + "]";
	}
	
	
	
	
}
