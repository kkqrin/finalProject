package moo.ng.san.pay.model.dao;



import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import moo.ng.san.dayCheck.model.vo.Point;
import moo.ng.san.order.model.vo.Order;
import moo.ng.san.pay.model.vo.OrderDetail;

@Repository
public class PayDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertOrder(Order order) {
		int result = sqlSession.insert("order.insertOrder",order);
				
		return result;
	}

	public int insertOrderDetail(OrderDetail orderDetail) {
	    int result = sqlSession.insert("orderDetail.insertOrderDetail", orderDetail);
	    return result;
	}

	public int selectProductCost(int productNo) {
		int productCost = sqlSession.selectOne("product.selectProductCost",productNo);
		return productCost;
	}

	public int insertMinusPointEa(Point point) {
		int result = sqlSession.insert("point.insertMinusPoint",point);
		return result;
	}

	public int insertPlusPointEa(Point point) {
		int result = sqlSession.insert("point.insertPlusPoint",point);
		return result;
	}

	public int updateUseCoupon(int issueNo) {
		int result = sqlSession.update("issueCoupon.updateUseCoupon",issueNo);
		return result;
	}

	public ArrayList<OrderDetail> selectOrderDetail(int reOrderNo) {
		List list = sqlSession.selectList("orderDetail.selectOrderDetail",reOrderNo);
		return (ArrayList<OrderDetail>) list;
	}

	




}
