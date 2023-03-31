package moo.ng.san.board.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import moo.ng.san.board.model.dao.BoardDao;
import moo.ng.san.board.model.vo.Board;

@Service
public class BoardService {
	@Autowired
	private BoardDao dao;

	public int insertBoard(Board b) {
		int result = dao.insertBoard(b);
		return result;
	}
}
