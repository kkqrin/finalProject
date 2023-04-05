package moo.ng.san.category.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import moo.ng.san.category.model.vo.Category;
import moo.ng.san.category.model.vo.DetailCategory;

@Repository
public class CategoryDao {
	@Autowired
	private SqlSessionTemplate sqlSessoin;

	public ArrayList<Category> selectAllCategory() {
		List list = sqlSessoin.selectList("category.selectAllCategory");
		return (ArrayList<Category>)list;
	}

	public ArrayList<DetailCategory> selectDetailCategory(int categoryNo) {
		List list = sqlSessoin.selectList("category.selectDetailCategory",categoryNo);
		return (ArrayList<DetailCategory>)list;
	}

	public ArrayList<DetailCategory> selectAllDetailCategory() {
		List list = sqlSessoin.selectList("category.selectAllDetailCategory");
		return (ArrayList<DetailCategory>)list;
	}
}
