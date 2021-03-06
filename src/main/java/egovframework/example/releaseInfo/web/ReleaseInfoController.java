package egovframework.example.releaseInfo.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.releaseInfo.service.ReleaseInfoService;
import egovframework.example.util.BoardVO;
import egovframework.example.util.FileVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class ReleaseInfoController {
	
	@Resource
	private ReleaseInfoService releaseInfoService;
	
	// 발매정보게시판 리스트 
	@RequestMapping(value="releaseInfoView.do")
	public String releaseInfoView (ModelMap model, BoardVO vo) {
		
		
		// 페이징 처리
		int pageIndex = vo.getPageIndex();
		if(pageIndex == 0) vo.setPageIndex(1);

		vo.setPageUnit(9);   // rec count per page
		vo.setRecordCountPerPage(vo.getPageUnit());
		vo.setPageSize(5);   // page navi count
		vo.setFirstIndex(vo.getPageUnit() * (vo.getPageIndex()-1));

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		paginationInfo.setPageSize(vo.getPageSize());

		int totCnt = releaseInfoService.selectRelInfoViewListCnt(vo);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paging", paginationInfo);
		
		System.out.println(totCnt);
		System.out.println(vo.getFirstIndex());
		
		// 목록 조회
		List<BoardVO> releaseInfoList = releaseInfoService.selectReleaseInfoList(vo);
		model.addAttribute("releaseInfoList", releaseInfoList);
		
		return "releaseInfo/releaseInfoView.tiles";
	}
	
	// 발매정보게시판 상세정보 조회
	@RequestMapping(value="releaseInfoDetailView.do") 
	public String releaseInfoDetailView (ModelMap model, BoardVO vo) {
		
		// 상세정보 조회
		vo = releaseInfoService.selectReleaseInfoDetail(vo);
		// 첨부파일정보 조회
		List<FileVO> fileInfo = releaseInfoService.selectFileList(vo);
		
		// 조회수 증가
		releaseInfoService.addVisitCnt(vo);
		model.addAttribute("releaseInfoDetail", vo);
		model.addAttribute("fileInfo", fileInfo);
		
		return "releaseInfo/releaseInfoDetailView.tiles";
	}
}
