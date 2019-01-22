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
	
	// 리뷰게시판 리스트
	@RequestMapping(value="reviewView.do")
	public String reviewView (ModelMap model) {
		
		List<ReviewVO> reviewList = reviewService.selectReviewList();
		model.addAttribute("reviewList", reviewList);
		return "review/reviewView.tiles";
	}
	
	// 리뷰게시판 상세정보 조회
	@RequestMapping(value="reviewDetailView.do")
	public String reviewDetailView (ReviewVO vo, ModelMap model) {
		
		vo = reviewService.selectReviewDetailList(vo);
		model.addAttribute("reviewDetail", vo);
		
		return "review/reviewDetailView.tiles";
	}
	
	// 리뷰게시판 업데이트 페이지
	@RequestMapping(value="reviewUpdateView.do")
	public String reviewUpdateViewView () {
		
		return "review/reviewUpdateView.tiles";
	}
}
