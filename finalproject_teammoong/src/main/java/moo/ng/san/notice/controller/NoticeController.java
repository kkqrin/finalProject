package moo.ng.san.notice.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import common.FileManager;
import moo.ng.san.notice.model.service.NoticeService;
import moo.ng.san.notice.vo.FileVO;
import moo.ng.san.notice.vo.Notice;
import moo.ng.san.notice.vo.NoticePageData;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService service;
	@Autowired
	private FileManager manager;
	
	@RequestMapping(value="/noticeList.do")
	public String noticeList(int reqPage, Model model) {
		NoticePageData npd = service.selectNoticeList(reqPage);
		model.addAttribute("list", npd.getList());
		model.addAttribute("pageNavi", npd.getPageNavi());
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
			return "redirect:/noticeList.do?reqPage=1";
		}else {
			return "redirect:/";
		}
	}
	@RequestMapping(value = "/uploadImage.do", produces = "plain/text;charset=utf-8")
	@ResponseBody
	public String uploadImage(@RequestParam("imageFile") MultipartFile multipartFile, HttpServletRequest request, HttpServletResponse response) throws IOException {
	    // 이미지 파일 저장
		request.setCharacterEncoding("utf-8");
	    String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/notice/noticeImg/");
	    File file = new File(savePath, multipartFile.getOriginalFilename());
	    multipartFile.transferTo(file);
	    // 이미지 파일 경로 반환
	    response.setCharacterEncoding("utf-8");
	    String imageSrc = request.getContextPath() + "/resources/upload/notice/noticeImg/" + file.getName();
	    return imageSrc;
	}
	
	@RequestMapping(value="/noticeView.do")
	public String noticeView(int noticeNo, Model model) {
		Notice n = service.selectOneNotice(noticeNo);
		n.setReadCount(n.getReadCount()+1);
		int result = service.updateReadCount(n);
		model.addAttribute("n",n);
		return "notice/noticeView";
	}
	
	@RequestMapping(value="/noticeUpdateFrm.do")
	public String noticeUpdateFrm(int noticeNo, Model model) {
		Notice n = service.selectOneNotice(noticeNo);
		model.addAttribute("n",n);
		return "notice/noticeUpdateFrm";
	}
	
	@RequestMapping(value="/noticeUpdate.do")
	public String noticeUpdate(Notice n, int[] fileNo, String[] filepath, MultipartFile[] noticeFile, HttpServletRequest request) {
		ArrayList<FileVO> fileList = new ArrayList<FileVO>();
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/notice/");
		if(!noticeFile[0].isEmpty()) {
			for(MultipartFile file : noticeFile) {
				String filename = file.getOriginalFilename();
				String upFilepath = manager.upload(savePath, file);
				
				FileVO fileVO = new FileVO();
				fileVO.setFileName(filename);
				fileVO.setFilepath(upFilepath);
				fileVO.setNoticeNo(n.getNoticeNo());
				fileList.add(fileVO);
			}
		}
		int result = service.noticeUpdate(n, fileList, fileNo);
		if(fileNo != null && (result == (fileList.size()+fileNo.length+1))) {
			for(String delFile :filepath) {
				boolean delResult = manager.deleteFile(savePath, delFile);
			}
			return "redirect:/noticeList.do?reqPage=1";
		}else if(fileNo == null && (result == fileList.size()+1)) {
			return "redirect:/noticeList.do?reqPage=1";
		}else {
			return "redirect:/noticeUpdateFrm.do";
		}
	}
	
	@RequestMapping(value="/noticeDelete.do")
	public String noticeDelete(int noticeNo) {
		int result = service.noticeDelete(noticeNo);
		if(result > 0) {
			return "redirect:/noticeList.do?reqPage=1";
		}else {
			return "redirect:/noticeList.do?reqPage=1";
		}
	}
	@RequestMapping(value="/noticeFileDown.do")
	public void noticeFileDown(int fileNo, HttpServletRequest request, HttpServletResponse response) {
		//fileNo : DB에서 filename, filepath를 조회해오기위한 용도
		//request : 파일위치 찾을 때 사용
		//response : 파일다운로드 로직 구현 시 사용
		//리턴을 하지않음 - 페이지이동이 필요없으므로
		FileVO file = service.getFile(fileNo);
		System.out.println(file);
		//filename과 filepath를 찾아오기위해서
		manager.download(file, request, response);
		
	}
}
