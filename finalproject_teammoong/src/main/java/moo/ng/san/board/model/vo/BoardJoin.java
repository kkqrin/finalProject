package moo.ng.san.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardJoin {
	private int joinNo;
	private int boardNo;
	private int	memberNo;
	private String payerName;
	private String payerDate;
	private String receiverName;
	private String receiverPhone;
	private String receiverAddr;
	private String refundBank;
	private String refundAccount;
	private String refundName;
	private int orderCount;
	private int depositPrice;
	private String accountBank;
	private String accountName;
	private String thumbnail;
	private String boardName;
	private int boardStatus;
	private String accountWriter;
	
	private String detailName;
	private String memberName;
}
