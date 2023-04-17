package moo.ng.san.admin.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import moo.ng.san.board.model.vo.Board;
import moo.ng.san.board.model.vo.Notify;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class AdminReportBoardPageData {
	private ArrayList<Board> boardList;
	private String pageNavi;
	
}
