package moo.ng.san.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
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
import moo.ng.san.member.model.vo.Member;
import moo.ng.san.product.model.vo.Product;

@Controller
public class AdminController {

	@Autowired
	private AdminService service;
	
	@RequestMapping(value="/admin.do")
	public String admin() {
		return "admin/admin";
	}
	
	/* admin main 페이지 */
	// count
	@ResponseBody
	@RequestMapping(value="/ajaxAllMemberCount.do")//, produces = "application/json;charset=utf-8"
	public String memberAllCountSelect() {
		String result = service.selectAllMemberCount();
		return result;
	}
	
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="/ajaxAllOrderCount.do")//, produces =
	 * "application/json;charset=utf-8") public String orderAllCountSelect() {
	 * String result = service.selectAllOrderCount(); return result; }
	 */
	@ResponseBody
	@RequestMapping(value="/ajaxAllBoardCount.do")//, produces="application/json;charset=utf-8")
	public String boardAllCountSelect() {
		String result = service.selectAllBoardCount();
		return result;
	}
	
	// 쿼리문 상 전체 매출액으로 되어 있음
	@ResponseBody
	@RequestMapping(value="/ajaxAllSalesCount.do")//, produces="application/json;charset=utf-8")
	public String salesAllCountSelect() {
		String result = service.selectAllSalesCount();
		return result;
	}

	
	@ResponseBody
	@RequestMapping(value="/ajaxBestSalesCount.do")//, produces="application/json;charset=utf-8")
	public String bestSalesCountSelect() {
		String result = service.selectBestSalesCount();
		return result;
	}
	
	@ResponseBody // 미완성
	@RequestMapping(value="/ajaxEventCount.do")//, produces="application/json;charset=utf-8")
	public String bestEventSelect() {
		String result = service.selectEventCount();
		return result;
	}
		
	
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
	 */
	@ResponseBody
	@RequestMapping(value="/ajaxVariationBoard.do")// 숫자 하나 넘겨주는거니까 json은 없어도 될 듯, produces = "application/json;charset=utf-8"
	public String boardVariationSelect() {
		String result = service.selectVariationBoard();
		return result;
	}

	
	/* 회원관리 페이지*/
	
	@RequestMapping(value="/allMemberList.do")
	public String allMemberSelect(int reqPage, Model model) {
		AdminMemberPageData ampd = service.selectAllMemberList(reqPage);
		model.addAttribute("list",ampd.getList());
		model.addAttribute("pageNavi",ampd.getPageNavi());
		return "redirect:/";
	}
	
	
	// 개별 회원 등급 변경
	@ResponseBody
	@RequestMapping(value="/ajaxChangeMemberGrade.do")
	public String changeMemberGrade(Member m) {
		int result = service.updateMemberGrade(m);
		if(result > 0) {
			return "ok"; 
		}
			return "again";
	}
	
	// 회원 등급 변경 일괄 적용
	@ResponseBody
	@RequestMapping(value="/ajaxChangeCheckedMemberGrade.do")
	public String changeCheckedMemberGrade() {
		return null;
	}
	
	
	// 검색기능
	@ResponseBody
	@RequestMapping(value="/ajaxAdminSearchMember.do", produces = "application/json;charset=utf-8")
	public String adminSearchMember(Member m) {
		ArrayList<Member> list = service.selectSearchMember(m);
		Gson gson = new Gson();
		String result = gson.toJson(list);
		return result;
		
	}
	
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
	
	
	
	/* 상품 등록 */
	
	
	
	
	
	
	
	
	/* 상품 등록 현황 */
	
	//상품 전체 등록 현황
	@RequestMapping(value="/allProductList.do")
	public String productListSelect(Model model, int reqPage) {
		AdminProductPageData appd = service.selectProductList(reqPage);
		model.addAttribute("productList",appd.getList());
		model.addAttribute("pageNavi",appd.getPageNavi());
		return "redirect:/";
		
	}
	
	//상품 마감 업데이트
	@ResponseBody
	@RequestMapping(value="/ajaxProductChangeStatus.do")
	public String productChangeStatus(Product p) {
		int result = service.updateProductStatus(p);
		if(result > 0) {
			return "ok"; 
		}
			return "again";
		
	}
	
	//회원 검색
	@ResponseBody
	@RequestMapping(value="/ajaxAdminSearchProduct.do", produces = "application/json;charset=utf-8")
	public String adminSearchProduct(Product p) {
		ArrayList<Product> list = service.selectSearchProduct(p);
		Gson gson = new Gson();
		String result = gson.toJson(list);
		return result;
	}
	
	//일괄선택
	
	
	/* 배송 관리 현황*/
	
	/*
	 * //배송관리 list
	 * 
	 * @RequestMapping(value="/allDeliveryList.do") public String
	 * allDeliveryList(int reqPage, Model model) { 
	 * AdminOrderPageData aopd = service.selectAllOrderList(reqPage);
	 * model.addAttribute("orderList",aopd.getList());
	 * model.addAttribute("pageNavi",aopd.getPageNavi()); return "redirect:/"; }
	 */
	
	
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
	
	/*
	 * // 배송 검색
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="/ajaxAdminSearchDelivery.do", produces =
	 * "application/json;charset=utf-8") public String adminSearchDelivery(Order o)
	 * { ArrayList<Order> list = service.selectSearchDelivery(o); Gson gson = new
	 * Gson(); String result = gson.toJson(list); return result; }
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
	
	// 여기여기 붙어라 참여인원 순으로 list 정렬
	@RequestMapping(value="/allBoardList.do")
	public String allBoardList(int reqPage, Model model) {
		AdminBoardPageData abpd = service.selectAllBoardList(reqPage);
		model.addAttribute("orderList",abpd.getList());
		model.addAttribute("pageNavi",abpd.getPageNavi());
		return "redirect:/";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
