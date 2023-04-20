package moo.ng.san.pay.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import moo.ng.san.order.model.vo.Order;
import moo.ng.san.pay.model.dao.PayDao;
import moo.ng.san.pay.model.vo.OrderDetail;
import moo.ng.san.pay.model.vo.Pay;
import moo.ng.san.product.model.vo.Option;
import moo.ng.san.product.model.vo.Product;

@Service
public class PayService {
	@Autowired
	private PayDao dao;

	public int insertpay(int orderDetailCnt, int memberNo, Order order, int plusPointEa, int minusPointEa, OrderDetail orderDetail,
			Product product, Option option) {
		int productNo = option.getProductNo();
		Pay pay = new Pay();
		pay.setMemberNo(memberNo);
		pay.setProductNo(productNo);
		int result = dao.insertPay(pay);
			if(result > 0) {
				order.setMemberNo(memberNo);
				order.setProductNo(productNo);
				order.setPayNo(pay.getPayNo());
				int result2 = dao.insertOrder(order);
				if(result2>0) {
					orderDetail.setOrderDetailNo(order.getOrderNo());
					orderDetail.setProductNo(productNo);
					orderDetail.setOptionInfoNo(option.getOptionInfoNo());
					orderDetail.setOrderDetailCnt(orderDetailCnt);
					orderDetail.setOrderDetailPrice(order.getProductPrice());
					int result3 = dao.insertOrderDetail(orderDetail);
					if(result3>0) {
						
					}
				}
			}
		return result;
	}

}
