package moo.ng.san.dm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DmController {

	@RequestMapping(value = "/myPageDmReceive.do")
	public String myPageDmReceive() {
		return "dm/myPageDmReceive";
	}
	
	@RequestMapping(value = "/myPageDmSend.do")
	public String myPageDmSend() {
		return "dm/myPageDmSend";
	}
	
	@RequestMapping(value = "/myPageDmWriteFrm.do")
	public String myPageDmWriteFrm() {
		return "dm/myPageDmWriteFrm";
	}
	
}
