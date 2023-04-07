package moo.ng.san.dayCheck.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import moo.ng.san.dayCheck.service.DayCheckService;
import moo.ng.san.dayCheck.vo.DayCheck;
import moo.ng.san.member.model.vo.Member;

@Controller
public class DayCheckController {
	@Autowired
	private DayCheckService service;
	
	@RequestMapping(value="/dayCheckMain.do")
	public String dayCheckMain() {
		return "dayCheck/dayCheckMain";
	}
	
	@RequestMapping(value="/dayCheck.do")
	public String dayCheck(Model model, Member memberNo) {
		DayCheck dc = service.selectDayCheck(memberNo);
		if (dc.getCheckDate() != dc.getToday() || dc == null) {
			int result = service.insertDayCheck(dc);
		}else {
			return "dayCheck/dayCheckMain";
		}
	}
}
