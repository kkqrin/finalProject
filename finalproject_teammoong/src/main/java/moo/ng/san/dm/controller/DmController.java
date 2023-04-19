package moo.ng.san.dm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DmController {

	@RequestMapping(value = "/receiveDmList.do")
	public String myPageDmReceive() {
		return "dm/receiveDmList";
	}
	
	@RequestMapping(value = "/sendDmList.do")
	public String myPageDmSend() {
		return "dm/sendDmList";
	}
	
	@RequestMapping(value = "/dmWriteFrm.do")
	public String myPageDmWriteFrm() {
		return "dm/dmWriteFrm";
	}
	
}
