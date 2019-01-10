package egovframework.example.review.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.review.service.ReviewService;
import egovframework.example.review.service.ReviewVO;

@Controller
public class ReviewController {
	
	@Resource
	private ReviewService reviewService;
	
	@RequestMapping(value="reviewView.do")
	public String reviewView 
	(ModelMap model) {
		
		List<ReviewVO> reviewList = reviewService.selectReviewList();
		model.addAttribute("reviewList", reviewList);
		
		return "review/reviewView.tiles";
	}
	
}
