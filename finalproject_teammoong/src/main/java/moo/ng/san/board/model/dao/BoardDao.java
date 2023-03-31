package moo.ng.san.board.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import moo.ng.san.board.model.vo.Board;

@Repository
public class BoardDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	public int insertBoard(Board b) {
		int result = sqlSession.insert("board.insertBoard",b);
		return result;
	}

}
