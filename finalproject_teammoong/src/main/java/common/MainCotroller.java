package common;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import moo.ng.san.category.model.service.CategoryService;
import moo.ng.san.category.model.vo.Category;
import moo.ng.san.category.model.vo.DetailCategory;

@Controller
public class MainCotroller {

	@Autowired
	private CategoryService service;
	
	@RequestMapping(value = "/main.do")
	public String mainPage(Model model) {
		ArrayList<Category> category = service.selectAllCategory();
		ArrayList<DetailCategory> detailCategory = service.selectAllDetailCategory();
		
		model.addAttribute("c", category);
		model.addAttribute("d", detailCategory);
		return "common/main";
	}
}
