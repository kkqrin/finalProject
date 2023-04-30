package moo.ng.san.review.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import common.FileManager;
import moo.ng.san.review.model.service.ReviewService;
import moo.ng.san.review.model.vo.FileVO;
import moo.ng.san.review.model.vo.Review;

@Controller
public class ReviewController {
	@Autowired
	private ReviewService service;
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping(value="/insertReviewModal.do")
	public String insertReview(Review review, MultipartFile[] reviewFile, HttpServletRequest request) {
		System.out.println("reviewController에서 review값 : "+review);
		ArrayList<FileVO> fileList = new ArrayList<FileVO>();
		if(!reviewFile[0].isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/review/");
			for(MultipartFile file : reviewFile) {
				String filepath = fileManager.upload(savePath, file);
				FileVO fileVO = new FileVO();
				fileVO.setFilepath(filepath);
				fileList.add(fileVO);
			}
		}
		int result = service.insertReview(review, fileList);
		if(result == (fileList.size()+1)) {
			return "redirect:/";
		} else {
			return "redirect:/";
		}
	}
	@RequestMapping(value="/updateReview.do")
	public String updateReview(Review review) {
		int result = service.updateReview(review);
		return null;
	}
}
