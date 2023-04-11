package moo.ng.san.askItem.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AskItem {
	private int corpNo;
	private int regNo;
	private String corpName;
	private String repName;
	private String corpAddr1;
	private String corpAddr2;
	private String corpType;
	private String corpItem;
	private String contName;
	private String depart;
	private String positionJob;
	private String contPhone;
	private String contMail;
	private String homepage;
	private String category;
	private String askTitle;
	private String askContent;
	private String askDate;
}
