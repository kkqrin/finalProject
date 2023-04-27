package moo.ng.san.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardOrder {
	private int orderDetailNo;
	private int optionNo;
	private int memberNo;
	private String oderName;
	private int orderPrice;
	private int orderCount;
	private int joinNo;
}
