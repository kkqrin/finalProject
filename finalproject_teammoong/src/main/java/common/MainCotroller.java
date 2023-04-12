package common;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.xml.ws.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import moo.ng.san.category.model.service.CategoryService;
import moo.ng.san.category.model.vo.Category;
import moo.ng.san.category.model.vo.DetailCategory;
import moo.ng.san.category.model.vo.ForHeaderCategory;

@Controller
public class MainCotroller {

	@Autowired
	private CategoryService service;
	
	
	@ResponseBody
	@RequestMapping(value ="/headerCategory.do", produces = "application/json;charset=utf-8")
	public String headerCategory() {
		ForHeaderCategory list = service.selectForHeaderCategory();
		return new Gson().toJson(list);
	}
	

	@RequestMapping(value = "/main.do")
	public String mainPage() {
		return "common/main";
	}
	
	
}
