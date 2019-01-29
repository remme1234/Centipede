package egovframework.example.review.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.review.service.ReviewService;
import egovframework.example.util.BoardVO;
import egovframework.example.util.FileVO;

@Controller
public class ReviewController {
	
	@Resource
	private ReviewService reviewService;
	
	// 리뷰게시판 리스트
	@RequestMapping(value="reviewView.do")
	public String reviewView (ModelMap model) {
		
		List<BoardVO> reviewList = reviewService.selectReviewList();
		List<BoardVO> catCdList = reviewService.selectCatCdList();
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("catCdList", catCdList);
		return "review/reviewView.tiles";
	}
	
	// 리뷰게시판 상세정보 조회
	@RequestMapping(value="reviewDetailView.do")
	public String reviewDetailView (BoardVO vo, ModelMap model) {
		// 상세정보 조회
		vo = reviewService.selectReviewDetailList(vo);
		List<FileVO> fileInfo = reviewService.selectFileList(vo);
		System.out.println(fileInfo);
		
		model.addAttribute("reviewDetail", vo);
		model.addAttribute("fileInfo", fileInfo);
		
		return "review/reviewDetailView.tiles";
	}
	
	// 리뷰게시판 업데이트 페이지 호출 메서드
	@RequestMapping(value="reviewUpdateView.do")
	public String reviewUpdateViewView () {
		
		return "review/reviewUpdateView.tiles";
	}
	
	// 리뷰게시판 업데이트 기능 
	@RequestMapping(value="reviewUpdate.do")
	public String reviewUpdate(BoardVO vo, HttpServletRequest request) throws Exception  {
		reviewService.updateReview(vo,request);
		
		return "redirect:reviewView.do";

	}
	
	// 리뷰게시판 삭제 기능
	@RequestMapping(value="reviewDelete.do") 
	public String reviewDelete(BoardVO vo) {
		reviewService.deleteReviewDelete(vo);
		
		return "redirect:reviewView.do";
	}
}
