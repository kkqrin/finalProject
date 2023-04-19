package moo.ng.san.pay.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import moo.ng.san.pay.model.service.PayService;

@Controller
public class PayController {
	@Autowired
	private PayService service;

}
