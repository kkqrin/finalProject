package moo.ng.san.gonggu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import moo.ng.san.gonggu.model.service.GongguService;

@Controller
public class GongguController {
	@Autowired
	private GongguService service;
	
	@RequestMapping(value="/gongguOrder.do")
	public String gongguOrderPage(int productNo) {
		return "order/moongsanOrder";
	}
	
}
