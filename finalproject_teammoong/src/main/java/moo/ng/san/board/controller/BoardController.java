package moo.ng.san.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import common.FileManager;
import moo.ng.san.board.model.service.BoardService;
import moo.ng.san.board.model.vo.Board;
import moo.ng.san.board.model.vo.BoardJoin;
import moo.ng.san.board.model.vo.BoardOption;
import moo.ng.san.board.model.vo.BoardOrder;
import moo.ng.san.board.model.vo.BoardPageData;
import moo.ng.san.board.model.vo.FileVO;
import moo.ng.san.category.model.vo.Category;
import moo.ng.san.member.model.vo.Member;

@Controller
public class BoardController {
	@Autowired
	private BoardService service;
	@Autowired
	private FileManager manager;
	
//	@RequestMapping(value="/boardList.do")
//	public String boardList(int reqPage, Model model) {
//		BoardPageData bpd = service.selectBoardList(reqPage);
//		//System.out.println("getList 확인"+bpd.getList());
//		model.addAttribute("list",bpd.getList());
//		model.addAttribute("pageNavi", bpd.getPageNavi());
//		return "board/boardList";
//	}
	
	@RequestMapping(value="/boardList.do")
	public String boardList(String categoryNo, Model model, @SessionAttribute(required=false) Member m) {
		System.out.println("categoryNo : "+categoryNo);
		
		// 카테고리 리스트
		ArrayList<Category> categoryList = service.selectCategoryList();
		model.addAttribute("categoryList", categoryList);
		
		int iCategoryNo = 0;
		if(categoryNo != null) {
			iCategoryNo = Integer.parseInt(categoryNo);
		}
		model.addAttribute("sCategory", iCategoryNo);
		
		ArrayList<Board> boardList = service.selectAllBoardList(iCategoryNo);
		model.addAttribute("boardList", boardList);
		
		// 카테고리 구분
		model.addAttribute("sCategory", iCategoryNo);
		
		
		
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
			return  "redirect:/";
		}else {			
			return"redirect:/boardList.do?reqPage=1";
		}
	}
	@RequestMapping(value="/boardView.do")
	public String boardView(int boardNo, Model model) {
		Board b = service.selectOneBoard(boardNo);
		b.setBoardCount(b.getBoardCount()+1);
		int result = service.updateBoardCount(b);
		
		ArrayList<BoardOption> optionList = service.selectOneBoardOptionList(boardNo);
		ArrayList<FileVO> fileList = service.selectFileList(boardNo);
		model.addAttribute("f",fileList);
		model.addAttribute("b",b);
		model.addAttribute("o",optionList);
		model.addAttribute("size",optionList.size());
		return "board/boardView";
		}
	
	
	@RequestMapping(value="/boardWriteView.do")
//	public String boardWriteView(BoardJoin bj, int boardNo, Model model) {
	public String boardWriteView(BoardJoin bj, int boardNo, int[] optionNo, int[] detailPrice, int[] orderCount, Model model) {
		System.out.println("보드조인  insert 전: "+bj);
		int result = service.insertBoardJoin(bj);
		System.out.println("보드조인  insert 후: "+bj);
		
		System.out.println(optionNo);
		if(result>0) {
			// 보드 조인 상세 insert
			
			// joinNo select
			int joinNo = service.selectJoinNo();
			
			result = service.insertBoardOrder(joinNo, optionNo, detailPrice, orderCount);
		}

		
		if(result>0) {
			Board b = service.selectOneBoard(boardNo);
			model.addAttribute("b", b);
			model.addAttribute("bj", bj);
		}
		return "board/boardOrderAfter";
	}
	
	@RequestMapping(value="/boardOrderAfter.do")
	public String boardOrderAfter(int boardNo, int joinNo,Model model) {
		BoardJoin bj = service.selectOneBoardJoin(joinNo);
		model.addAttribute("bj",bj);
		return"board/myPageRequestDeposit";
	}
	@RequestMapping(value="/myPageRequestDeposit.do")
	public String myPageRequestDeposit(Model model, int joinNo) {
		BoardJoin bj = service.selectOneBoardJoin(joinNo);
//		ArrayList<BoardOrder> list = service.selectListBoardOrder(joinNo);
		model.addAttribute("bj",bj);
		return"board/myPageRequestDeposit";
	}
	@RequestMapping(value="/myJoinList.do")
	public String myJoinList(int reqPage, Model model, @SessionAttribute(required=false) Member m) {
//		BoardPageData bpd = service.selectBoardList(reqPage);
		ArrayList<BoardJoin> list = service.selectBoardJoinList(m.getMemberNo());
		model.addAttribute("list", list);
		return"board/myJoinList";
	}

	@RequestMapping(value = "/boardDelete.do")
	public String boardDelete(int boardNo, HttpServletRequest request) {
		//db 삭제하고, 서버에 업로드 되어있는 파일을 지우기 위해 파일 목록을 가져옴
		ArrayList<FileVO> list = service.boardDelete(boardNo);
		
		if(list == null) {
			return "redirect:/boardView.do?boardNo="+boardNo;//다시 상세보기로			
		}else {
			//업로드 되어있는 파일도 삭제{request 있어야함)
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/board/");
			for(FileVO file : list) {
				manager.deleteFile(savePath, file.getFilepath());
			}
			return "redirect:/boardList.do?reqPage=1";
		}

	}
	@RequestMapping(value="/boardYourPage.do")
	public String boardYouPage(Model model, String boardWriter) {
		ArrayList<Board> list = service.selectBoardYourPage(boardWriter);
		Member m = service.selectOneMember(boardWriter);
		//System.out.println("getList 확인"+bpd.getList());
		model.addAttribute("list",list);
		model.addAttribute("m",m);
		return "board/boardYourPage";
	}
	
	
	
	
	
	
	
}