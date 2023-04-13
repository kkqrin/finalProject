package moo.ng.san.askItem.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import common.FileManager;
import moo.ng.san.askItem.model.service.AskItemService;
import moo.ng.san.askItem.model.vo.AskItem;
import moo.ng.san.askItem.model.vo.AskItemCategory;
import moo.ng.san.askItem.model.vo.DocuVO;

@Controller
public class AskItemController {
	@Autowired
	private AskItemService service;
	@Autowired
	private FileManager manager;
	
	@RequestMapping(value="/askItemFrm.do")
	public String askItemFrm() {
		return "askItem/askItemFrm";
	}
	
	@ResponseBody
	@RequestMapping(value="/askItem.do")
	public String askItem(AskItem a, String[] categoryName, MultipartFile[] askItemFile, HttpServletRequest request) {
		ArrayList<DocuVO> fileList = new ArrayList<DocuVO>();
		if(!askItemFile[0].isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/askItem/");
			for(MultipartFile file : askItemFile) {
				String docuName = file.getOriginalFilename();
				String docupath = manager.upload(savePath, file);
				DocuVO docuVO = new DocuVO();
				docuVO.setDocuName(docuName);
				docuVO.setDocupath(docupath);
				fileList.add(docuVO);
			}
		}
		ArrayList<AskItemCategory> categories = new ArrayList<AskItemCategory>();		
		for (String category : categoryName) {
			AskItemCategory askItemCategory = new AskItemCategory();
			askItemCategory.setCategoryName(category);
			categories.add(askItemCategory);
		}
		int result = service.insertAskItem(a, categories, fileList);
		if(result == fileList.size()+categories.size()+1) {
			return "success";				
		}else {
			return "error";
		}
	}
	@RequestMapping(value = "/uploadAskItemImage.do", produces = "plain/text;charset=utf-8")
	@ResponseBody
	public String uploadImage(@RequestParam("imageFile") MultipartFile multipartFile, HttpServletRequest request, HttpServletResponse response) throws IOException {
	    // 이미지 파일 저장
		request.setCharacterEncoding("utf-8");
	    String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/askItem/askItemImg/");
	    File file = new File(savePath, multipartFile.getOriginalFilename());
	    multipartFile.transferTo(file);
	    // 이미지 파일 경로 반환
	    response.setCharacterEncoding("utf-8");
	    String imageSrc = request.getContextPath() + "/resources/upload/askItem/askItemImg/" + file.getName();
	    return imageSrc;
	}
	
}