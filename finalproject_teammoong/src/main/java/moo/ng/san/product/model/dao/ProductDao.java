package moo.ng.san.product.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import moo.ng.san.basket.model.vo.Basket;
import moo.ng.san.category.model.vo.DetailCategory;
import moo.ng.san.product.model.vo.FileVO;
import moo.ng.san.product.model.vo.Option;
import moo.ng.san.product.model.vo.Product;
import moo.ng.san.product.model.vo.RecentProduct;

@Repository
public class ProductDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Transactional
	public int insertProduct(Product p) {
		int result = sqlSession.insert("product.insertProduct",p);
		return result;
	}

	public int selectProductNo() {
		int productNo = sqlSession.selectOne("product.selectProductNo");
		return productNo;
	}
	@Transactional
	public int insertFile(FileVO file) {
		int result = sqlSession.insert("product.insertFile",file);
		return result;
	}

	public Product selectProductByProductNo(int productNo) {
		Product p = sqlSession.selectOne("product.selectProductByProductNo", productNo);
		return p;
	}

	public ArrayList<String> selectProductImg(int productNo) {
		List list = sqlSession.selectList("product.selectProductImg",productNo);
		return (ArrayList<String>)list;
	}

	public ArrayList<Product> selectProductList() {
		List list = sqlSession.selectList("product.selectProductList");
		return (ArrayList<Product>)list;
	}


	public ArrayList<String> selectProductFiles(int productNo) {
		List list = sqlSession.selectList("product.selectProductFilelist",productNo);
		return (ArrayList<String>)list;
	}
	
	
	
	
	
	
	
	
	
//	규린작업공간 20~100
	
	public ArrayList<Product> selectInfiniteScrollProductList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("product.selectInfiniteScrollProductList", map);
		
		return (ArrayList<Product>)list;
	}

	public ArrayList<DetailCategory> selectCategoryNameOnList(int fCategory) {
		List list = sqlSession.selectList("category.selectCategoryNameOnList", fCategory);
		
		return (ArrayList<DetailCategory>)list;
	}

	public int selectProductCount(HashMap<String, Object> map) {
		
		int totalCount = sqlSession.selectOne("product.selectProductCount", map);
		
		return totalCount;
	}

	public ArrayList<Option> selectOptionList(int productNo) {
		List list = sqlSession.selectList("product.selectOptionList", productNo);
		
		return (ArrayList<Option>)list;
	}

	public int insertShoppingCart(HashMap<String, Object> map) {
		int result = sqlSession.insert("product.insertShoppingCart", map);
		
		return result;
	}

	public int selectOptionGroupNo(int productNo) {
		int optionGroupNo = sqlSession.selectOne("product.selectOptionGroupNo", productNo);
		
		System.out.println("Dao의 optionGroupNo : "+optionGroupNo);
		
		return optionGroupNo;
	}

	public int selectRecentBasketNo() {
		int recentBasketNo = sqlSession.selectOne("product.selectRecentBasketNo");
		
		return recentBasketNo;
	}

	public int insertShoppingCartOption(HashMap<String, Object> map) {
		int result = sqlSession.insert("product.insertShoppingCartOption", map);
		
		return result;
	}

	public ArrayList<Basket> selectBasketList(int memberNo) {
		List list = sqlSession.selectList("product.selectBasketList", memberNo);
		
		return (ArrayList<Basket>)list;
	}

	public int insertRecentProduct(HashMap<String, Object> map) {
		int result = sqlSession.insert("product.insertRecentProduct", map);
		
		return result;
	}

	public ArrayList<RecentProduct> selectRecentProductList(int memberNo) {
		List list = sqlSession.selectList("product.selectRecentProductList", memberNo);
		
		return (ArrayList<RecentProduct>)list;
	}

	public RecentProduct selectUniqueRecentProduct(HashMap<String, Object> map) {
		RecentProduct rp = sqlSession.selectOne("product.selectUniqueRecentProduct", map);
		
		return rp;
	}

	public int deletRecentProduct(HashMap<String, Object> map) {
		int result = sqlSession.insert("product.deleteRecentProduct", map);
		
		return result;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	명훈작업공간 120~200
}
