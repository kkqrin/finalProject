package moo.ng.san.admin.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import moo.ng.san.board.model.vo.Board;
import moo.ng.san.board.model.vo.BoardJoin;
import moo.ng.san.board.model.vo.BoardOption;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminBoardPageData {
	private ArrayList<Board> boardList;
	private String pageNavi;
}
