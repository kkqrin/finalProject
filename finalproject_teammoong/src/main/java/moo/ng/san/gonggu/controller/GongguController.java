package moo.ng.san.gonggu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import moo.ng.san.dayCheck.model.vo.Point;
import moo.ng.san.gonggu.model.service.GongguService;
import moo.ng.san.gonggu.model.vo.Gonggu;
import moo.ng.san.gonggu.model.vo.GongguPay;

@Controller
public class GongguController {
	@Autowired
	private GongguService service;
	
	@RequestMapping(value="/gongguOrder.do")
	public String gongguOrderPage(Gonggu g, Point p, GongguPay gp) {
		System.out.println("GongguController에서 g값 :"+g);
		System.out.println("GongguController에서 point값 :"+p);
		System.out.println("GongguController에서 gp값 : "+gp);
		int result = service.insertGonggu(g,p, gp);
		return "redirect:/";
	}
	
}
