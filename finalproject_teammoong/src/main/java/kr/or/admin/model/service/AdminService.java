package kr.or.admin.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.admin.controller.Board;
import kr.or.admin.controller.Order;
import kr.or.admin.model.dao.AdminDao;

@Service
public class AdminService {
	
	@Autowired
	private AdminDao dao;

	public String selectAllMemberCount() {
		String result = dao.selectAllMemberCount();
		return result;
	}

	public String selectAllOrderCount() {
		String result = dao.selectAllOrderCount();
		return result;
	}

	public String selectAllBoardCount() {
		String result = dao.selectAllBoardCount();
		return result;
	}
	
	public String selectAllSalesCount() {
		String result = dao.selectAllSalesCount();
		return result;
	}
	
	public String selectBestSalesCount() {
		String result = dao.selectBestSalesCount();
		return result;
	}
	
	public String selectEventCount() {
		String result = dao.selectEventCount();
		return result;
	}
	
	
	
	
	
	public String selectVariationMember() {
		String result = dao.selectVariationMember();
		
		return result;
	}

	public String selectVariationOrder() {
		String result = dao.selectVariationOrder();
		
		return result;
	}

	public String selectVariationBoard() {
	String result = dao.selectVariationBoard();
		
		return result;
	}
	

}
