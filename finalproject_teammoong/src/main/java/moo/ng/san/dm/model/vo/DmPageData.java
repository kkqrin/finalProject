package moo.ng.san.dm.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DmPageData {
	ArrayList<DirectMessage> list;
	private String pageNavi;
}
