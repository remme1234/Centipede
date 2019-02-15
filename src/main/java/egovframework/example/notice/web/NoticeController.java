package egovframework.example.notice.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.notice.service.NoticeService;
import egovframework.example.util.BoardVO;

@Controller
public class NoticeController {
	
	@Resource
	private NoticeService noticeService;
	
	@RequestMapping(value="noticeView.do")
	public String noticeView (BoardVO vo, ModelMap model) {
		System.out.println("!!");
		
		List<BoardVO> noticeViewList = noticeService.selectNoticeViewList(vo);
		model.addAttribute("noticeViewList", noticeViewList);
		return "notice/noticeView.tiles";
	}
}
