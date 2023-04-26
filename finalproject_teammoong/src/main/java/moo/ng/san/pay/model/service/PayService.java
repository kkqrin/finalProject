package moo.ng.san.pay.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import moo.ng.san.coupon.model.vo.IssueCoupon;
import moo.ng.san.dayCheck.model.vo.Point;
import moo.ng.san.order.model.vo.Order;
import moo.ng.san.pay.model.dao.PayDao;
import moo.ng.san.pay.model.vo.OrderDetail;
import moo.ng.san.product.model.vo.Option;

@Service
public class PayService {
	@Autowired
	private PayDao dao;

	public Order insertpay(int memberNo, int issueNo, int minusPointEa, int plusPointEa, Order order,
			ArrayList<OrderDetail> orderDetailList){
		String deliAddr1 = order.getDeliAddr1();
		String deliAddr2 = order.getDeliAddr2();
		String deliAddr = deliAddr1+deliAddr2;
		System.out.println(deliAddr);
		order.setDeliAddr(deliAddr);
		
		int result = dao.insertOrder(order);
		System.out.println(result);
		int result2 = 0;
		if(result > 0) {
			for(OrderDetail orderDetail: orderDetailList) {
				System.out.println(order.getOrderNo());
				orderDetail.setOrderNo(order.getOrderNo());
				
				result2 += dao.insertOrderDetail(orderDetail);
			}
			if(result2 == orderDetailList.size()) {
				Point point = new Point();
				point.setMemberNo(memberNo);
				if(minusPointEa != 0) {							
					point.setPointEa(minusPointEa);
					int result3 = dao.insertMinusPointEa(point);
				}
				point.setPointEa(plusPointEa);
				int result4 = dao.insertPlusPointEa(point);
				if(result4>0) {
					if(issueNo != 0) {								
						int result5 = dao.updateUseCoupon(issueNo);	
					}
				}
			}
			
		}
		return	order;
	}

	public String selectProductName(int productNo) {
		String productName = dao.selectProductName(productNo);
		return productName;
	}



}
