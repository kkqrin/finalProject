package moo.ng.san.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import moo.ng.san.board.model.service.BoardService;

@Controller
public class BoardController {
	@Autowired
	private BoardService service;
}
