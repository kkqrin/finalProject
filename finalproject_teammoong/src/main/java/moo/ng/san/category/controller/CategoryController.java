package moo.ng.san.category.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import moo.ng.san.category.model.service.CategoryService;
import moo.ng.san.category.model.vo.Category;
import moo.ng.san.category.model.vo.DetailCategory;

@Controller
public class CategoryController {
	@Autowired
	private CategoryService service;
	
	
	
	@ResponseBody
	@RequestMapping(value="/selectAllCategory.do", method=RequestMethod.POST, produces = "application/json; charset=utf8")
	public ArrayList<Category> selectAllCategory(){
		ArrayList<Category> list = service.selectAllCategory();
		return list;
	}
	@ResponseBody
	@RequestMapping(value="/selectDetailCategory.do", method=RequestMethod.POST, produces = "application/json; charset=utf8")
	public ArrayList<DetailCategory> selectDetailCategory(int categoryNo){
		ArrayList<DetailCategory> list = service.selectDetailCategory(categoryNo);
		return list;
	}
}
