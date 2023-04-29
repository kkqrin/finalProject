package moo.ng.san.admin.controller;

import java.time.LocalDate;
import java.time.YearMonth;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import moo.ng.san.admin.model.service.AdminService;
import moo.ng.san.admin.model.vo.AdminAskItemPageData;
import moo.ng.san.admin.model.vo.AdminBoardPageData;
import moo.ng.san.admin.model.vo.AdminMemberPageData;
import moo.ng.san.admin.model.vo.AdminOrderPageData;
import moo.ng.san.admin.model.vo.AdminProductPageData;
import moo.ng.san.admin.model.vo.AdminReportBoardPageData;
import moo.ng.san.admin.model.vo.CouponData;
import moo.ng.san.admin.model.vo.SalesData;
import moo.ng.san.askItem.model.vo.AskItem;
import moo.ng.san.board.model.vo.Board;
import moo.ng.san.gonggu.model.vo.GongguAllInfo;
import moo.ng.san.member.model.vo.Member;
import moo.ng.san.order.model.vo.Order;
import moo.ng.san.product.model.vo.Product;
import moo.ng.san.review.model.vo.ReviewReport;

@Controller
public class AdminController {

	@Autowired
	private AdminService service;
	
	/* 페이징 처리 */
	@RequestMapping(value="/admin.do")
	public String admin(Model model) {
		int summaryNum = 5;
		ArrayList<Product> productList = service.selectSummaryProductList(summaryNum);
		ArrayList<AskItem> askItemList = service.selectSummaryAskItemList(summaryNum);
		ArrayList<Board> boardList = service.selectSummaryBoardList(summaryNum);
		ArrayList<Member> memberList = service.selectSummaryMemberList(summaryNum);
		
		model.addAttribute("productList",productList);
		model.addAttribute("askItemList",askItemList);
		model.addAttribute("boardList",boardList);
		model.addAttribute("memberList",memberList);

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
	
	// 전체 카운트
	@ResponseBody
	@RequestMapping(value="/ajaxTotalCount.do", produces="application/json;charset=utf-8")
	public String ajaxTotalCountSelect(Model model) {
		String memberCount = service.selectAllMemberCount();
		String memberVariation = service.selectVariationMemberCount();
		String orderCount = service.selectAllOrderCount();
		String orderVariation = service.selectVariationOrderCount();
		String boardCount = service.selectAllBoardCount();
		String boardVariation = service.selectVariationBoardCount();
		String salesCount = service.selectAllSalesCount(); 
		String salesVariation = service.selectVariationSalesCount();
		
		ArrayList<Product> list = service.selectBestProductCount();
		int bestSalesCount = 0;
		for(Product p : list) {
			int bestProductCnt = p.getPresentCnt();
			int bestProductPrice = p.getProductPrice();
			double bestProductDiscount = p.getProductDiscount();
			bestSalesCount += bestProductCnt * bestProductPrice * ((100-bestProductDiscount)/100) ;
		}
		//하단부터는 논의가 필요함
		/*
		String couponCount = service.selectEventCount();  쿼리문 대기
		*/
		
		String[] total = new String[10];
		total[0] = memberCount;
		total[1] = memberVariation;
		total[2] = orderCount;
		total[3] = orderVariation; 
		total[4] = boardCount;
		total[5] = boardVariation;
		total[6] = salesCount;
		total[7] = salesVariation;
		total[8] = Integer.toString(bestSalesCount);
		// 하단은 논의가 필요
		/*
		total[9] = couponCount;
		*/
		
		Gson gson = new Gson();
		String result = gson.toJson(total);
		return result;
		
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
	
	// member 선택시 추가 정보 출력
	@ResponseBody
	@RequestMapping(value="/ajaxMemberView.do", produces = "application/json;charset=utf-8")
	public String ajaxMemberView(int memberNo, Model model) {
		Member m = service.ajaxMemberView(memberNo);
		Gson gson = new Gson();
		String result = gson.toJson(m);
		return result;
	}
	
	
	
	
	// ========================================================================
	/* 매출관리 페이지 */
	/* 전체 매출관리 */
	@RequestMapping(value="/adminTotalSalesManage.do")
	public String adminTotalSalesPage(int reqPage, Model model) {
		
		ArrayList<SalesData> list = new ArrayList<SalesData>();
		
		for(int i=1;i<13;i++) {
			SalesData sd = service.selectCountMonthSalesData(i);
			if(sd != null) {
				sd.setMonthNo(i);
				list.add(sd);
			}else {
				sd = new SalesData();
				sd.setMonthNo(i);
				sd.setTotalSales(i*10000);
				sd.setTotalCost(i*8000);
				list.add(sd);
			}
		}
		
		int totalSales = 0;
		for(SalesData sd : list) {
			totalSales += sd.getTotalSales();
		}
		
		LocalDate today = LocalDate.now();  // 오늘 날짜
		YearMonth thisMonth = YearMonth.from(today);  // 이번 달
		int monthValue = thisMonth.getMonthValue();  // 이번 달의 숫자값 (1~12)
		
		SalesData sd = service.selectCountMonthSalesData(monthValue);
		
		model.addAttribute("monthSales",sd.getTotalSales());
		model.addAttribute("totalSales",totalSales);
		
		return "admin/adminTotalSalesPage";
	}
	
	/* 1년 판매/원가 차트, x축 1~12월 */
	@ResponseBody
	@RequestMapping(value="/ajaxTotalSalesManage.do", produces = "application/json;charset=utf-8")
	public String ajaxTotalSalesManage(Model model) {
		ArrayList<SalesData> list = new ArrayList<SalesData>();
		
		for(int i=1;i<13;i++) {
			SalesData sd = service.selectCountMonthSalesData(i);
			if(sd != null) {
				sd.setMonthNo(i);
				list.add(sd);
			}else {
				sd = new SalesData();
				sd.setMonthNo(i);
				sd.setTotalSales(i*10000);
				sd.setTotalCost(i*8000);
				list.add(sd);
			}
		}
		
		int totalSales = 0;
		for(SalesData sd : list) {
			totalSales += sd.getTotalSales();
		}
		
		model.addAttribute("totalSales",totalSales);
		
		Gson gson = new Gson();
		String result = gson.toJson(list);
		return result;
	}
	
	/* 1년 카테고리별 판매/원가*/
	
	@ResponseBody
	@RequestMapping(value="/ajaxTotalCategorySalesManage.do", produces = "application/json;charset=utf-8" ) 
	public String ajaxTotalCategorySalesManage(Model model) { 
		ArrayList<SalesData> list = new ArrayList<SalesData>();
		 
		for(int i=1;i<14;i++) { // 카테고리 개수 
			SalesData sd = service.selectCountMonthCategorySalesData(i); 
			if(sd != null) {
				sd.setCategoryNo(i);
				list.add(sd); 
			}else {
				sd = new SalesData();
				sd.setCategoryNo(i);
				sd.setTotalCost(i*10000);
				sd.setTotalSales(i*12000);
				list.add(sd);
			}
		}

		Gson gson = new Gson(); 
		String result = gson.toJson(list); 
		return result;
		  
	}
	
	/* select 창에서 월 입력 받아서 해당 매출내역 뽑기*/
	@ResponseBody
	@RequestMapping(value="/ajaxSelectMonthSales.do", produces = "application/json;charset=utf-8")
	public String ajaxVariationMonthSales(int monthNo) {
		ArrayList<SalesData> list = service.selectMonthSalesData(monthNo);
		Gson gson = new Gson(); 
		String result = gson.toJson(list); 
		return result;
		
	}
	
	/* 홈페이지 사용자 성별에 따른 매출 */
	@ResponseBody
	@RequestMapping(value="/ajaxGenderSalesCount.do", produces = "application/json;charset=utf-8")
	public String ajaxGenderSalesCount() {
		ArrayList<SalesData> list = new ArrayList<SalesData>();
		for(int i=1;i<4;i++) {
			SalesData sd = service.selectGenderSalesData(i);
			if(sd == null) {
				sd = new SalesData();
			}
			sd.setGender(i);
			list.add(sd);
		}
		Gson gson = new Gson(); 
		String result = gson.toJson(list); 
		return result;
	}
	
	
	/* 매출보고서 출력 새창 경로*/
	@RequestMapping(value="salesReportPrint.do")
	public String salesReportPrint(Model model) {
		ArrayList<SalesData> list = new ArrayList<SalesData>();
		int totalSales = 0;
		int totalCost = 0;
		for(int i=1;i<14;i++) { // 카테고리 개수 
			SalesData sd = service.selectCountMonthCategorySalesData(i); 
			sd.setCategoryNo(i);
			list.add(sd); 
			totalSales += sd.getTotalSales();
			totalCost += sd.getTotalCost();
		}
		int profit = totalSales - totalCost;
		
		
		model.addAttribute("list",list);
		model.addAttribute("totalSales",totalSales);
		model.addAttribute("totalCost",totalCost);
		model.addAttribute("profit",profit);
		
		return "admin/salesReport";
	}
	
	
	/* 매출보고서 작성 */
	/*
	@ResponseBody
	@RequestMapping(value="ajaxSalesReportPrint.do", produces = "application/json;charset=utf-8")
	public String ajaxSalesReportPrint(Model model) {
		ArrayList<SalesData> list = new ArrayList<SalesData>();
		 
		for(int i=1;i<14;i++) { // 카테고리 개수 
			SalesData sd = service.selectCountMonthCategorySalesData(i); 
			sd.setCategoryNo(i);
			list.add(sd); 
		}
		model.addAttribute("list",list);
		
		return null;
	}
	*/
	
	
	/* 카테고리별 매출관리 */
	// 카테고리별 매출 중 연간 카테고리 매출
	
	@RequestMapping(value="/adminCategorySalesManage.do")
	public String adminCategorySalesManage(Model model) {
		SalesData bestSales = service.selectBestSalesCategory();
		ArrayList<SalesData> otherSalesList = service.selectOtherSalesCategory();
		int bestSal = bestSales.getTotalSales();
		int bestCos = bestSales.getTotalCost();
		double bestProfit = Math.floor((1-(bestCos/(double)bestSal))*100);
		double [] otherProfit = new double[otherSalesList.size()];
		
		for(int i=0;i < otherSalesList.size();i++) {
			int otherSal = otherSalesList.get(i).getTotalSales();
			int otherCos = otherSalesList.get(i).getTotalCost();
			otherProfit[i] = Math.floor((1-(otherCos / (double)otherSal))*100);
		}
		
		model.addAttribute("bestSales",bestSales);
		model.addAttribute("otherSalesList",otherSalesList);
		model.addAttribute("bestProfit",bestProfit);
		model.addAttribute("otherProfit",otherProfit);
		
		return "admin/adminCategorySalesManage";
	}
	
	
	
	
	
	// ========================================================================
	/* 상품관리 */
	/* 상품 등록 관리 list */
	@RequestMapping(value="/adminTotalProductList.do", produces = "application/json;charset=utf-8")
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
			return "admin/adminProductManagePage";
		}else {
			return "redirect:/admin/admin";
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
	public String changeDeliveryStatus(Order o) {
		int result = service.updateDeliveryStatus(o);
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
	
	/* 입점 문의 */
	@RequestMapping(value="adminProductRegist.do")
	public String adminProductRegistList(Model model, int reqPage) {
		AdminAskItemPageData aapd = service.selectAskItemList(reqPage);
		model.addAttribute("askList",aapd.getList());
		model.addAttribute("pageNavi",aapd.getPageNavi());
		
		return "admin/adminProductRegist";
	}
	
	/* 신고 리뷰 조회 */
	@RequestMapping(value="adminReviewReportList.do")
	public String adminReviewReportList(ReviewReport r, Model model) {
		
		ArrayList<ReviewReport> list = service.selectReviewReportList(r);
		model.addAttribute("reportList",list);
		
		return "admin/adminReviewReport";
		
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
	
	// 공동구매 List
	@RequestMapping(value="/adminGongguManagePage.do")
	public String adminGongguList(Model model) {
		ArrayList<GongguAllInfo> list = service.selectGongguList();
		
		model.addAttribute("gList",list);
		
		return "admin/adminGongguManagePage";
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
	

		
	
	// 증감
	
	@ResponseBody
	@RequestMapping(value = "/ajaxVaritaionMember.do")// 숫자 하나 넘겨주는거니까 json은 없어도 될 듯, produces = "application/json;charset=utf-8"
	public String memberVariationSelect() {
		String result = service.selectVariationMember();
		return result;
	}
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="/ajaxVariationOrder.do")// 숫자 하나 넘겨주는거니까 json은 없어도 될
	 * 듯, produces = "application/json;charset=utf-8" public String
	 * orderVariationSelect() { String result = service.selectVariationOrder();
	 * return result; }
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="/ajaxVariationBoard.do")// 숫자 하나 넘겨주는거니까 json은 없어도 될
	 * 듯, produces = "application/json;charset=utf-8" public String
	 * boardVariationSelect() { String result = service.selectVariationBoard();
	 * return result; }
	 */
	
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
	
	//이거 필요 없는거 같은데?????
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
	@RequestMapping(value="/ajaxReportMemberUpdate.do", produces = "application/json;charset=utf-8")
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
