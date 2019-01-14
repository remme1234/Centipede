package egovframework.example.releaseInfo.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.releaseInfo.service.ReleaseInfoService;
import egovframework.example.releaseInfo.service.ReleaseInfoVO;
import egovframework.example.util.FileVO;

@Controller
public class ReleaseInfoController {
	
	@Resource
	private ReleaseInfoService releaseInfoService;
	
	// 발매정보게시판 리스트 
	@RequestMapping(value="releaseInfoView.do")
	public String releaseInfoView (ModelMap model) {
		// 목록 조회
		List<ReleaseInfoVO> releaseInfoList = releaseInfoService.selectReleaseInfoList();
		model.addAttribute("releaseInfoList", releaseInfoList);
		System.out.println(releaseInfoList);
		return "releaseInfo/releaseInfoView.tiles";
	}
	
	// 발매정보게시판 상세정보 조회
	@RequestMapping(value="releaseInfoDetailView.do") 
	public String releaseInfoDetailView (ModelMap model, ReleaseInfoVO vo) {
		// 상세정보 조회
		vo = releaseInfoService.selectReleaseInfoDetail(vo);
		System.out.println("파일 fileNo : " + vo.getFileNo());
		System.out.println("게시글 number : " + vo.getNumber());
		// 첨부파일정보 조회
		List<FileVO> fileInfo = releaseInfoService.selectFileList(vo);
		System.out.println("두번쩌 fileNo : " + vo.getFileNo());
		System.out.println("fileInfo List : " + fileInfo);
		
		// 조회수 증가
		releaseInfoService.addVisitCnt(vo);
		model.addAttribute("releaseInfoDetail", vo);
		model.addAttribute("fileInfo", fileInfo);
		
		return "releaseInfo/releaseInfoDetailView.tiles";
	}
	
	// 발매정보게시판 작성 및 수정 페이지
	@RequestMapping(value="releaseInfoUpdateView.do") 
	public String releaseInfoUpdateView (ModelMap model, ReleaseInfoVO vo) {
		vo = releaseInfoService.selectReleaseInfoDetail(vo);
		model.addAttribute("releaseInfoDetail", vo);
		
		return "releaseInfo/releaseInfoUpdateView.tiles";
	}
	
	// 발매정보게시판 작성 및 수정 기능
	@RequestMapping(value="releaseInfoUpdate.do")
	public String releaseInfoUpdate (ReleaseInfoVO vo, HttpServletRequest request) throws Exception{
		releaseInfoService.updateReleaseInfo(vo, request);
		
		return "redirect:releaseInfoView.do";
	}
	
	// 발매정보게시판 삭제 기능
	@RequestMapping(value="releaseInfoDelete.do")
	public String releaseInfoDelete(ReleaseInfoVO vo) {
		releaseInfoService.deleteReleaseInfoDelete(vo);
		
		return "redirect:releaseInfoView.do";
	}
}
