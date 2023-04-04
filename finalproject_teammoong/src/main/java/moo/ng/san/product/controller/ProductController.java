package moo.ng.san.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import moo.ng.san.product.model.service.ProductService;

@Controller
public class ProductController {
	@Autowired
	private ProductService service;
	
	
	
	
	
	
	
	
//	규린작업공간 20~100
	
	@RequestMapping(value="/photoReviewMore.do")
	public String photoReviewMore() {
		return "product/photoReviewMore";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	명훈작업공간 120~200

	@RequestMapping(value="/insertProductFrm.do")
	public String insertProductFrm() {
		return "product/insertProductFrm";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
