package moo.ng.san.review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import moo.ng.san.review.model.service.ReviewService;
import moo.ng.san.review.model.vo.Review;

@Controller
public class ReviewController {
	@Autowired
	private ReviewService service;
	
	@RequestMapping(value="/insertReview.do")
	public String insertReview(Review r) {
		System.out.println("ReviewController에서 Review값 :"+r);
		return null;
	}
}
