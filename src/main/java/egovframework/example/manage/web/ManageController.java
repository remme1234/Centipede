  package egovframework.example.manage.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.manage.service.ManageService;
import egovframework.example.util.BoardVO;

@Controller
public class ManageController {

	@Resource
	private ManageService manageService;
	
	/** 이하 작업 releaseInfo 게시판  작업*/
	// 게시글 목록 호출
	@RequestMapping(value="mngRelInfoList.do")
	public String mngRelInfoList(BoardVO vo, ModelMap model) {
		List<BoardVO> mngRelInfoList = manageService.selectMngRelInfoList(vo);
		model.addAttribute("mngRelInfoList", mngRelInfoList);
		
		return "manage/mngRelInfoList.tiles";
	}
	
	// 글작성 및 수정 페이지 이동 
	@RequestMapping(value="mngRelInfoUpdateView.do") 
	public String mngRelInfoUpdateView (BoardVO vo, ModelMap model) {
		// 수정시 필요한 기존의 데이터 select 메서드 호출
		vo = manageService.selectReleaseInfoDetail(vo);
		model.addAttribute("mngRelInfoUpdateView", vo);
		
		return "manage/mngRelInfoUpdateView.tiles";
	}
	
	// 작성 및 수정 기능
	@RequestMapping(value="mngRelInfoUpdate.do")
	public String mngRelInfoUpdate (BoardVO vo, HttpServletRequest request) throws Exception{
		manageService.updateReleaseInfo(vo, request);
		
		return "redirect:mngRelInfoList.do";
	}
	
	// 게시글 비활성화 기능
	@RequestMapping(value="mngRelInfoDisable.do")
	public String mngRelInfoDisable(BoardVO vo) {
		manageService.deleteReleaseInfoDisable(vo);
		
		return "redirect:mngRelInfoList.do";
	}
	
	// 게시글 DB에서 삭제
	@RequestMapping(value="mngRelInfoDelete.do")
	public String mngRelInfoDelete(BoardVO vo) {
		manageService.deleteReleaseInfdelete(vo);
		
		return "redirect:mngRelInfoList.do";
	}
	
	
	/** 이하 작업 review 게시판 작업*/
	// 게시글 목록 호출
	@RequestMapping(value="mngReviewList.do")
	public String mngReviewList(BoardVO vo,ModelMap model) {
		
		List<BoardVO> mngRevInfoList = manageService.selectMngRevInfoList(vo);
		model.addAttribute("mngRevInfoList", mngRevInfoList);
		
		return "manage/mngReviewList.tiles";
	}
	
	// 글작성 및 수정 페이지 이동
	@RequestMapping(value="mngReviewUpdateView.do")
	public String mngReviewUpdateView(BoardVO vo, ModelMap model) {

		vo = manageService.selectReviewDetail(vo);
		model.addAttribute("mngReviewUpdateView", vo);
		
		return "manage/mngReviewUpdateView.tiles";
	}
	
	// 작성 및 수정 기능 
	@RequestMapping(value="mngReviewUpdate.do")
	public String mngReviewUpdate(BoardVO vo, HttpServletRequest request) throws Exception {
		manageService.updateReview(vo,request);
		
		return "redirect:mngReviewList.do";
	}
	
	// 게시글 비활성화 기능
	@RequestMapping(value="mngReviewDisable.do")
	public String mngReviewDisable(BoardVO vo) {
		
		manageService.deleteReviewDisable(vo);
		
		return "redirect:mngReviewList.do";
	}
	
	// 게시글 DB에서 삭제
	@RequestMapping(value="mngReviewDelete.do")
	public String mngReviewDelete(BoardVO vo) {
		
		manageService.mngReviewDelete(vo);
		
		return "redirect:mngReviewList.do";
	}
	
	
	/** 이하 작업 notice 게시판 작업*/
	// 게시글 목록 호출
	@RequestMapping(value="mngNoticeList.do")
	public String mngNoticeList(BoardVO vo,ModelMap model) {
		
		List<BoardVO> mngNoticeList = manageService.selectMngNoticeList(vo);
		model.addAttribute("mngNoticeList", mngNoticeList);
		
		return "manage/mngNoticeList.tiles";
	}
	
	// 글작성 및 수정 페이지 이동
	@RequestMapping(value="mngNoticeUpdateView.do")
	public String mngNoticeUpdateView (BoardVO vo, ModelMap model){
		vo = manageService.selectNoticeDetail(vo);
		model.addAttribute("mngNoticeUpdateView", vo);
		
		return "manage/mngNoticeUpdateView.tiles";
	}
	
	// 작성 및 수정 기능
	@RequestMapping(value="mngNoticeUpdate.do")
	public String mngNoticeUpdate(BoardVO vo, HttpServletRequest request) throws Exception {
		manageService.updateNotice(vo,request);
		
		return "redirect:mngNoticeList.do";
	}
	// 게시글 비활성화 기능
	@RequestMapping(value="mngNoticeDisable.do")
	public String mngNoticeDisable (BoardVO vo) {
		
		manageService.deleteNoticeDisable(vo);
		
		return "redirect:mngNoticeList.do";
	}
	
	// 게시글 DB에서 삭제
	@RequestMapping(value="mngNoticeDelete.do")
	public String mngNoticeDelete(BoardVO vo) {
		
		manageService.mngNoticeDelete(vo);
		
		return "redirect:mngNoticeList.do";
	}
}
