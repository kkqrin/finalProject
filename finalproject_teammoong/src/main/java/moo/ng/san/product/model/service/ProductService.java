package moo.ng.san.product.model.service;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import moo.ng.san.category.model.vo.DetailCategory;
import moo.ng.san.product.model.dao.ProductDao;
import moo.ng.san.product.model.vo.FileVO;
import moo.ng.san.product.model.vo.Product;
@Service
public class ProductService {
	@Autowired
	private ProductDao dao;



	
	
	
	
	
	
	
	
	
	
//	규린작업공간 20~100
	
	public ArrayList<Product> selectInfiniteScrollProductList(int sCategoryNo, int start, int amount) {
		// start : 1, amount : 3
		int end = start + amount - 1; // 끝번호
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("sCategoryNo", sCategoryNo);
		
		ArrayList<Product> list = dao.selectInfiniteScrollProductList(map);
		
		return list;
	}
	
	public ArrayList<DetailCategory> selectDetailCategory(int fCategory) {
		
		return dao.selectDetailCategory(fCategory);
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

































































































//	public JsonObject SummerNoteImageFile(MultipartFile file) {
//		JsonObject jsonObject = new JsonObject();
//		String fileRoot = "C:\\summernoteImg\\";
//		String originalFileName = file.getOriginalFilename();
//		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
//		
//		String saveFileName = UUID.randomUUID()+extension;
//			
//		File targetFile = new File(fileRoot+saveFileName);
//		
//		try {
//			InputStream fileStream = file.getInputStream();
//			FileUtils.copyInputStreamToFile(fileStream, targetFile);
//			jsonObject.addProperty("url", "/summernoteImg/"+saveFileName);
//			jsonObject.addProperty("responseCode", "succcess");
//		} catch(IOException e) {
//			FileUtils.deleteQuietly(targetFile);
//			jsonObject.addProperty("responseCode", "error");
//			e.printStackTrace();
//		}	
//		return jsonObject;
//	}
}

