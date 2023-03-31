package moo.ng.san.notice.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import common.FileManager;
import moo.ng.san.notice.model.service.NoticeService;
import moo.ng.san.notice.vo.FileVO;
import moo.ng.san.notice.vo.Notice;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService service;
	private FileManager manager;
	
	@RequestMapping(value="/noticeList.do")
	public String noticeList(Model model) {
		return "notice/allNotice";
	}
	@RequestMapping(value="/noticeWriteFrm.do")
	public String noticeWriteFrm() {
		return "notice/noticeWriteFrm";
	}
	@RequestMapping(value="/noticeWrite.do")
	public String noticeWrite(Notice n, MultipartFile[] noticeFile, HttpServletRequest request) {
		ArrayList<FileVO> fileList = new ArrayList<FileVO>();
		if(!noticeFile[0].isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/notice/");
			for(MultipartFile file : noticeFile) {
				String fileName = file.getOriginalFilename();
				String filepath = manager.upload(savePath, file);
				FileVO fileVO = new FileVO();
				fileVO.setFileName(fileName);
				fileVO.setFilepath(filepath);
				fileList.add(fileVO);
			}
		}
		int result = service.insertNotice(n,fileList);
		if(result == (fileList.size()+1)) {
			return "redirect:/noticeList.do";
		}else {
			return "redirect:/";
		}
	}
	@RequestMapping(value = "/uploadImage.do")
	@ResponseBody
	public String uploadImage(@RequestParam("imageFile") MultipartFile multipartFile, HttpServletRequest request, HttpServletResponse response) throws IOException {
	    // 이미지 파일 저장
	    String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/notice/noticeImg/");
	    File file = new File(savePath, multipartFile.getOriginalFilename());
	    multipartFile.transferTo(file);
	    // 이미지 파일 경로 반환
	    response.setCharacterEncoding("utf-8");
	    String imageSrc = request.getContextPath() + "/resources/upload/notice/noticeImg/" + file.getName();
	    return imageSrc;
	}
}
