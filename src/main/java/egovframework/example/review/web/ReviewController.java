package egovframework.example.review.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.cmmn.web.JsonUtil;
import egovframework.example.review.service.ReviewService;
import egovframework.example.review.service.ReviewVO;
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

		// 사이즈 후기에 쓰일 select 박스 호출
		List<ReviewVO> rplCatList = reviewService.selectRplCatList();
		
		model.addAttribute("reviewDetail", vo);
		model.addAttribute("fileInfo", fileInfo);
		model.addAttribute("rplCatList", rplCatList);
		
		return "review/reviewDetailView.tiles";
	}
	
	// 사이즈 후기에 쓰일 ajax 호출
	@RequestMapping(value="rplPrd.do")
	public void rplPrd(@RequestBody String catCd,
			ModelMap model) throws Exception {
		String param = "";
		
		System.out.println("catCd : " + catCd);
		System.out.println("JsonToMap : " + JsonUtil.JsonToMap(catCd));
		
		Map<String,Object> resMap =  JsonUtil.JsonToMap(catCd);
		
		param = (String) resMap.get(catCd);
		
		//List<EgovMap> rplPrdList = reviewService.selectRplPrdList(param);
		
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
