package moo.ng.san.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import moo.ng.san.admin.model.dao.AdminDao;
import moo.ng.san.admin.model.vo.AdminBoardPageData;
import moo.ng.san.admin.model.vo.AdminMemberPageData;
import moo.ng.san.admin.model.vo.AdminOrderPageData;
import moo.ng.san.admin.model.vo.AdminProductPageData;
import moo.ng.san.admin.model.vo.AdminReportBoardPageData;
import moo.ng.san.admin.model.vo.CouponData;
import moo.ng.san.board.model.vo.Board;
import moo.ng.san.board.model.vo.BoardOption;
import moo.ng.san.board.model.vo.Notify;
import moo.ng.san.member.model.vo.Member;
import moo.ng.san.order.model.vo.Order;
import moo.ng.san.product.model.vo.Product;

@Service
public class AdminService {

	@Autowired
	private AdminDao dao;

	public String selectAllMemberCount() {
		String result = dao.selectAllMemberCount();
		return result;
	}

	public String selectAllOrderCount() {
		String result = dao.selectAllOrderCount();
		return result;
	}

	public String selectAllBoardCount() {
		String result = dao.selectAllBoardCount();
		return result;
	}

	public String selectAllSalesCount() {
		String result = dao.selectAllSalesCount();
		return result;
	}

	public String selectBestSalesCount() {
		String result = dao.selectBestSalesCount();
		return result;
	}

	public String selectEventCount() {
		String result = dao.selectEventCount();
		return result;
	}

	public String selectVariationMember() {
		String result = dao.selectVariationMember();

		return result;
	}

	public String selectVariationOrder() {
		String result = dao.selectVariationOrder();

		return result;
	}

	public String selectVariationBoard() {
		String result = dao.selectVariationBoard();

		return result;
	}

	// 페이지 네비 주소 수정 필요
	public AdminMemberPageData selectAllMemberList(int reqPage) {
		// 한 페이지 당 보여줄 게시물 수 : 10개
		int numPerPage = 5;
		// reqPage = 1 : 1~2 , reqPage = 2 3~4
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		// start , end 계산완료, 계산된 start, end 가지고 게시글 목록 조회
		// mybatis 는 매개변수로 한 개만 설정이 가능하므로, 필요한 값이 여러개면 여러개로 묶어야 함. (VO or map)
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<Member> list = dao.selectAllMemberList(map);

		// pageNavi 제작 시작
		// 전체 페이지 수 계산 필요 => 전체 게시물 수 조회
		int totalCount = dao.selectMemberCount();
		// 전체게시물로 전체 페이지수 계산

		int totalPage = (int) Math.ceil(totalCount / (double) numPerPage);
		// 실수 연산해서 올림연산을 하자 , 정수가 나오면 올림 해당 안된다. 소숫점이 있을때만 올림 연산이 됨

		// 페이지 네비 사이즈
		int pageNaviSize = 5;

		int pageNo = 1;

		if (reqPage > 3) {
			pageNo = reqPage - 2;
		}

		// 페이지네비 생성시작
		String pageNavi = "";
		// 이전버튼
		if (pageNo != 1) {
			pageNavi += "<a href='adminMemberPage.do?reqPage=" + (pageNo - 1) + "'>[이전]</a>";
		}
		// 페이지 숫자 생성
		for (int i = 0; i < pageNaviSize; i++) {
			if (pageNo == reqPage) {
				pageNavi += "<span>" + pageNo + "</span>";
			} else {
				pageNavi += "<a href='adminMemberPage.do?reqPage=" + pageNo + "'>" + pageNo + "</a>";
			}
			pageNo++;

			if (pageNo > totalPage) {
				break;
			}
		}
		// 다음버튼
		if (pageNo <= totalPage) {
			pageNavi += "<a href='adminMemberPage.do?reqPage=" + pageNo + "'>[다음]</a>";
		}
		AdminMemberPageData ampd = new AdminMemberPageData(list, pageNavi);

		return ampd;
	}

	public int updateMemberGrade(Member m) {
		int result = dao.updateMemberGrade(m);
		return result;
	}

	public ArrayList<Member> selectSearchMember(Member m) {
		ArrayList<Member> list = dao.selectSearchMember(m);

		return list;
	}

	public int selectMonthCount() {
		int result = dao.selectMonthCount();
		return result;
	}

	// 페이지 네비 주소 수정 필요
	public AdminProductPageData selectProductList(int reqPage) {
		// 한 페이지 당 보여줄 게시물 수 : 10개
		int numPerPage = 10;
		// reqPage = 1 : 1~2 , reqPage = 2 3~4
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		// start , end 계산완료, 계산된 start, end 가지고 게시글 목록 조회
		// mybatis 는 매개변수로 한 개만 설정이 가능하므로, 필요한 값이 여러개면 여러개로 묶어야 함. (VO or map)
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<Product> list = dao.selectAllProductList(map);

		// pageNavi 제작 시작
		// 전체 페이지 수 계산 필요 => 전체 게시물 수 조회
		int totalCount = dao.selectProductCount();
		// 전체게시물로 전체 페이지수 계산

		int totalPage = (int) Math.ceil(totalCount / (double) numPerPage);
		// 실수 연산해서 올림연산을 하자 , 정수가 나오면 올림 해당 안된다. 소숫점이 있을때만 올림 연산이 됨

		// 페이지 네비 사이즈
		int pageNaviSize = 5;

		int pageNo = 1;

		if (reqPage > 3) {
			pageNo = reqPage - 2;
		}

		// 페이지네비 생성시작
		String pageNavi = "";
		// 이전버튼
		if (pageNo != 1) {
			pageNavi += "<a href='/adminTotalProductList.do?reqPage=" + (pageNo - 1) + "'>[이전]</a>";
		}
		// 페이지 숫자 생성
		for (int i = 0; i < pageNaviSize; i++) {
			if (pageNo == reqPage) {
				pageNavi += "<span>" + pageNo + "</span>";
			} else {
				pageNavi += "<a href='/adminTotalProductList.do?reqPage=" + pageNo + "'>" + pageNo + "</a>";
			}
			pageNo++;

			if (pageNo > totalPage) {
				break;
			}
		}
		// 다음버튼
		if (pageNo <= totalPage) {
			pageNavi += "<a href='/adminTotalProductList.do?reqPage=" + pageNo + "'>[다음]</a>";
		}
		AdminProductPageData appd = new AdminProductPageData(list, pageNavi);

		return appd;
	}

	public int updateProductStatus(Product p) {
		int result = dao.updateProductStatus(p);

		return result;
	}

	public ArrayList<Product> selectSearchProduct(Product p) {
		ArrayList<Product> list = dao.selectSearchProduct(p);

		return list;
	}

	// 페이지 네비 주소 수정 필요
	
	public AdminOrderPageData selectAllOrderList(int reqPage) {
		// 한 페이지 당 보여줄 게시물 수 : 10개
		int numPerPage = 10;
		// reqPage = 1 : 1~2 , reqPage = 2 3~4
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		// start , end 계산완료, 계산된 start, end 가지고 게시글 목록 조회
		// mybatis 는 매개변수로 한 개만 설정이 가능하므로, 필요한 값이 여러개면 여러개로 묶어야 함. (VO or map)
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<Order> list = dao.selectAllOrderList(map);

		// pageNavi 제작 시작
		// 전체 페이지 수 계산 필요 => 전체 게시물 수 조회
		int totalCount = dao.selectOrderCount();
		// 전체게시물로 전체 페이지수 계산

		int totalPage = (int) Math.ceil(totalCount / (double) numPerPage);
		// 실수 연산해서 올림연산을 하자 , 정수가 나오면 올림 해당 안된다. 소숫점이 있을때만 올림 연산이 됨

		// 페이지 네비 사이즈
		int pageNaviSize = 5;

		int pageNo = 1;

		if (reqPage > 3) {
			pageNo = reqPage - 2;
		}

		// 페이지네비 생성시작
		String pageNavi = "";
		// 이전버튼
		if (pageNo != 1) {
			pageNavi += "<a href='/boardList.do?reqPage=" + (pageNo - 1) + "'>[이전]</a>";
		}
		// 페이지 숫자 생성
		for (int i = 0; i < pageNaviSize; i++) {
			if (pageNo == reqPage) {
				pageNavi += "<span>" + pageNo + "</span>";
			} else {
				pageNavi += "<a href='/boardList.do?reqPage=" + pageNo + "'>" + pageNo + "</a>";
			}
			pageNo++;

			if (pageNo > totalPage) {
				break;
			}
		}
		// 다음버튼
		if (pageNo <= totalPage) {
			pageNavi += "<a href='/boardList.do?reqPage=" + pageNo + "'>[다음]</a>";
		}
		
		AdminOrderPageData aopd = new AdminOrderPageData(list, pageNavi);

		return aopd;
	}

	public int updateDeliveryStatus(Product p) {
		int result = dao.updateDeliveryStatus(p);

		return result;
	}

	public ArrayList<Order> selectSearchDelivery(Order o) {
		ArrayList<Order> list = dao.selectSearchDelivery(o);

		return list;
	}

	public String selectAllBoardSalesCount() {
		String result = dao.selectAllBoardSalesCount();

		return result;
	}

	public String selectMonthBoardSalesCount() {
		String result = dao.selectMonthBoardSalesCount();

		return result;
	}

	// 페이지 네비 주소 수정 필요
	public AdminBoardPageData selectAllBoardList(int reqPage) {
		// 한 페이지 당 보여줄 게시물 수 : 10개
		int numPerPage = 10;
		// reqPage = 1 : 1~2 , reqPage = 2 3~4
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		// start , end 계산완료, 계산된 start, end 가지고 게시글 목록 조회
		// mybatis 는 매개변수로 한 개만 설정이 가능하므로, 필요한 값이 여러개면 여러개로 묶어야 함. (VO or map)
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<Board> boardList = dao.selectAllBoardList(map);
		
		for(Board b : boardList) {
			int boardNo = b.getBoardNo();
			ArrayList<BoardOption> boardOptionList = dao.selectAllBoardListBoardOption(boardNo);
			b.setBoardOptionList(boardOptionList);
		}

		// pageNavi 제작 시작
		// 전체 페이지 수 계산 필요 => 전체 게시물 수 조회
		int totalCount = dao.selectBoardCount();
		// 전체게시물로 전체 페이지수 계산

		int totalPage = (int) Math.ceil(totalCount / (double) numPerPage);
		// 실수 연산해서 올림연산을 하자 , 정수가 나오면 올림 해당 안된다. 소숫점이 있을때만 올림 연산이 됨

		// 페이지 네비 사이즈
		int pageNaviSize = 5;

		int pageNo = 1;

		if (reqPage > 3) {
			pageNo = reqPage - 2;
		}

		// 페이지네비 생성시작
		String pageNavi = "";
		// 이전버튼
		if (pageNo != 1) {
			pageNavi += "<a href='/adminBoardManagePage.do?reqPage=" + (pageNo - 1) + "'>[이전]</a>";
		}
		// 페이지 숫자 생성
		for (int i = 0; i < pageNaviSize; i++) {
			if (pageNo == reqPage) {
				pageNavi += "<span>" + pageNo + "</span>";
			} else {
				pageNavi += "<a href='/adminBoardManagePage.do?reqPage=" + pageNo + "'>" + pageNo + "</a>";
			}
			pageNo++;

			if (pageNo > totalPage) {
				break;
			}
		}
		// 다음버튼
		if (pageNo <= totalPage) {
			pageNavi += "<a href='/adminBoardManagePage.do?reqPage=" + pageNo + "'>[다음]</a>";
		}
		AdminBoardPageData abpd = new AdminBoardPageData(boardList, pageNavi);

		return abpd;
	}
	
	
	public AdminReportBoardPageData selectReportBoardList(int reqPage) {
		// 한 페이지 당 보여줄 게시물 수 : 10개
		int numPerPage = 10;
		// reqPage = 1 : 1~2 , reqPage = 2 3~4
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		// start , end 계산완료, 계산된 start, end 가지고 게시글 목록 조회
		// mybatis 는 매개변수로 한 개만 설정이 가능하므로, 필요한 값이 여러개면 여러개로 묶어야 함. (VO or map)
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<Board> list = dao.selectReportBoardList(map);
		
		for(Board board : list) {
			int boardNo = board.getBoardNo();
			ArrayList<Notify> notifyList = dao.selectReportNotifyList(boardNo);
			board.setNotifyList(notifyList);
		}
		

		// pageNavi 제작 시작
		// 전체 페이지 수 계산 필요 => 전체 게시물 수 조회
		int totalCount = dao.selectReportBoardCount();
		// 전체게시물로 전체 페이지수 계산

		int totalPage = (int) Math.ceil(totalCount / (double) numPerPage);
		// 실수 연산해서 올림연산을 하자 , 정수가 나오면 올림 해당 안된다. 소숫점이 있을때만 올림 연산이 됨

		// 페이지 네비 사이즈
		int pageNaviSize = 5;

		int pageNo = 1;

		if (reqPage > 3) {
			pageNo = reqPage - 2;
		}

		// 페이지네비 생성시작
		String pageNavi = "";
		// 이전버튼
		if (pageNo != 1) {
			pageNavi += "<a href='/adminBoardReportManagePage.do?reqPage=" + (pageNo - 1) + "'>[이전]</a>";
		}
		// 페이지 숫자 생성
		for (int i = 0; i < pageNaviSize; i++) {
			if (pageNo == reqPage) {
				pageNavi += "<span>" + pageNo + "</span>";
			} else {
				pageNavi += "<a href='/adminBoardReportManagePage.do?reqPage=" + pageNo + "'>" + pageNo + "</a>";
			}
			pageNo++;

			if (pageNo > totalPage) {
				break;
			}
		}
		// 다음버튼
		if (pageNo <= totalPage) {
			pageNavi += "<a href='/adminBoardReportManagePage.do?reqPage=" + pageNo + "'>[다음]</a>";
		}
		AdminReportBoardPageData arbpd = new AdminReportBoardPageData(list, pageNavi);

		return arbpd;
	}

	public int updateReportMember(Member m) {
		// TODO Auto-generated method stub
		return dao.updateReportMember(m);
	}

	public ArrayList<Board> selectReportMember(Board b) {
		ArrayList<Board>list = dao.selectReportMember(b);
		// TODO Auto-generated method stub
		return list;
	}

	public boolean updateChangeMemberStatus(String no, String level) {
		StringTokenizer sT1 = new StringTokenizer(no, "/");
		StringTokenizer sT2 = new StringTokenizer(level, "/");
		boolean result = true;
		while(sT1.hasMoreTokens()) {//sT1에 토큰남아있어?
			int memberNo = Integer.parseInt(sT1.nextToken());
			int memberStatus = Integer.parseInt(sT2.nextToken());
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberNo", memberNo);
			map.put("memberStatus", memberStatus);
			int changeResult = dao.updateChangeMemberStatus(map);
			if(changeResult == 0) {
				result = false;
				break; //한번이라도 실패하면 더이상 update를 할 필요가 없으므로 while문 종료
			}
		}
		
		return result;
	}

	public boolean updateChangeProductStatus(String no, String level) {
		StringTokenizer sT1 = new StringTokenizer(no, "/");
		StringTokenizer sT2 = new StringTokenizer(level, "/");
		boolean result = true;
		while(sT1.hasMoreTokens()) {//sT1에 토큰남아있어?
			int productNo = Integer.parseInt(sT1.nextToken());
			int productStatus = Integer.parseInt(sT2.nextToken());
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("productNo", productNo);
			map.put("productStatus", productStatus);
			int changeResult = dao.updateChangeProductStatus(map);
			if(changeResult == 0) {
				result = false;
				break; //한번이라도 실패하면 더이상 update를 할 필요가 없으므로 while문 종료
			}
		}
		
		return result;
	}

	public AdminBoardPageData selectSearchboard(Board b, String detailName) {
		
		if(detailName == "") {
			ArrayList<Board> boardList = dao.selectSearchBoard(b);
			for(Board board : boardList) {
					int boardNo = board.getBoardNo();
					ArrayList<BoardOption> boardOptionList = dao.selectSearchBoardOption(boardNo);
					board.setBoardOptionList(boardOptionList);
			}
				AdminBoardPageData abpd = new AdminBoardPageData(boardList, null);
				return abpd;
			
		}else {
			
			AdminBoardPageData abpd = new AdminBoardPageData();
			ArrayList<Board> boardList = new ArrayList<Board>();
			
			ArrayList<BoardOption> boardOptionList = dao.selectFindBoardOption(detailName); // 상품명으로 boardoption select
			
			for(BoardOption boardOption : boardOptionList) { // boardoption select 된 list 를 가지고 boardNo 을 추출해서 board 검색
				int boardNo = boardOption.getBoardNo(); // boardoption에서 boardNo 추출
				
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("boardNo", boardNo);
				map.put("detailName", detailName);
				boardList = dao.selectSearchBoard(map); // boardNo 으로 boardList select
				
				for (Board board : boardList) {
					ArrayList<BoardOption> optionList = new ArrayList<BoardOption>();
					optionList.add(boardOption);
					board.setBoardOptionList(optionList);
				}
				abpd.setBoardList(boardList); // 추출된 값을 abpd 에 set
			}
			
			abpd = new AdminBoardPageData(boardList, null);
			return abpd;
			
		}

	}

	public ArrayList<CouponData> selectCouponList() {
		ArrayList<CouponData> list = dao.selectAllCouponList();
		
		return list;
	}

	public ArrayList<CouponData> selectUseMoongList(int memberNo) {
		ArrayList<CouponData> list = dao.selectUseMoongList(memberNo);
		return list;
	}



    /*엑셀용*/

}
