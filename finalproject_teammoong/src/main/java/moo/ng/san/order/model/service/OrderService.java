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

	public ArrayList<Order> selectOrderProductList(int memberNo, int[] productNo, int[] optionNo, int page) {
		
		ArrayList<Order> list = new ArrayList<Order>();
		
		
		for(int i=0;i<productNo.length;i++) {
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("productNo", productNo[i]);
			map.put("optionNo", optionNo[i]);
			map.put("memberNo", memberNo);
			map.put("page", page);
			
			Order o = dao.selectOrderProductList(map);
			
			list.add(o);
		}
		
//		System.out.println("service : "+list);
		return list;
	}
	
	public ArrayList<Order> selectMoongsanOrderProductList(int[] productNo, int[] optionNo) {
		
		ArrayList<Order> list = new ArrayList<Order>();
		
		
		for(int i=0;i<productNo.length;i++) {
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("productNo", productNo[i]);
			map.put("optionNo", optionNo[i]);
			
			Order o = dao.selectMoongsanOrderProductList(map);
			
			list.add(o);
		}
		
//		System.out.println("service : "+list);
		return list;
	}

	public int insertOrder(int memberNo, int totalPrice, String deliReceiver, String deliPhone, String deliAddr1, String deliRequest, int productNo) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("totalPrice", totalPrice);
		map.put("deliReceiver", deliReceiver);
		map.put("deliPhone", deliPhone);
		map.put("deliAddr1", deliAddr1);
		map.put("productNo", productNo);
		map.put("deliRequest", deliRequest);
		
		
		return dao.insertOrder(map);
	}

	public int selectMaxOrderNo() {
		return dao.selectMaxOrderNo();
	}

	public int insertOrderDetail(int orderNo, int[] productNo, int[] optionInfoNo, int[] orderDetailCnt,
			int[] orderDetailCost, int[] orderSalePrice) {
		
		int result = 0;
		
		for(int i=0;i<productNo.length;i++) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("orderNo", orderNo);
			map.put("productNo", productNo[i]);
			map.put("optionInfoNo", optionInfoNo[i]);
			map.put("orderDetailCnt", orderDetailCnt[i]);
			map.put("orderDetailCost", orderDetailCost[i]);
			map.put("orderSalePrice", orderSalePrice[i]);
			System.out.println("optionInfoNo : "+optionInfoNo[i]);
			result = dao.insertOrderDetail(map);
		}
		
		
		return result;
	}
}
