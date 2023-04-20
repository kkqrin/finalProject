package moo.ng.san.pay.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import moo.ng.san.dayCheck.model.vo.Point;
import moo.ng.san.member.model.vo.Member;
import moo.ng.san.order.model.vo.Order;
import moo.ng.san.pay.model.service.PayService;
import moo.ng.san.pay.model.vo.OrderDetail;
import moo.ng.san.pay.model.vo.Pay;
import moo.ng.san.product.model.vo.Option;
import moo.ng.san.product.model.vo.Product;

@Controller
public class PayController {
	@Autowired
	private PayService service;
	
	@RequestMapping(value="/insertPay.do")
	public String insertPay(int orderDetailCnt, int memberNo, Order order, int plusPointEa, int minusPointEa, OrderDetail orderDetail, Product product, Option option) {
		System.out.println(orderDetail);
		int result = service.insertpay(orderDetailCnt, memberNo, order, plusPointEa, minusPointEa, orderDetail, product, option);
			
			
		return "/order/payComplite";
	}
}
