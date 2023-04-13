package moo.ng.san.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import common.FileManager;
import moo.ng.san.board.model.service.BoardService;
import moo.ng.san.board.model.vo.Board;
import moo.ng.san.board.model.vo.BoardJoin;
import moo.ng.san.board.model.vo.BoardOption;
import moo.ng.san.board.model.vo.BoardPageData;
import moo.ng.san.board.model.vo.FileVO;

@Controller
public class BoardController {
	@Autowired
	private BoardService service;
	@Autowired
	private FileManager manager;
	
	@RequestMapping(value="/boardList.do")
	public String boardList(int reqPage, Model model) {
		BoardPageData bpd = service.selectBoardList(reqPage);
		//System.out.println("getList 확인"+bpd.getList());
		model.addAttribute("list",bpd.getList());
		model.addAttribute("pageNavi", bpd.getPageNavi());
		return "board/boardList";
	}
	
	@RequestMapping(value="/boardWriteFrm.do")
	public String boardWriteFrm() {
		return "board/boardWriteFrm";
	}
	
	@RequestMapping(value="/boardWrite.do")
	public String boardWirte(Board b, MultipartFile[] boardFile, HttpServletRequest request, String[] detailName, int[] detailPrice, int[] detailCount) {
		
		ArrayList<FileVO> fileList = new ArrayList<FileVO>();
		if(!boardFile[0].isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/board/");
			for(MultipartFile file : boardFile) {
				String filepath = manager.upload(savePath, file);
				FileVO fileVO = new FileVO();
				fileVO.setFilepath(filepath);
				fileList.add(fileVO);
			}
		}
		int result = service.insertBoard(b,fileList,detailName, detailPrice, detailCount);

		if(result == (fileList.size()+1)) {
			return "redirect:/boardList.do?reqPage=1";
		}else {			
			return "redirect:/";
		}
	}
	@RequestMapping(value="/boardView.do")
	public String boardView(int boardNo, Model model) {
		Board b = service.selectOneBoard(boardNo);
		ArrayList<BoardOption> optionList = service.selectOneBoardOptionList(boardNo);
		ArrayList<FileVO> fileList = service.selectFileList(boardNo);
		model.addAttribute("f",fileList);
		model.addAttribute("b",b);
		model.addAttribute("o",optionList);
		model.addAttribute("size",optionList.size());
		return "board/boardView";
		}
	@RequestMapping(value="/boardWriteView.do")
	public String boardWriteView(BoardJoin bj, int boardNo, Model model) {
		int result = service.insertBoardJoin(bj);
		if(result>0) {
			Board b = service.selectOneBoard(boardNo);
			model.addAttribute("b", b);
		}
		return "board/boardOrderAfter";
	}
	@RequestMapping(value="/boardOrderAfter.do")
	public String boardOrderAfter(int boardNo, Model model) {
		Board b = service.selectOneBoard(boardNo);
		model.addAttribute("b", b);
		return "board/boardOrderAfter";
	}

}
