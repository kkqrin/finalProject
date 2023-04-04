package moo.ng.san.category.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import moo.ng.san.category.model.dao.CategoryDao;
import moo.ng.san.category.model.vo.Category;
import moo.ng.san.category.model.vo.DetailCategory;

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
}
