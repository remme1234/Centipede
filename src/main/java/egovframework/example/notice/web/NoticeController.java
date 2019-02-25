package egovframework.example.notice.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.notice.service.NoticeService;
import egovframework.example.util.BoardVO;
import egovframework.example.util.FileVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class NoticeController {

	@Resource
	private NoticeService noticeService;
	
	// notice 공지사항 게시판 출력
	@RequestMapping(value="noticeView.do")
	public String noticeView(BoardVO vo, ModelMap model) {
		
		int pageIndex = vo.getPageIndex();
		if(pageIndex == 0)   vo.setPageIndex(1);

		vo.setPageUnit(10);   // rec count per page
		vo.setRecordCountPerPage(vo.getPageUnit());
		vo.setPageSize(5);   // page navi count
		vo.setFirstIndex(vo.getPageUnit() * (vo.getPageIndex()-1) + 1);
		vo.setLastIndex(vo.getPageUnit() * (vo.getPageIndex()-1) + vo.getPageUnit());

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		paginationInfo.setPageSize(vo.getPageSize());

		int totCnt = noticeService.selectNoticeViewListCnt(vo);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paging", paginationInfo);
		
		// notice 목록조회
		List<BoardVO> noticeViewList = noticeService.selectNoticeViewList(vo);
		model.addAttribute("noticeViewList", noticeViewList);
		
		return "notice/noticeView.tiles";
	}
	
	// notice 상세정보 출력
	@RequestMapping(value="noticeDetail.do")
	public String noticeDetail(BoardVO vo, ModelMap model) {
		vo = noticeService.selectNoticeDetail(vo);
		List<FileVO> fileInfo = noticeService.selectFileList(vo);
		noticeService.addVisitCnt(vo);
		
		model.addAttribute("noticeDetail", vo);
		model.addAttribute("fileInfo", fileInfo);
		
		return "notice/noticeDetailView.tiles";
	}
}
