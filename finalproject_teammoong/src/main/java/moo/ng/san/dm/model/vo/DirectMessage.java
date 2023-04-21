package moo.ng.san.dm.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DirectMessage {

	private int dmNo;
	private String dmSender;
	private String dmReceiver;
	private String dmContent;
	private String dmDate;
	private int dmReadChk;
	
}
