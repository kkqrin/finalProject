package moo.ng.san.order.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import moo.ng.san.coupon.model.vo.IssueCoupon;
import moo.ng.san.order.model.dao.OrderDao;
import moo.ng.san.order.model.vo.Order;

@Service
public class OrderService {
	@Autowired
	private OrderDao dao;

	public ArrayList<IssueCoupon> selectMemberCouponList(int memberNo) {
		
		return dao.selectMemberCouponList(memberNo);
	}

	public int selectMemberCouponCount(int memberNo) {
		
		return dao.selectMemberCouponCount(memberNo);
	}

	public ArrayList<Order> selectOrderProductList(int[] productNo, int[] optionNo) {
		
		ArrayList<Order> list = new ArrayList<Order>();
		
		
		for(int i=0;i<productNo.length;i++) {
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("productNo", productNo[i]);
			map.put("optionNo", optionNo[i]);
			
			Order o = dao.selectOrderProductList(map);
			
			list.add(o);
		}
		
//		System.out.println("service : "+list);
		return list;
	}
}
