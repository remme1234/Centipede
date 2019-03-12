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
	
	//introduce 페이지 출력
	@RequestMapping (value="introduce.do")
	public String introduce() {
		
		return "main/introduce.tiles";
	}
	
	// myPage 입장시 본인확인을 위한 페이지 출력
	@RequestMapping (value="myPageEnter.do")
	public String myPageEnter() {
		
		return "main/myPageEnter.tiles";
	}
	
	// myPage 입장시 본인확인을 위한 비밀번호 체크
	@RequestMapping (value="pwdChk.do")
	public void pwdChk (HttpServletResponse response, LoginVO lvo) throws IOException {
		
		mainService.selectPwdChk (response,lvo);
	}
	
	// myPage 페이지 출력
	@RequestMapping (value="myPage.do")
	public String myPage(ModelMap model, LoginVO lvo) {
		
		LoginVO info = mainService.selectInfo(lvo);
		model.addAttribute("info", info);
		
		return "main/myPage.tiles";
	}
	
	// myPage 수정 기능
	@RequestMapping (value="modify.do")
	public void modify(HttpServletResponse response, LoginVO lvo) throws IOException {
		
		mainService.updateMbr(response, lvo);
	}
	
	// myPage 비밀번호 변경 기능
	@RequestMapping (value="changePwd.do")
	public void changePwd(HttpServletResponse response, LoginVO lvo) throws IOException {
		
		mainService.updatePwd(response, lvo);
	}
}
