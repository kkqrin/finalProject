package moo.ng.san.askItem.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import common.FileManager;
import moo.ng.san.askItem.model.service.AskItemService;
import moo.ng.san.askItem.model.vo.AskItem;
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
	@RequestMapping(value="/noticeWrite.do")
	public String askItem(AskItem a, MultipartFile[] askItemFile, HttpServletRequest request) {
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
		int result = service.insertAskItem(a,fileList);
		if(result == (fileList.size()+1)) {
			return "success";
		}else {
			return "error";
		}
	}
	
}
