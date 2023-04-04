package moo.ng.san.product.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import common.FileManager;
import moo.ng.san.product.model.service.ProductService;
import moo.ng.san.product.model.vo.FileVO;
import moo.ng.san.product.model.vo.Product;

@Controller
public class ProductController {
	@Autowired
	private ProductService service;
	@Autowired
	private FileManager fileManager;
	
	
	
	
	
	
	
	
//	규린작업공간 20~100
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	명훈작업공간 120~200
	
	@RequestMapping(value="/insertProductFrm.do")
	public String insertProductFrm() {
		return "product/insertProductFrm";
	}
	
	@RequestMapping(value="insertProduct.do")
	public String insertProduct(Product p, MultipartFile[] productFile, HttpServletRequest request) {
		ArrayList<FileVO> fileList = new ArrayList<FileVO>();
		if(!productFile[0].isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("resources/upload/product/");
			for(MultipartFile file : productFile) {
				String filename = file.getOriginalFilename();
				String filepath = fileManager.upload(savePath, file);
				FileVO fileVO = new FileVO();
				fileVO.setFilepath(filepath);
				fileList.add(fileVO);
			}
		}
		int result = service.insertProduct(p, fileList);
		if(result == (fileList.size()+1)) {
			return "redirect:/";
		} else {
			return "redirect:/insertProductFrm.do";
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
