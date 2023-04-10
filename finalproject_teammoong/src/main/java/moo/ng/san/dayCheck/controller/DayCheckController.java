package moo.ng.san.dayCheck.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@ResponseBody
	@RequestMapping(value="/dayCheck.do")
	public String dayCheck(int memberNo) {
		
		ArrayList<DayCheck> dc = service.selectDayCheck(memberNo);
		if(dc.size() == 0) {
			int result = service.insertDayCheck(memberNo);
			if(result>0) {
				return "success";
			}else {
				return "error";
			}
		}else {
			DayCheck checkDate = dc.get(0);
			LocalDate today = LocalDate.now();
			String todayAsString = today.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			if(!checkDate.getCheckDate().equals(todayAsString)){
				int result = service.insertDayCheck(memberNo);
				if(result>0) {
					return "success";
				}else {
					return "error";
				}
			}else {
				return "error";
			}	
		}
	}
}
