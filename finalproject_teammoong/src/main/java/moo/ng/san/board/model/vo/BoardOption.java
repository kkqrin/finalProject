package moo.ng.san.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardOption {
	private int optionNo;
	private int boardNo;
	private String detailName;
	private int detailCount;
	private int detailPrice;
}
