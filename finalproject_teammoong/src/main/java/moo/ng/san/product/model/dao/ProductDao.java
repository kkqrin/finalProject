package moo.ng.san.product.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import moo.ng.san.category.model.vo.DetailCategory;
import moo.ng.san.product.model.vo.FileVO;
import moo.ng.san.product.model.vo.Product;

@Repository
public class ProductDao {
	@Autowired
	private SqlSessionTemplate sqlSessoin;
	
	@Transactional
	public int insertProduct(Product p) {
		int result = sqlSessoin.insert("product.insertProduct",p);
		return result;
	}

	public int selectProductNo() {
		int productNo = sqlSessoin.selectOne("product.selectProductNo");
		return productNo;
	}
	@Transactional
	public int insertFile(FileVO file) {
		int result = sqlSessoin.insert("product.insertFile",file);
		return result;
	}

	public Product selectProductByProductNo(int productNo) {
		Product p = sqlSessoin.selectOne("product.selectProductByProductNo", productNo);
		return p;
	}

	public ArrayList<String> selectProductImg(int productNo) {
		List list = sqlSessoin.selectList("product.selectProductImg",productNo);
		return (ArrayList<String>)list;
	}

	public ArrayList<Product> selectProductList() {
		List list = sqlSessoin.selectList("product.selectProductList");
		return (ArrayList<Product>)list;
	}


	public ArrayList<String> selectProductFiles(int productNo) {
		List list = sqlSessoin.selectList("product.selectProductFilelist",productNo);
		return (ArrayList<String>)list;
	}
	
	
	
	
	
	
	
	
	
//	규린작업공간 20~100
	
	public ArrayList<Product> selectInfiniteScrollProductList(HashMap<String, Object> map) {
		List list = sqlSessoin.selectList("product.selectInfiniteScrollProductList", map);
		
		return (ArrayList<Product>)list;
	}

	public ArrayList<DetailCategory> selectDetailCategory(int fCategory) {
		List list = sqlSessoin.selectList("category.selectDetailCategory", fCategory);
		
		return (ArrayList<DetailCategory>)list;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	명훈작업공간 120~200
}
