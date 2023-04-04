package moo.ng.san.admin.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import moo.ng.san.board.model.vo.Board;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminBoardPageData {
	private ArrayList<Board> list;
	private String pageNavi;
}
