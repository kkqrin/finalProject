package moo.ng.san.basket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import moo.ng.san.basket.model.service.BasketService;

@Controller
public class BasketController {
	@Autowired
	private BasketService service;
	
	@RequestMapping(value="/basketPage.do")
	public String basketPage() {
		return "basket/basketPage";
	}
	
}
