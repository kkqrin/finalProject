package moo.ng.san.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import moo.ng.san.board.model.vo.Board;
import moo.ng.san.board.model.vo.BoardJoin;
import moo.ng.san.board.model.vo.BoardOption;
import moo.ng.san.board.model.vo.FileVO;

@Repository
public class BoardDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Board> selectBoardList(HashMap<String, Object> map) {
		System.out.println(map);
		List list = sqlSession.selectList("board.selectBoardList",map);
		return (ArrayList<Board>)list;
	}
	public int selectBoardCount() {
		int totalCount = sqlSession.selectOne("board.totalCount");
		return totalCount;
	}
	public int insertBoard(Board b) {
		int result = sqlSession.insert("board.insertBoard",b);
		System.out.println(result);
		return result;
	}
	public int insertFile(FileVO file) {
		int result = sqlSession.insert("board.insertFile",file);
		System.out.println(result);
		return result;
	}
	public Board selectOneBoard(int boardNo) {
		Board b = sqlSession.selectOne("board.selectOneBoard",boardNo);
		return b;
	}
	public ArrayList<FileVO> selectFileList(int boardNo) {
		List list = sqlSession.selectList("board.selectFileList",boardNo);
		return (ArrayList<FileVO>)list;
	}
	public ArrayList<String> selectBoardImg() {
		List list = sqlSession.selectList("board.selectBoardImg");
		System.out.println("Board Dao fileList : "+list);
		return (ArrayList<String>)list;
	}
	public ArrayList<BoardOption> selectOptionList(int boardNo) {
		List list = sqlSession.selectList("board.selectOptionList",boardNo);
		return (ArrayList<BoardOption>)list;
	}
	
	public int insertBoardOption(BoardOption o) {
		int result = sqlSession.insert("board.insertOption",o);
		return result;
	}
	public int insertBoardJoin(BoardJoin bj) {
		int result = sqlSession.insert("board.insertBoardJoin",bj);
		System.out.println(result);
		return result;
	}
	public ArrayList<BoardJoin> selectBoardJoinList(int memberNo) {
		List list = sqlSession.selectList("board.selectBoardJoinList",memberNo);
		return (ArrayList<BoardJoin>)list;
	}
	public BoardJoin selectOneBoardJoin(int joinNo) {
		BoardJoin bj = sqlSession.selectOne("board.selectOneBoardJoin", joinNo);
		return bj;
	}
	public int boardDelete(int boardNo) {
		int result = sqlSession.delete("board.boardDelete",boardNo);
		return result;
	}
	public int updateBoardCount(Board b) {
		int result = sqlSession.update("board.boardReadCount",b);
		return result;
	}
	

}
