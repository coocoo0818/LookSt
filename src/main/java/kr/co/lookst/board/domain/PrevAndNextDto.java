package kr.co.lookst.board.domain;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

@AllArgsConstructor
@Getter
@ToString
//이전 다음 board번호 dto
public class PrevAndNextDto {
    private Integer prev_board_no;
    private Integer next_board_no;
}
