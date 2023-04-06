package moo.ng.san.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Service;

import moo.ng.san.admin.model.dao.AdminDao;
import moo.ng.san.admin.model.vo.AdminBoardPageData;
import moo.ng.san.admin.model.vo.AdminMemberPageData;
import moo.ng.san.admin.model.vo.AdminOrderPageData;
import moo.ng.san.admin.model.vo.AdminProductPageData;
import moo.ng.san.board.model.vo.Board;
import moo.ng.san.member.model.vo.Member;
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
		int numPerPage = 10;
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
		AdminProductPageData appd = new AdminProductPageData(list, pageNavi);

		return appd;
	}

	public int updateProductStatus(Product p) {
		int result = dao.updateProductStatus(p);

		return result;
	}

	public ArrayList<Product> selectSearchProduct(Product p) {
		ArrayList<Product> list = dao.selectSearchMember(p);

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
		ArrayList<Board> list = dao.selectAllBoardList(map);

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
		AdminBoardPageData abpd = new AdminBoardPageData(list, pageNavi);

		return abpd;
	}
	
	
	// 페이지 네비 주소 수정 필요
	public AdminBoardPageData selectReportBoardList(int reqPage) {
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
		AdminBoardPageData abpd = new AdminBoardPageData(list, pageNavi);

		return abpd;
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


}
