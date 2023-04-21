package moo.ng.san.pay.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import moo.ng.san.coupon.model.vo.IssueCoupon;
import moo.ng.san.dayCheck.model.vo.Point;
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

	public Pay insertpay(int issueNo, int memberNo, Order order, int plusPointEa, int minusPointEa, OrderDetail orderDetail,
			Product product, Option option) {
		int productNo = option.getProductNo();
		Pay pay = new Pay();
		pay.setMemberNo(memberNo);
		pay.setProductNo(productNo);
		int productCost = dao.selectProductCost(productNo);
		int result = dao.insertPay(pay);
			if(result > 0) {
				order.setMemberNo(memberNo);
				order.setProductNo(productNo);
				order.setPayNo(pay.getPayNo());
				int result2 = dao.insertOrder(order);
				if(result2>0) {
					orderDetail.setOrderDetailNo(order.getOrderNo());
					orderDetail.setOptionInfoNo(option.getOptionInfoNo());
					orderDetail.setOrderDetailPrice(productCost);
					int result3 = dao.insertOrderDetail(orderDetail);
					Point point = new Point();
					point.setMemberNo(memberNo);
					if(result3>0) {
						if(minusPointEa != 0) {							
								point.setPointEa(minusPointEa);
						int result4 = dao.insertMinusPointEa(point);
						}
						point.setPointEa(plusPointEa);
						int result5 = dao.insertPlusPointEa(point);
						if(result5>0) {
							if(issueNo != 0) {								
								int result6 = dao.updateUseCoupon(issueNo);
							}
						}
					}
				}
			}
			Pay p = new Pay();
			p = dao.selectPay(pay.getPayNo());
		return p;
	}

}
