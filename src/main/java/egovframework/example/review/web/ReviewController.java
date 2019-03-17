package egovframework.example.review.web;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.cmmn.web.JsonUtil;
import egovframework.example.review.service.ReviewService;
import egovframework.example.review.service.ReviewVO;
import egovframework.example.util.BoardVO;
import egovframework.example.util.FileVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class ReviewController {
	
	@Resource
	private ReviewService reviewService;
	
	// 리뷰게시판 리스트
	@RequestMapping(value="reviewView.do")
	public String reviewView (ModelMap model,BoardVO vo) {
		List<BoardVO> reviewList = reviewService.selectReviewList(vo);
		List<BoardVO> catCdList = reviewService.selectCatCdList();
	
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("catCdList", catCdList);
		return "review/reviewView.tiles";
	}
	
	// 리뷰게시판 검색 리스트
	@RequestMapping(value="reviewSearchView.do")
	public String reviewSearchView (ModelMap model, BoardVO vo) {
		List<BoardVO> reviewSearchList = reviewService.selectReviewSearchList(vo);
		List<BoardVO> catCdList = reviewService.selectCatCdList();
		
		model.addAttribute("reviewSearchList", reviewSearchList);
		model.addAttribute("catCdList", catCdList);
		
		return "review/reviewSearchView.tiles";
	}
	
	// 리뷰게시판 상세정보 조회
	@RequestMapping(value="reviewDetailView.do")
	public String reviewDetailView (BoardVO vo, ReviewVO rvo, ModelMap model) {
		
		// 상세정보 조회
		vo = reviewService.selectReviewDetailList(vo);
		List<FileVO> fileInfo = reviewService.selectFileList(vo);
		reviewService.addVisitCnt(vo);

		// 사이즈 후기에 쓰일 select 박스 호출
		List<ReviewVO> rplCatList = reviewService.selectRplCatList();
		List<ReviewVO>  rplDataList= reviewService.selectRplDataList(rvo);
		
		
		model.addAttribute("reviewDetail", vo);
		model.addAttribute("fileInfo", fileInfo);
		model.addAttribute("rplCatList", rplCatList);
		model.addAttribute("rplDataList", rplDataList);
		
		return "review/reviewDetailView.tiles";
	}
	
	// 사이즈 후기 select Box에 쓰일 ajax 호출
	@RequestMapping(value="rplPrd.do")
	public void rplPrd(@RequestBody String catCd,
			HttpServletResponse response) throws Exception {
		
		Map<String,Object> resMap =  JsonUtil.JsonToMap(catCd);
		
		String param = (String) resMap.get("catCd");
		List<EgovMap> rplPrdList = reviewService.selectRplPrdList(param);
		
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		resultMap.put("result", "SUCCESS");
		resultMap.put("rplPrdList", rplPrdList);
		
		response.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		
		String resultMapToJson = JsonUtil.HashMapToJson(resultMap);
		
		out.write(resultMapToJson);
	}
	
	// 리뷰게시판 사이즈 후기 리플 작성시 업데이트 기능
	@RequestMapping(value="rplUpdate.do")
	public String rplUpdate (ReviewVO vo) {
		reviewService.rplUpdate(vo);
		
		return "redirect:reviewView.do";
	}
}
