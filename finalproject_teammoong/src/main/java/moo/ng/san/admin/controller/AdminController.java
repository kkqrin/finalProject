package moo.ng.san.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import moo.ng.san.admin.model.service.AdminService;
import moo.ng.san.admin.model.vo.AdminBoardPageData;
import moo.ng.san.admin.model.vo.AdminMemberPageData;
import moo.ng.san.admin.model.vo.AdminOrderPageData;
import moo.ng.san.admin.model.vo.AdminProductPageData;
import moo.ng.san.admin.model.vo.AdminReportBoardPageData;
import moo.ng.san.admin.model.vo.CouponData;
import moo.ng.san.board.model.vo.Board;
import moo.ng.san.member.model.vo.Member;
import moo.ng.san.order.model.vo.Order;
import moo.ng.san.product.model.vo.Product;

@Controller
public class AdminController {

	@Autowired
	private AdminService service;
	
	/* 페이징 처리 */
	@RequestMapping(value="/admin.do")
	public String admin() {
		return "admin/admin";
	}
	// ========================================================================
	/* 회원관리 페이지 */
	@RequestMapping(value="/adminMemberPage.do")
	public String adminMemberPage(int reqPage, Model model) {
		AdminMemberPageData ampd = service.selectAllMemberList(reqPage);
		model.addAttribute("memberList",ampd.getList());
		model.addAttribute("pageNavi",ampd.getPageNavi());
		
		return "admin/adminMemberPage";
	}
	
	// 개별 회원 등급 변경
	@ResponseBody
	@RequestMapping(value="/ajaxChangeMemberStatus.do")
	public String changeMemberGrade(Member m) {
		int result = service.updateMemberGrade(m);
		if(result > 0) {
			return "ok"; 
		}
			return "again";
	}
	
	
	// 검색기능
	@ResponseBody
	@RequestMapping(value="/ajaxAdminSearchMember.do", produces = "application/json;charset=utf-8")
	public String adminSearchMember(Member m, Model model) {
		ArrayList<Member> list = service.selectSearchMember(m);
		Gson gson = new Gson();
		String result = gson.toJson(list);
		return result;
		
	}
	
	
	// 회원 등급 변경 일괄 적용
	@RequestMapping(value="/checkedChangeMemberStatus.do")
	public String checkedChangeMemberStatus(HttpServletRequest request) {
		String no = request.getParameter("no");
		String level = request.getParameter("level");
		boolean result = service.updateChangeMemberStatus(no, level);
		
		if(result) {
			return "redirect:/";
		}else {
			return "redirect:/";
		}
	}
	
	
	
	
	// ========================================================================
	/* 매출관리 페이지 */
	/* 전체 매출관리 */
	@RequestMapping(value="/adminTotalSalesManage.do")
	public String adminTotalSalesPage(int reqPage, Model model) {
		
		return "admin/adminTotalSalesPage";
	}
	
	/* 전체 매출 차트*/
	
	
	/* 카테고리별 매출관리 */
	
	// ========================================================================
	/* 상품관리 */
	/* 상품 등록 관리 list */
	@RequestMapping(value="/adminTotalProductList.do")
	public String productListSelect(Model model, int reqPage) {
		AdminProductPageData appd = service.selectProductList(reqPage);
		model.addAttribute("productList",appd.getList());
		model.addAttribute("pageNavi",appd.getPageNavi());
		return "admin/adminProductManagePage";
		
	}
	// 상품 검색기능
	@ResponseBody
	@RequestMapping(value="/ajaxAdminSearchProduct.do", produces = "application/json;charset=utf-8")
	public String adminSearchProduct(Product p) {
		ArrayList<Product> list = service.selectSearchProduct(p);
		Gson gson = new Gson();
		String result = gson.toJson(list);
		return result;
		
	}
	
	//상품 상태 변경
	@ResponseBody
	@RequestMapping(value="/ajaxChangeProductStatus.do")
	public String productChangeStatus(Product p) {
		int result = service.updateProductStatus(p);
		
		if(result > 0) {
			return "ok"; 
		}
			return "again";
		
	}
	
	
	// 상품 상태 변경 일괄 적용
	@RequestMapping(value="/checkedChangeProductStatus.do")
	public String checkedChangeProductStatus(HttpServletRequest request) {
		String no = request.getParameter("no");
		String level = request.getParameter("level");
		
		boolean result = service.updateChangeProductStatus(no, level);
		
		if(result) {
			return "redirect:/";
		}else {
			return "redirect:/";
		}
	}
	
	
	/* 배송 관리 */
	//배송관리 list
	@RequestMapping(value="/adminDeliveryManagePage.do")
	public String allDeliveryList(int reqPage, Model model) {
		AdminOrderPageData aopd = service.selectAllOrderList(reqPage);
		model.addAttribute("orderList",aopd.getOrderList());
		model.addAttribute("pageNavi",aopd.getPageNavi());
		return "admin/adminDeliveryManagePage";
	}
	
	
	// 배송 상태 변경
	@ResponseBody
	@RequestMapping(value="/ajaxChangeDeliveryStatus.do")
	public String changeDeliveryStatus(Product p) {
		int result = service.updateDeliveryStatus(p);
		if(result > 0) {
			return "ok";
		}else {
			return "again";
		}
	}
	
	// 배송 검색
	@ResponseBody
	@RequestMapping(value="/ajaxAdminSearchDelivery.do", produces = "application/json;charset=utf-8")
	public String adminSearchDelivery(Order o) {
		ArrayList<Order> list = service.selectSearchDelivery(o);
		Gson gson = new Gson();
		String result = gson.toJson(list);
		return result;
	}
	
	
	//===========================================================================
	/* 뭉머니 관리 */
	
	//몽머니 List
	@RequestMapping(value="/adminDaycheckManagePage.do")
	public String adminCouponList(Model model) {
		ArrayList<CouponData> list = service.selectCouponList();
		model.addAttribute("mMoneyList",list);
		return "admin/adminDayCheckManagePage";
	}
	
	//몽머니 List 에서 셀 선택시 모달창에 들어가는 데이터 검색
	@ResponseBody
	@RequestMapping(value="/ajaxUseMoongCheck.do", produces = "application/json;charset=utf-8")
	public String ajaxUseMoongCheck(int memberNo) {
		ArrayList<CouponData> list = service.selectUseMoongList(memberNo);
		Gson gson = new Gson();
		String result = gson.toJson(list);
		return result;
	}
	
	
	// ========================================================================
	/* 여기여기붙어라 게시판 */
	
	/*여여붙 게시판 조회*/
	// 여기여기 붙어라 참여인원 순으로 list 정렬
	
	@RequestMapping(value="/adminBoardManagePage.do")
	public String allBoardList(int reqPage, Model model) {
		AdminBoardPageData abpd = service.selectAllBoardList(reqPage);
		model.addAttribute("boardList",abpd.getBoardList());
		model.addAttribute("pageNavi",abpd.getPageNavi());
		return "admin/adminBoardManagePage";
	}
	
	// 여여붙 검색기능
	@ResponseBody
	@RequestMapping(value="/ajaxAdminSearchBoard.do", produces = "application/json;charset=utf-8")
	public String adminSearchBoard(Board b, String detailName) {
		AdminBoardPageData abpd = service.selectSearchboard(b, detailName);
		Gson gson = new Gson();
		String result = gson.toJson(abpd);
		return result;
	}
	
	/* 신고 리스트 조회 */
	@RequestMapping(value="/adminBoardReportManagePage.do")
	public String reportBoardManage(int reqPage, Model model) {
		AdminReportBoardPageData arbpd = service.selectReportBoardList(reqPage);
		model.addAttribute("reportList",arbpd.getBoardList());
		model.addAttribute("pageNavi",arbpd.getPageNavi());
		return "admin/adminBoardReportManagePage";
	}
	
	

	
	// ========================================================================
	
	
	
	
	
	/* admin main 페이지 */
	/*
	 * // count
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="/ajaxAllMemberCount.do")//, produces =
	 * "application/json;charset=utf-8" public String memberAllCountSelect() {
	 * String result = service.selectAllMemberCount(); return result; }
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="/ajaxAllOrderCount.do")//, produces =
	 * "application/json;charset=utf-8") public String orderAllCountSelect() {
	 * String result = service.selectAllOrderCount(); return result; }
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="/ajaxAllBoardCount.do")//,
	 * produces="application/json;charset=utf-8") public String
	 * boardAllCountSelect() { String result = service.selectAllBoardCount(); return
	 * result; }
	 * 
	 * // 쿼리문 상 전체 매출액으로 되어 있음
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="/ajaxAllSalesCount.do")//,
	 * produces="application/json;charset=utf-8") public String
	 * salesAllCountSelect() { String result = service.selectAllSalesCount(); return
	 * result; }
	 * 
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="/ajaxBestSalesCount.do")//,
	 * produces="application/json;charset=utf-8") public String
	 * bestSalesCountSelect() { String result = service.selectBestSalesCount();
	 * return result; }
	 * 
	 * @ResponseBody // 미완성
	 * 
	 * @RequestMapping(value="/ajaxEventCount.do")//,
	 * produces="application/json;charset=utf-8") public String bestEventSelect() {
	 * String result = service.selectEventCount(); return result; }
	 */
	
	// 전체 카운트
	@ResponseBody
	@RequestMapping(value="/ajaxTotalCount.do", produces="application/json;charset=utf-8")
	public String ajaxTotalCountSelect(Model model) {
		String memberCount = service.selectAllMemberCount();
		String orderCount = service.selectAllOrderCount();
		String boardCount = service.selectAllBoardCount();
		String salesCount = service.selectAllSalesCount(); 
		String bestSalesCount = service.selectBestSalesCount();
		String couponCount = service.selectEventCount(); 
		
		String[] total = new String[6];
		total[0] = memberCount;
		total[1] = orderCount;
		total[2] = boardCount;
		total[3] = salesCount;
		total[4] = bestSalesCount;
		total[5] = couponCount;
		Gson gson = new Gson();
		String result = gson.toJson(total);
		return result;
		
	}
		
	
	// 증감
	
	@ResponseBody
	@RequestMapping(value = "/ajaxVaritaionMember.do")// 숫자 하나 넘겨주는거니까 json은 없어도 될 듯, produces = "application/json;charset=utf-8"
	public String memberVariationSelect() {
		String result = service.selectVariationMember();
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/ajaxVariationOrder.do")// 숫자 하나 넘겨주는거니까 json은 없어도 될 듯, produces = "application/json;charset=utf-8"
	public String orderVariationSelect() {
		String result = service.selectVariationOrder();
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/ajaxVariationBoard.do")// 숫자 하나 넘겨주는거니까 json은 없어도 될 듯, produces = "application/json;charset=utf-8"
	public String boardVariationSelect() {
		String result = service.selectVariationBoard();
		return result;
	}

	
	/* 회원관리 페이지*/
	
	/*
	 * @RequestMapping(value="/allMemberList.do") public String allMemberSelect(int
	 * reqPage, Model model) { AdminMemberPageData ampd =
	 * service.selectAllMemberList(reqPage);
	 * model.addAttribute("memberList",ampd.getList());
	 * model.addAttribute("pageNavi",ampd.getPageNavi()); return "redirect:/"; }
	 */
	
	



	
	// ========================================================================
	
	
	/* 매출관리 페이지 */
	
	//총 매출액은 첫 페이지꺼 쓰는걸로. 필요하다면 query 문 조건 수정
	
	@ResponseBody
	@RequestMapping(value="/ajaxMonthSalesCount.do")
	public String salesMonthCount() {
		int result = service.selectMonthCount();
		if(result > 0) {
			return "ok";
		}else {
			return "again";
		}
	}
	
	// ==========================================================================
	
	/* 상품 관리 */
	
	// 상품 등록관리
	


	
	
	
	
	
	/* 상품 등록 현황 */
	
	//상품 전체 등록 현황
	/*
	 * @RequestMapping(value="/allProductList.do") public String
	 * productListSelect(Model model, int reqPage) { AdminProductPageData appd =
	 * service.selectProductList(reqPage);
	 * model.addAttribute("productList",appd.getList());
	 * model.addAttribute("pageNavi",appd.getPageNavi()); return "redirect:/";
	 * 
	 * }
	 */
	


	//일괄선택
	
	
	/* 배송 관리 현황*/
	
	/*
	 * //배송관리 list
	 * 
	 * @RequestMapping(value="/allDeliveryList.do") public String
	 * allDeliveryList(int reqPage, Model model) { AdminOrderPageData aopd =
	 * service.selectAllOrderList(reqPage);
	 * model.addAttribute("orderList",aopd.getList());
	 * model.addAttribute("pageNavi",aopd.getPageNavi()); return "redirect:/"; }
	 */
	
	

	

	// 배송 일괄 변경
	
	
	/* 이벤트 발행 관리 */
	
	/* 여기여기 붙어라 관리 */
	
	// 총 거래금액
	@ResponseBody
	@RequestMapping(value="/ajaxAllBoardSalesCount.do")
	public String allBoardSalesCount() {
		String result = service.selectAllBoardSalesCount();
		return result;
	}
	
	// 월 거래액
	@ResponseBody
	@RequestMapping(value="/monthBoardSalseCount.do")
	public String monthBoardSalesCount() {
		String result = service.selectMonthBoardSalesCount();
		return result;
	}
	
	/*
	 * // 여기여기 붙어라 참여인원 순으로 list 정렬
	 * 
	 * @RequestMapping(value="/allBoardList.do") public String allBoardList(int
	 * reqPage, Model model) { AdminBoardPageData abpd =
	 * service.selectAllBoardList(reqPage);
	 * model.addAttribute("orderList",abpd.getList());
	 * model.addAttribute("pageNavi",abpd.getPageNavi()); return "redirect:/"; }
	 */
	
	
	/* 신고 게시글 관리 */
	
	/*
	 * //신고 게시글 리스트
	 * 
	 * @RequestMapping(value="/reportBoardManage.do") public String
	 * reportBoardManage(int reqPage, Model model) { AdminBoardPageData abrpd =
	 * service.selectReportBoardList(reqPage);
	 * model.addAttribute("reportList",abrpd.getList());
	 * model.addAttribute("pageNavi",abrpd.getPageNavi()); return "redirect:/"; }
	 */
	
	// 신고회원 회원등급 update
	@ResponseBody
	@RequestMapping(value="/ajaxReportMemberUpdate.do")
	public String reportMemberUpdate(Member m) {
		int result = service.updateReportMember(m);
		if(result > 0) {
			return "ok";
		}else {
			return "again";
		}
	}
	
	//정지회원 검색기능
	@ResponseBody
	@RequestMapping(value="/ajaxReportMemberSearch.do", produces = "application/json;charset=utf-8")
	public String reportMemberSearch(Board b) {
		ArrayList<Board> list = service.selectReportMember(b);
		Gson gson = new Gson();
		String result = gson.toJson(list);
		return result;
	}
	

	
	
	/*엑셀 출력*/

	
	
	
	
	
}
