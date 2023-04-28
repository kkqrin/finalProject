package moo.ng.san.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import moo.ng.san.board.model.dao.BoardDao;
import moo.ng.san.board.model.vo.Board;
import moo.ng.san.board.model.vo.BoardJoin;
import moo.ng.san.board.model.vo.BoardOption;
import moo.ng.san.board.model.vo.BoardOrder;
import moo.ng.san.board.model.vo.BoardPageData;
import moo.ng.san.board.model.vo.FileVO;
import moo.ng.san.category.model.vo.Category;
import moo.ng.san.member.model.vo.Member;
import moo.ng.san.product.model.vo.searchBarVO;

@Service
public class BoardService {
	@Autowired
	private BoardDao dao;


	public int insertBoard(Board b, ArrayList<FileVO> fileList, String[] detailName, int[] detailPrice, int[] detailCount) {
		int result = dao.insertBoard(b);
		if(result > 0) {
			//2. 방금 insert한 board_no 조회
			//int boardNo = dao.selectBoardNo();
			//3. File_tbl에 insert
			for(FileVO file : fileList) {
				file.setBoardNo(b.getBoardNo());
				result += dao.insertFile(file);
			}//파일업로드완료
			for(int i=0 ; i<detailName.length ; i++) {
				BoardOption o = new BoardOption();
				o.setBoardNo(b.getBoardNo());
				o.setDetailCount(detailCount[i]);
				o.setDetailName(detailName[i]);
				o.setDetailPrice(detailPrice[i]);
				result += dao.insertBoardOption(o);
			}
		}
		return result;
	}
		

	

	public BoardPageData selectBoardList(int reqPage) {
		// 한 페이지당 보여줄 게시물 수 : 5
		int numPerPage = 5;
		//reqPage = 1 : 1 ~ 2, reqPage = 2 :  3 ~ 4
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		//계산된 start, end를 가지고 게시물 목록 조회
		//Mybatis는 매개변수를 1개만 설정이 가능 -> 필요한 값이 여러개면 1개 묶어야함(VO, Map)
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<Board> list = dao.selectBoardList(map);
		
		for(Board b : list) {
			ArrayList<String> fileList = dao.selectBoardImg();
			b.setFileList(fileList);
		}
		//pageNavi 제작시작
		//전체페이지 수 계산필요 -> 전체 게시물 수 조회
		int totalCount = dao.selectBoardCount();
		//전체게시물로 전체페이지수 계산
		int totalPage = (int)Math.ceil(totalCount/(double)numPerPage);
		//페이지 네비 사이즈
		int pageNaviSize = 5;
		
		int pageNo =1;
		if(reqPage>3) {
			pageNo = reqPage-2;
		}
		//페이지네비 생성시작
		String pageNavi = "";
		//이전버튼
		if(pageNo != 1) {
			pageNavi +="<a href='/boardList.do?reqPage="+(pageNo-1)+"'>[이전]</a>";
		}
		//페이지 숫자 생성
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi +=	"<span>"+pageNo+"</span>";
			}else {
				pageNavi += "<a href='/boardList.do>reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		//다음 버튼
		if(pageNo <= totalPage) {
			pageNavi +="<a href='/boardList.do?reqPage="+pageNo+"'>[다음]</a>";
		}
		BoardPageData bpd = new BoardPageData(list, pageNavi);
//		bpd.setFileList(fileList);
		return bpd;
	}


	public Board selectOneBoard(int boardNo) {
		//1. board 테이블 조회
		Board b = dao.selectOneBoard(boardNo);
		//2. file_tbl 테이블 조회
		/*
		 * <select id="selectOneBoard" parameterType="_int" resultMap="getBoard"> select
		 *
		 * from board where board_no = #{_parameter} </select>
		 */
		return b;
	}


	public ArrayList<FileVO> selectFileList(int boardNo) {
		return dao.selectFileList(boardNo);
	}


	public ArrayList<BoardOption> selectOneBoardOptionList(int boardNo) {
		return dao.selectOptionList(boardNo);
	}




	public int insertBoardJoin(BoardJoin bj) {
		int result = dao.insertBoardJoin(bj);
		
		// 재고 update
		if(result>0) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			System.out.println("오더카운트 :  "+bj.getOrderCount());
			map.put("boardNo", bj.getBoardNo());
			map.put("orderCount", bj.getOrderCount());
			result = dao.updateBoardDetailCount(map);
		}

		return result;
	}




	public ArrayList<BoardJoin> selectBoardJoinList(int memberNo) {
		ArrayList<BoardJoin> list = dao.selectBoardJoinList(memberNo);
		return list;
	}




	public BoardJoin selectOneBoardJoin(int joinNo) {
		return dao.selectOneBoardJoin(joinNo);
	}




	public ArrayList<FileVO> boardDelete(int boardNo) {
		ArrayList<FileVO> delFileList = dao.selectFileList(boardNo);
		
		int result = dao.boardDelete(boardNo);
		if(result > 0) {
			result += dao.boardFileDelete(boardNo);
			return delFileList;
		}
		return null;
	}




	public int updateBoardCount(Board b) {
		int result = dao.updateBoardCount(b);
		return result;
	}




	public int insertBoardOrder(int joinNo, int[] optionNo, int[] orderPrice, int[] orderCount) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		int result = 0;
		
		map.put("joinNo", joinNo);
		for(int i=0 ; i < optionNo.length ; i++) {
			map.put("optionNo", optionNo[i]);
//			map.put("orderName",orderName[i]);
			map.put("orderPrice",orderPrice[i]);
			map.put("orderCount",orderCount[i]);
			
			result = dao.insertBoardOrderList(map);
			
		}
		return result;
	}




	public ArrayList<Board> selectBoardYourPage(String memberId) {
		ArrayList<Board> list = dao.selectBoardYourPage(memberId);
		return list;
	}




	public Member selectOneMember(String memberId) {
		return dao.selectMemberId(memberId);
	}





	public ArrayList<Category> selectCategoryList() {
		
		ArrayList<Category> list = dao.selectCategoryList();
		
		return list;
	}




	public ArrayList<Board> selectAllBoardList(int categoryNo) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("categoryNo", categoryNo);
		
		return dao.selectBoardAllList(map);
	}




	public int selectJoinNo() {
		return dao.selectJoinNo();
		}

	public ArrayList<Board> searchBoardList(searchBarVO sb) {
		ArrayList<Board> list = dao.searchBoardList(sb);
		for(Board b : list) {
			ArrayList<String> fileList = dao.selectBoardImg();
			b.setFileList(fileList);
		}
		return null;

	}




//	public ArrayList<BoardOrder> selectListBoardOrder(int joinNo) {
//		ArrayList<BoardOrder> list = dao.selectListBoardOrder(joinNo);
//		return list;
//	}

}
