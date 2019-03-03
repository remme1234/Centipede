package egovframework.example.login.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.login.service.LoginService;
import egovframework.example.login.service.LoginVO;

@Controller
public class LoginController {
	
	@Resource
	private LoginService loginService;
	
	
	// 로그인 화면 출력
	@RequestMapping(value="loginView.do")
	public String loginView(ModelMap model, String msg) {
		if(msg != null && !msg.equals("")) {
			if(msg.equals("fail")) {
				msg = "아이디 또는 패스워드를 확인해주세요.";
			}
			model.addAttribute("msg", msg);
		}
		
		return "login/loginView.tiles";
	}
	
	// 로그인 정보 확인
	@RequestMapping(value="login.do")
	public String login(HttpSession session, LoginVO lvo) {
		if(loginService.selectLoginInfo(session, lvo) == null) {
			return "redirect:loginView.do?msg=fail";
		} else {
			return "redirect:main.do";
		}
	}
	
	// 로그아웃 
	@RequestMapping(value="logout.do")
	public String logout(HttpSession session) {
		//세션정보 삭제
		session.invalidate();
		
		return "redirect:main.do";
	}
	
}
