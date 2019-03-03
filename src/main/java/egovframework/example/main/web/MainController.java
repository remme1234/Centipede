package egovframework.example.main.web;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.login.service.LoginVO;
import egovframework.example.main.service.MainService;

@Controller
public class MainController {
	
	@Resource
	private MainService mainService; 
	
	@RequestMapping(value="main.do")
	public String main() {
		return "main/main.tiles";
	}
	
	@RequestMapping(value="joinView.do")
	public String joinView() {
		return "main/joinView.tiles";
	}
	
	@RequestMapping(value="idCheck.do")
	public void idCheck(HttpServletResponse response, LoginVO lvo) throws IOException {
		
		mainService.selectIdCheck(response, lvo);
	}

	@RequestMapping(value="join.do")
	public void join(HttpServletResponse response, LoginVO lvo) throws IOException {
		
		mainService.insertMbr(response, lvo);
	}
	
}
