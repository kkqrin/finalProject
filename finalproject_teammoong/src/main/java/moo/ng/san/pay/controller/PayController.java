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
import moo.ng.san.product.model.vo.Option;
import moo.ng.san.product.model.vo.Product;

@Controller
public class PayController {
	@Autowired
	private PayService service;
	
	@RequestMapping(value="/insertPay.do")
	public String insertPay( Model model) {
		//Order order = service.insertpay();
			//System.out.println(order);
		//String productName = service.selectProductName(orderDetail.getProductNo());
			//model.addAttribute("order", order);
			//model.addAttribute("productName",productName);
		return "/order/payComplite";
	}
}
