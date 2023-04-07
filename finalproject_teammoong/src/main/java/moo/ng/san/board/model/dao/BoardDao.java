package moo.ng.san.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import moo.ng.san.board.model.vo.Board;
import moo.ng.san.board.model.vo.FileVO;

@Repository
public class BoardDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Board> selectBoardList(HashMap<String, Object> map) {
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
	

}
