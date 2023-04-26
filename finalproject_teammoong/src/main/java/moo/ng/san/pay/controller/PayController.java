package moo.ng.san.pay.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import moo.ng.san.order.model.vo.Order;
import moo.ng.san.pay.model.service.PayService;
import moo.ng.san.pay.model.vo.OrderDetail;

@Controller
public class PayController {
	@Autowired
	private PayService service;
	
	@RequestMapping(value="/insertPay.do")
	public String insertPay(int memberNo, int issueNo, int minusPointEa, int plusPointEa, Order order, int[] productNo, int[] optionInfoNo, int[]orderDetailCnt, int[]orderDetailCost, int[] orderSalePrice, Model model) {
		ArrayList<OrderDetail> orderDetailList = new ArrayList<OrderDetail>();
		int length = productNo.length;
		for(int i=0;i<length;i++ ) {
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setOptionInfoNo(optionInfoNo[i]);
			orderDetail.setOrderDetailCnt(orderDetailCnt[i]);
			orderDetail.setOrderDetailCost(orderDetailCost[i]);
			orderDetail.setOrderSalePrice(orderSalePrice[i]);
			orderDetail.setProductNo(productNo[i]);
			orderDetailList.add(orderDetail);
		}
		Order reOrder = service.insertpay(memberNo, issueNo, minusPointEa, plusPointEa, order, orderDetailList);
//		int reOrderNo = reOrder.getOrderNo();
//		ArrayList<OrderDetail> reOrderDetail = service.selectOrderDetail(reOrderNo);
//		ArrayList<Order> productReName = new ArrayList<Order>();
//		
//		String productName = service.selectProductName(order.getProductNo());
//		model.addAttribute("order", reOrder);
//		model.addAttribute("reOrderDetail",reOrderDetail);
//		model.addAttribute("productName",productName);
		return "/order/payComplite";
	}
}
