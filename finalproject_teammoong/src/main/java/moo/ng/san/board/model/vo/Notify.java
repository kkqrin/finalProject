package moo.ng.san.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Notify {
	private int notifyNo;
	private int memberNo;
	private int boardNo;
	private int notifyItem;
	
}
