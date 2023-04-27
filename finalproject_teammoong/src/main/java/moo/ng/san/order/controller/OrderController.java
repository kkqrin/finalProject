package moo.ng.san.order.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import moo.ng.san.basket.model.vo.Basket;
import moo.ng.san.coupon.model.service.CouponService;
import moo.ng.san.coupon.model.vo.IssueCoupon;
import moo.ng.san.dayCheck.model.vo.Point;
import moo.ng.san.gonggu.model.vo.Gonggu;
import moo.ng.san.member.model.service.MemberService;
import moo.ng.san.member.model.vo.Member;
import moo.ng.san.order.model.service.OrderService;
import moo.ng.san.order.model.vo.Order;
import moo.ng.san.product.model.service.ProductService;
import moo.ng.san.product.model.vo.Product;

@Controller
public class OrderController {
	@Autowired
	private OrderService service;
	@Autowired
	private MemberService memberService;
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value="/orderSheet.do")
	public String orderSheet(int[] productNo, int[] optionNo, int page, @SessionAttribute(required=false) Member m, Model model) {
		// 세션에서 가져옴
		int memberNo = m.getMemberNo();
		
		model.addAttribute("page", page);
		
		// 뷰 page : 상품 하나의 수량들 , 장바구니 : 0 
		// 구매하려는 상품 조회 (배열)
		ArrayList<Order> orderProductList = service.selectOrderProductList(m.getMemberNo(), productNo, optionNo, page);
		model.addAttribute("orderProductList", orderProductList);
		
//		System.out.println(orderProductList);
		
		// 보유 쿠폰 개수
		int couponCount = service.selectMemberCouponCount(memberNo);
		model.addAttribute("couponCount", couponCount);
		// 보유 쿠폰 리스트
		ArrayList<IssueCoupon> couponList = service.selectMemberCouponList(memberNo);
		model.addAttribute("couponList",couponList);
		
		// 현재 적립금 조회
		Point point = memberService.selectTotalPoint(memberNo);
		model.addAttribute("point", point);
		
		return "order/orderSheet";
	}
	
	@RequestMapping(value="/moongsanOrder.do")
	public String moongsanOrder(int[] productNo, int[] optionNo, @SessionAttribute(required=false) Member m, Model model, String btnDivision, Gonggu g) {
			
			// 세션에서 가져옴
			int memberNo = m.getMemberNo();
			
			// 구매하려는 상품 조회 (배열)
			ArrayList<Order> orderProductList = service.selectMoongsanOrderProductList(productNo, optionNo);
			model.addAttribute("orderProductList", orderProductList);
			
//		System.out.println(orderProductList);
			
			// 보유 쿠폰 개수
			int couponCount = service.selectMemberCouponCount(memberNo);
			model.addAttribute("couponCount", couponCount);
			// 보유 쿠폰 리스트
			ArrayList<IssueCoupon> couponList = service.selectMemberCouponList(memberNo);
			model.addAttribute("couponList",couponList);
			
			// 현재 적립금 조회
			Point point = memberService.selectTotalPoint(memberNo);
			model.addAttribute("point", point);
			
			//버튼구분 보내기
			model.addAttribute("btnDivision",btnDivision);
			model.addAttribute("g",g);
			
			return "order/moongsanOrder";
			
	}

	@RequestMapping(value="/myOrderList.do")
	public String myOrderList() {
		
		return "order/myOrderList";
	}
	
	@RequestMapping(value="/myOrderView.do")
	public String myOrderView() {
		
		return "order/myOrderView";
	}
	
	
//	주문하기
	@ResponseBody
	@RequestMapping(value="/order.do")
	public String order(@SessionAttribute(required=false) Member m, 
			int totalPrice, String deliReceiver, String deliPhone, String deliAddr1, String deliAddr2, String deliRequest
			, int[] productNo, int[] optionInfoNo, int[] orderDetailCnt, int[] orderDetailCost, int[] orderSalePrice, int orderPrice, Model model) {
		
//		order table
//		System.out.println("order.do의 totalPrice : " + totalPrice );
//		System.out.println("order.do의 deliveryReceiver : " + deliReceiver );
//		System.out.println("order.do의 deliPhone : " + deliPhone );
//		System.out.println("order.do의 deliAddr1 : " + deliAddr1 );
//		System.out.println("order.do의 deliAddr2 : " + deliAddr2 );
		
		// 오더 테이블엔 상품 번호 필요 없을 듯
		int result = service.insertOrder(m.getMemberNo(), totalPrice, deliReceiver, deliPhone, deliAddr1, deliRequest, orderPrice);
		
		if(result>0) {
			System.out.println("order insert success");
			
			// order detail
			// 최근 insert된 orderNo
			int orderNo = service.selectMaxOrderNo();
			
			System.out.println("orderNo : "+orderNo);
			
			// 주문내역에 금액관련 두개 있어야할 듯 1. 실 결제금액 -> 적립금/쿠폰 금액 들어간 totalPrice 2. 주문서당 총 상품금액 (할인가) OrderPrice
			result = service.insertOrderDetail(orderNo, productNo, optionInfoNo, orderDetailCnt, orderDetailCost, orderSalePrice);
			
			if(result>0) {
				System.out.println("order detail tbl insert success");
				
				return "order success";
			}
			
//			result = service.insertOrderDetail()
			
		}
		
		return "fail";
	}
}
