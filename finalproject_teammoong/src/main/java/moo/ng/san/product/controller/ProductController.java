package moo.ng.san.product.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import common.FileManager;
import moo.ng.san.category.model.vo.DetailCategory;
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
	
	@RequestMapping(value="/photoReviewMore.do")
	public String photoReviewMore() {
		return "product/photoReviewMore";
	}
	
	@RequestMapping(value="/productList.do")
	public String productList(int category, Model model) {
		// reqPage cateogory
		// 상위 누르면 상위이름 + 하위는 전체 및 상위에 해당하는 모든 하위카테고리
		// 하위 누르면 상위이름 + 해당 하위 이름 및 상위에 해당하는 모든 하위카테고리
		
//		System.out.println("카테고리 : " + category);
//		System.out.println("현재 페이지 : " + reqPage);
		
		
		////////// 카테고리 계산 //////////
		int fCategory = 0;
		int sCategory = 0;
		// 11 12 13 14 25 26 27 28 29 210 211 212 313 314 .. 1058 ..1066
		if (category > 100) {
			// 네 자리 이상면
			fCategory = category / 100; // 2 3 4 5 6 .. 10 11 12 13
			sCategory = category - fCategory * 100;
			System.out.println("상위 카테고리 : "+fCategory+" 하위 카테고리 : "+sCategory);
			
		}else {
			// 두 자리면
			fCategory = category / 10;
			sCategory = category % 10;
			System.out.println("상위 카테고리 : "+fCategory+" 하위 카테고리 : "+sCategory);
		}
		
		
		
		// 카테고리별 상품리스트
		ArrayList<Product> list = service.selectInfiniteScrollProductList(sCategory, 1, 3);
		// 하위 카테고리 리스트
		ArrayList<DetailCategory> dCategoryList = service.selectDetailCategory(fCategory);
		// 파일 리스트
//		ArrayList<FileVO> fileList = service.selectAllFileList();
		
//		model.addAttribute("fCategory", fCategory);
//		model.addAttribute("sCategory", sCategory);
		model.addAttribute("list", list);
		model.addAttribute("dCategoryList", dCategoryList);
		
		return "product/productList";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	명훈작업공간 120~200
	
	@RequestMapping(value="/insertProductFrm.do")
	public String insertProductFrm() {
		return "product/insertProductFrm";
	}
	
	@RequestMapping(value="/insertProduct.do")
	public String insertProduct(Product p, MultipartFile[] productFile, HttpServletRequest request) {
		ArrayList<FileVO> fileList = new ArrayList<FileVO>();
		if(!productFile[0].isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("resources/upload/product/");
			for(MultipartFile file : productFile) {
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
	@RequestMapping(value="/productView.do")
	public String productView(int productNo, Model model) {
		Product p = service.selectProductByProductNo(productNo);
		model.addAttribute("p",p);
		return "product/productView";
	}
	@GetMapping("/main.do")
	public String selectProductList(Model model) {
		ArrayList<Product> list = service.selectProductList();
		model.addAttribute("productList",list);
		return "common/main";
	}
//	@RequestMapping(value="SummerNoteImageFile" , method = RequestMethod.POST)
//	public @ResponseBody JsonObject SummerNoteImageFile(@RequestParam("file") MultipartFile file) {
//		JsonObject jsonObject = service.SummerNoteImageFile(file);
//		 System.out.println(jsonObject);
//		return jsonObject;
//	}
	
	
}
