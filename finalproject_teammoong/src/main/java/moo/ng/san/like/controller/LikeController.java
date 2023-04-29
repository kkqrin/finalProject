package moo.ng.san.like.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import moo.ng.san.like.model.service.LikeService;
import moo.ng.san.like.model.vo.Like;
import moo.ng.san.like.model.vo.LikeListInfo;
import moo.ng.san.product.model.vo.Product;

@Controller
public class LikeController {
	@Autowired
	private LikeService service;
	
	@ResponseBody
	@RequestMapping(value="/productLike.do", method=RequestMethod.POST, produces = "application/json; charset=utf8")
	public String productLike(Like like) {
		System.out.println("LikeController에서 like값 :"+like);
		int result = service.insertLike(like);
		return "ok";
	}
	@ResponseBody
	@RequestMapping(value="/selectProductLike.do", method=RequestMethod.POST, produces = "application/json; charset=utf8")
	public Like selectProductLike(Like l) {
		System.out.println("Like Controller 에서 selectProductLike : "+l);
		Like like = service.selectProductLike(l);
		return like;
	}
	@ResponseBody
	@RequestMapping(value="/deleteLike.do", method=RequestMethod.POST, produces = "application/json; charset=utf8")
	public String deleteLike(Like l) {
		int result = service.deleteLike(l);
		return null;
		
	}
	
	@RequestMapping(value="productLikePage.do")
	public String productLikePage(int memberNo, Model model) {
		ArrayList<LikeListInfo> list = service.selectLikeList(memberNo);
		model.addAttribute("likeList",list);
		return "product/productLikePage";
	}
	@ResponseBody
	@RequestMapping(value="/deleteLikeByMyLikeList.do")
	public int deleteLikeByMyLikeList(Like like) {
		System.out.println("likeController에서 myLikeList값"+like);
		int result = service.deleteLikeByMyLikeList(like);
		if(result > 0) {
			return 0622;
		} else {
			return 0;
		}
	}
}
