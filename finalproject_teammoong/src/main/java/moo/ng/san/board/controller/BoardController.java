package moo.ng.san.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import moo.ng.san.board.model.service.BoardService;
import moo.ng.san.board.model.vo.Board;

@Controller
public class BoardController {
	@Autowired
	private BoardService service;
	
	@RequestMapping(value="/boardList.do")
	public String boardList(Model model) {
		return "board/boardList";
	}
	
	@RequestMapping(value="/boardWriteFrm.do")
	public String boardWriteFrm() {
		return "board/boardWriteFrm";
	}
	
	@RequestMapping(value="/boardWrite.do")
	public String boardWirte(Board b) {
		int result = service.insertBoard(b);
		return "redirect:/";
	}
	
}
