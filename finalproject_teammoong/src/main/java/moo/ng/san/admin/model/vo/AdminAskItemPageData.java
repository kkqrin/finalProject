package moo.ng.san.admin.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import moo.ng.san.askItem.model.vo.AskItem;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminAskItemPageData {
	private ArrayList<AskItem> list;
	private String pageNavi;
	
}
