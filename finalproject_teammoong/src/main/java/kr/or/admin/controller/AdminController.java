package kr.or.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.admin.model.service.AdminService;
import com.google.gson.Gson;

@Controller
public class AdminController {

	@Autowired
	private AdminService service;
	
	@RequestMapping(value="/admin.do")
	public String admin() {
		return "admin/admin";
	}
	
	// count
	
	@ResponseBody
	@RequestMapping(value="/ajaxAllMemberCount.do")//, produces = "application/json;charset=utf-8"
	public String memberAllCountSelect() {
		String result = service.selectAllMemberCount();
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/ajaxAllOrderCount.do")//, produces = "application/json;charset=utf-8")
	public String orderAllCountSelect() {
		String result = service.selectAllOrderCount();
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/ajaxAllBoardCount.do")//, produces="application/json;charset=utf-8")
	public String boardAllCountSelect() {
		String result = service.selectAllBoardCount();
		return result;
	}
	
	//
	@ResponseBody
	@RequestMapping(value="/ajaxAllSalesCount.do")//, produces="application/json;charset=utf-8")
	public String salesAllCountSelect() {
		String result = service.selectAllSalesCount();
		return result;
	}

	
	@ResponseBody
	@RequestMapping(value="/ajaxBestSalesCount.do")//, produces="application/json;charset=utf-8")
	public String bestSalesCountSelect() {
		String result = service.selectBestSalesCount();
		return result;
	}
	
	@ResponseBody // 미완성
	@RequestMapping(value="/ajaxEventCount.do")//, produces="application/json;charset=utf-8")
	public String bestEventSelect() {
		String result = service.selectEventCount();
		return result;
	}
		
		
	
	// 증감
	
	@ResponseBody
	@RequestMapping(value = "/ajaxVaritaionMember.do")// 숫자 하나 넘겨주는거니까 json은 없어도 될 듯, produces = "application/json;charset=utf-8"
	public String memberVariationSelect() {
		String result = service.selectVariationMember();
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/ajaxVariationOrder.do")// 숫자 하나 넘겨주는거니까 json은 없어도 될 듯, produces = "application/json;charset=utf-8"
	public String orderVariationSelect() {
		String result = service.selectVariationOrder();
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/ajaxVariationBoard.do")// 숫자 하나 넘겨주는거니까 json은 없어도 될 듯, produces = "application/json;charset=utf-8"
	public String boardVariationSelect() {
		String result = service.selectVariationBoard();
		return result;
	}

	@RequestMapping(value="/allMemberSelect.do")
	public String allMemberSelect(Model model) {
		ArrayList<Member> list = service.selectAllMember();
		
	}
	
	
	
	
	
}
