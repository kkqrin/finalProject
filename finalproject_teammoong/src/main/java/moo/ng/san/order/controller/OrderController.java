package moo.ng.san.order.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import moo.ng.san.coupon.model.service.CouponService;
import moo.ng.san.coupon.model.vo.IssueCoupon;
import moo.ng.san.order.model.service.OrderService;

@Controller
public class OrderController {
	@Autowired
	private OrderService service;
//	@Autowired
//	private CouponService couponService;
	
	@RequestMapping(value="/orderSheet.do")
	public String orderSheet(int productNo, int memberNo, Model model) {
		
		// 보유 쿠폰 조회
		// 보유 쿠폰 개수
		int couponCount = service.selectMemberCouponCount(memberNo);
		model.addAttribute("couponCount", couponCount);
		// 보유 쿠폰 리스트
		ArrayList<IssueCoupon> couponList = service.selectMemberCouponList(memberNo);
		model.addAttribute("couponList",couponList);
		
		
		// 현재 적립금 조회
		
		return "order/temporOrderSheet";
	}
}
