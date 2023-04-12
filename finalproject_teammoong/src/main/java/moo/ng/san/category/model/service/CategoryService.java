package moo.ng.san.category.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import moo.ng.san.category.model.dao.CategoryDao;
import moo.ng.san.category.model.vo.Category;
import moo.ng.san.category.model.vo.DetailCategory;
import moo.ng.san.category.model.vo.ForHeaderCategory;

@Service
public class CategoryService {
	@Autowired
	private CategoryDao dao;

	public ArrayList<Category> selectAllCategory() {
		ArrayList<Category> list = dao.selectAllCategory();
		return list;
	}

	public ArrayList<DetailCategory> selectDetailCategory(int categoryNo) {
		ArrayList<DetailCategory> list = dao.selectDetailCategory(categoryNo);
		return list;
	}

	public ArrayList<DetailCategory> selectAllDetailCategory() {
		ArrayList<DetailCategory> list = dao.selectAllDetailCategory();
		return list;
	}

	public ForHeaderCategory selectForHeaderCategory() {
		
		ForHeaderCategory list = new ForHeaderCategory();
		ArrayList<Category> c = dao.selectAllCategory();
		ArrayList<DetailCategory> d = dao.selectAllDetailCategory();
		list.setCategory(c);
		list.setDetailCategory(d);
		
		return list;
	}//헤더에 불러올 용도로 쓰이는 서비스
	
}
