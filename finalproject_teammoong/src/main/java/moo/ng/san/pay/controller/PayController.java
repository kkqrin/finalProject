package moo.ng.san.pay.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String insertPay(int issueNo,int memberNo, Order order, int plusPointEa, int minusPointEa, OrderDetail orderDetail, Product product, Option option, Model model) {
		Pay pay = service.insertpay(issueNo, memberNo, order, plusPointEa, minusPointEa, orderDetail, product, option);
			System.out.println(pay);
		String productName = service.selectProductName(orderDetail.getProductNo());
			model.addAttribute("pay", pay);
			model.addAttribute("productName",productName);
		return "/order/payComplite";
	}
}
