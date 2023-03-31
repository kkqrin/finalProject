package moo.ng.san.category.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import moo.ng.san.category.model.service.CategoryService;

@Controller
public class CategoryController {
	@Autowired
	private CategoryService service;
}
