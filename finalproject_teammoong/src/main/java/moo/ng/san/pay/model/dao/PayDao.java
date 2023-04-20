package moo.ng.san.pay.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import moo.ng.san.order.model.vo.Order;
import moo.ng.san.pay.model.vo.OrderDetail;
import moo.ng.san.pay.model.vo.Pay;

@Repository
public class PayDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertPay(Pay pay) {
		int result = sqlSession.insert("pay.insertPay",pay);
		return result;
	}

	public int insertOrder(Order order) {
		int result = sqlSession.insert("order.insertOrder",order);
				
		return result;
	}

	public int insertOrderDetail(OrderDetail orderDetail) {
		int result = sqlSession.insert("orderDetail.insertOrderDetail", orderDetail);
		return result;
	}

}
