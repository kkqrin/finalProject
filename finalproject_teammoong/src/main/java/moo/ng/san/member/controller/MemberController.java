package moo.ng.san.member.controller;

import org.springframework.web.bind.annotation.RequestMapping;

public class MemberController {

	@RequestMapping(value = "/msgTest.do")
	public String msgTest() {
		return "common/msg";
	}
	
}
