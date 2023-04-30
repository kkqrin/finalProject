package moo.ng.san.product.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import moo.ng.san.basket.model.vo.Basket;
import moo.ng.san.board.model.vo.Board;
import moo.ng.san.category.model.vo.Category;
import moo.ng.san.category.model.vo.DetailCategory;
import moo.ng.san.member.model.vo.Member;
import moo.ng.san.product.model.dao.ProductDao;
import moo.ng.san.product.model.vo.FileVO;
import moo.ng.san.product.model.vo.Option;
import moo.ng.san.product.model.vo.Product;
import moo.ng.san.product.model.vo.ProductPageData;
import moo.ng.san.product.model.vo.RecentProduct;
import moo.ng.san.product.model.vo.searchBarVO;
@Service
public class ProductService {
	@Autowired
	private ProductDao dao;



	
	
	
	
	
	
	
	
	
	
//	규린작업공간 20~100
	
	public ArrayList<Product> selectInfiniteScrollProductList(int start, int amount, int firstCategoryNo ,int detailCategoryNo, String sortType) {
		// start : 1, amount : 3

		int end = start + amount - 1; // 끝번호
		
//		String sortType = null;
//		if(sortType.equals("recent-sort")) {
//			sortType = "1 ASC";
//		}else if(sortType.equals("discount-sort")) {
//			sortType = "productDiscount desc";
//		}else if(sortType.equals("downprice-sort")) {
//			
//		}else if(sortType.equals("highprice-sort")) {
//			
//		}else {
//			
//		}
		
		ArrayList<Product> list = null;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("firstCategoryNo", firstCategoryNo);
		map.put("detailCategoryNo", detailCategoryNo);
		map.put("sortType", sortType);
		
		if(sortType.equals("popular-sort")) {
			
			map.put("categoryNo", firstCategoryNo);
			list = dao.selectBestProductList(map);
			
		}else if(sortType.equals("review-sort")) {

			
		}else {
			list = dao.selectInfiniteScrollProductList(map);			
		}
		
		
		return list;
	}
	
	public ArrayList<DetailCategory> selectCategoryNameOnList(int fCategory) {
		
		return dao.selectCategoryNameOnList(fCategory);
	}
	

	public int selectProductCount(int fCategory, int sCategory) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("firstCategoryNo", fCategory);
		map.put("detailCategoryNo", sCategory);
		
		return dao.selectProductCount(map);
	}
	
	public ArrayList<Option> selectOptionList(int productNo) {
		return dao.selectOptionList(productNo);
	}

	public int insertShoppingCart(int memberNo, int productNo, int cnt) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("productNo", productNo);
		map.put("cnt", cnt);

		return dao.insertShoppingCart(map);
	}

	public int selectOptionGroupNo(int productNo) {
		return dao.selectOptionGroupNo(productNo);
	}
	
	public int selectRecentBasketNo() {
		return dao.selectRecentBasketNo();
	}
	
	public int insertShoppingCartOption(int recentBasketNo, int optionGroupNo, int optionNo) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("recentBasketNo", recentBasketNo);
		map.put("optionGroupNo", optionGroupNo);
		map.put("optionNo", optionNo);
		
		return dao.insertShoppingCartOption(map);
	}
	
	public ArrayList<Basket> selectBasketList(int memberNo) {
		
		return dao.selectBasketList(memberNo);
	}

	public int insertRecentProduct(int memberNo, int productNo) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("productNo", productNo);
		
		return dao.insertRecentProduct(map);
	}

	public ArrayList<RecentProduct> selectRecentProductList(int memberNo) {
		
		return dao.selectRecentProductList(memberNo);
	}
	
	public int selectUniqueRecentProduct(int memberNo, int productNo) {
		int result = 0;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("productNo", productNo);
		
		RecentProduct rp = dao.selectUniqueRecentProduct(map);
		
		if(rp!=null) {
			result = dao.deletRecentProduct(map);
		}
		
		return result;
	}

	public Basket selectBasketCount(int memberNo, int productNo, int optionNo) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("productNo", productNo);
		map.put("optionNo", optionNo);
		
		return dao.selectBasketCount(map);
	}
	
	public int updateBasketCount(int basketNo, int cnt) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("basketNo", basketNo);
		map.put("basketCount", cnt);
		
		return dao.updateBasketCount(map);
	}

	public int deleteCart(int[] basketNo) {
		
		int result = 0;
		
		for(int no : basketNo) {
			result += dao.deleteCart(no);
		}
		
		return result;
	}
	
	public ArrayList<Category> selectCategoryList() {
		
		ArrayList<Category> list = dao.selectCategoryList();
		
		return list;
	}

	public ArrayList<Product> selectBestProductList(int categoryNo) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("categoryNo", categoryNo);
		
		return dao.selectBestProductList(map);
	}

	public ArrayList<Product> selectHighSaleProductList() {
		
		return dao.selectHighSaleProductList();
	}


	public ArrayList<Product> selectSoldOutProductList() {
		
		return dao.selectSoldOutProductList();
	}

	public ArrayList<Product> selectgongguNumberProductList(int i) {
		
		return dao.selectgongguNumberProductList(i);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	명훈작업공간 120~200
	public int insertProduct(Product p, ArrayList<FileVO> fileList) {
	int result = dao.insertProduct(p);
	if(result > 0) {
		int productNo = dao.selectProductNo();
		for(FileVO file : fileList) {
			file.setProductNo(productNo);
			result += dao.insertFile(file);
		}
	}
	return result;
}

	public Product selectProductByProductNo(int productNo) {
		Product p = dao.selectProductByProductNo(productNo);
		if(p != null) {
			ArrayList<String> filepath = dao.selectProductImg(productNo);
			p.setFileList(filepath);
		}
//		System.out.println(p);
		

		return p;
		
	}

	public ArrayList<Product> selectProductList() {
		ArrayList<Product> list = dao.selectProductList();
		for(Product p : list) {
			ArrayList<String> productFileList = dao.selectProductFiles(p.getProductNo());
			p.setFileList(productFileList);
		}
		return list;
	}

	public ArrayList<Product> searchProductList(searchBarVO sb) {
			ArrayList<Product> productList = dao.searchProductList(sb);
			for(Product p : productList) {
				ArrayList<String> productFileList = dao.selectProductFiles(p.getProductNo());
				p.setFileList(productFileList);
			}
				return productList;
	}


















































































































}

