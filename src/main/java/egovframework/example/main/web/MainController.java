package egovframework.example.main.web;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.login.service.LoginVO;
import egovframework.example.main.service.MainService;
import egovframework.example.util.BoardVO;

@Controller
public class MainController {
	
	@Resource
	private MainService mainService; 
	
	
	// 메인페이지 출력
	@RequestMapping(value="main.do")
	public String main(ModelMap model) {
		
		List<BoardVO> relInfo 	= mainService.selectReleaseInfoList();
		List<BoardVO> notice 	= mainService.selectNoticeList();
		List<BoardVO> review 	= mainService.selectReviewList();
		
		model.addAttribute("relInfo", relInfo);
		model.addAttribute("notice", notice);
		model.addAttribute("review", review);
		
		return "main/main.tiles";
	}
	
	// 회원가입 페이지 출력
	@RequestMapping(value="joinView.do")
	public String joinView() {
		return "main/joinView.tiles";
	}
	
	// 아이디 check
	@RequestMapping(value="idCheck.do")
	public void idCheck(HttpServletResponse response, LoginVO lvo) throws IOException {
		
		mainService.selectIdCheck(response, lvo);
	}

	// 회원가입 기능
	@RequestMapping(value="join.do")
	public void join(HttpServletResponse response, LoginVO lvo) throws IOException {
		
		mainService.insertMbr(response, lvo);
	}
	
}
