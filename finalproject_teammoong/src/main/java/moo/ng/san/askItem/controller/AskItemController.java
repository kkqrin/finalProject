package moo.ng.san.askItem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import moo.ng.san.askItem.model.service.AskItemService;

@Controller
public class AskItemController {
	@Autowired
	private AskItemService service;
	
}
