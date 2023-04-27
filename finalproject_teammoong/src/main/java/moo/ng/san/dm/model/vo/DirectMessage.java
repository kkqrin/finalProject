package moo.ng.san.dm.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DirectMessage {

	private int rnum;
	private int dmNo;
	
	private String dmSender;
	private String dmSenderName;
	
	private String dmReceiver;
	private String dmReceiverName;
	
	private String[] dmReceivers;
	
	private String dmContent;
	
	private String dmDate;
	private String dmDateHour;
	
	private int dmReadChk;

}
