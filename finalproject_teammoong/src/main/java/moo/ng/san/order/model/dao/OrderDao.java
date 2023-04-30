package moo.ng.san.order.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import moo.ng.san.coupon.model.vo.IssueCoupon;
import moo.ng.san.dayCheck.model.vo.Point;
import moo.ng.san.order.model.vo.Order;
import moo.ng.san.pay.model.vo.OrderDetail;
import moo.ng.san.product.model.vo.Product;

@Repository
public class OrderDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<IssueCoupon> selectMemberCouponList(int memberNo) {
		List list = sqlSession.selectList("order.selectMemberCouponList", memberNo);
		
		return (ArrayList<IssueCoupon>) list;
	}

	public int selectMemberCouponCount(int memberNo) {
		int couponCount = sqlSession.selectOne("order.selectMemberCouponCount", memberNo);
		
		return couponCount;
	}

	public Order selectOrderProductList(HashMap<String, Object> map) {
		Order o = sqlSession.selectOne("order.selectOrderProductList", map);
		
		return o;
	}
	
	public Order selectMoongsanOrderProductList(HashMap<String, Object> map) {
		Order o = sqlSession.selectOne("order.selectMoongsanOrderProductList", map);
		
		return o;
	}

	public int insertOrder(HashMap<String, Object> map) {
		int result = sqlSession.insert("order.insertOrder", map);
		
		return result;
	}

	public int selectMaxOrderNo() {
		int orderNo = sqlSession.selectOne("order.selectMaxOrderNo");
		
		return orderNo;
	}

	public int insertOrderDetail(HashMap<String, Object> map) {
		int result = sqlSession.insert("orderDetail.insertOrderDetail", map);
		
		return result;
	}

	public int selectBasketNo(HashMap<String, Object> map) {
		int basketNo = sqlSession.selectOne("order.selectBasketNo", map);
		
		return basketNo;
	}

	public int insertMinusPointEa(Point point) {
		int result = sqlSession.insert("point.insertMinusPoint",point);
		return result;
	}

	public int insertPlusPointEa(Point point) {
		int result = sqlSession.insert("point.insertPlusPoint",point);
		return result;
	}

	public int updateCoupon(int issueNo) {
		int result = sqlSession.update("issueCoupon.updateUseCoupon",issueNo);
		return result;
	}

	public ArrayList<OrderDetail> selectOrderDetail(int orderNo) {
		List list = sqlSession.selectList("orderDetail.selectOrderDetail",orderNo);
		return (ArrayList<OrderDetail>) list;
	}

	public String selectProduct(int productNo) {
		String productName = sqlSession.selectOne("product.selectProductName",productNo);
		return productName;
	}
	
	public ArrayList<Order> selectMyOrderList(int memberNo) {
		List list = sqlSession.selectList("order.selectMyOrderList", memberNo);
		
		return (ArrayList<Order>)list;
	}

	public Order selectMyOrderDetail(int orderNo) {
		Order o = sqlSession.selectOne("order.selectMyOrderDetail", orderNo);
		
		return o;
	}
	
	public ArrayList<Order> selectMyOrderProductList(int orderNo) {
		List list = sqlSession.selectList("order.selectMyOrderProductList", orderNo);
		
		return (ArrayList<Order>)list;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	///////////// 진배님
	public Order selectOrder(int orderNo) {
		Order order = sqlSession.selectOne("order.selectOrder",orderNo);
		return order;
	}



	public int cancelOrder(int orderNo) {
		int result = sqlSession.update("order.cancelOrder",orderNo);
		return result;
	}

	public int cancelCoupon(int issueNo) {
		int result = sqlSession.update("issueCoupon.cancelCoupon",issueNo);
		return result;
	}

	public int selectPlusPoint(int orderNo) {
		int plusPoint = sqlSession.selectOne("point.selectPlusPoint",orderNo);
		return plusPoint;
	}

	public int selectMinusPoint(int orderNo) {
		int minusPoint = sqlSession.selectOne("point.selectMinusPoint",orderNo);
		return minusPoint;
	}

	public int insertRetunPointEa(Point point) {
		int result = sqlSession.insert("point.insertReturnPointEa", point);
		return result;
	}

	public int insertPaybackPointEa(Point point) {
		int result = sqlSession.insert("point.insertPaybackPointEa", point);
		return result;
	}

	public int selectDoneCouponPrice(int orderNo) {
		int couponPrice = sqlSession.selectOne("order.selectDoneCouponPrice", orderNo);
		return couponPrice;
	}

	

}
