package moo.ng.san.dayCheck.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import moo.ng.san.dayCheck.service.DayCheckService;

@Controller
public class DayCheckController {
	@Autowired
	private DayCheckService service;
	
	@RequestMapping(value="/dayCheckMain.do")
	public String dayCheckMain() {
		return "dayCheck/dayCheckMain";
	}

}
