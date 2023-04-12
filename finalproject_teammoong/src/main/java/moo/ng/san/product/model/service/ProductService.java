package moo.ng.san.product.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import moo.ng.san.category.model.vo.DetailCategory;
import moo.ng.san.product.model.dao.ProductDao;
import moo.ng.san.product.model.vo.FileVO;
import moo.ng.san.product.model.vo.Product;
import moo.ng.san.product.model.vo.ProductPageData;
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
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("firstCategoryNo", firstCategoryNo);
		map.put("detailCategoryNo", detailCategoryNo);
		map.put("sortType", sortType);
		
		ArrayList<Product> list = dao.selectInfiniteScrollProductList(map);
		
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
		System.out.println(p);
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




































































































}

