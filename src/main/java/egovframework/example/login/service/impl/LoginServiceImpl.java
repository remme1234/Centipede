package egovframework.example.login.service.impl;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import egovframework.example.login.service.LoginService;
import egovframework.example.login.service.LoginVO;

@Service
public class LoginServiceImpl implements LoginService{

	@Resource
	private LoginMapper loginMapper;

	// 로그인 정보 확인
	@Override
	public LoginVO selectLoginInfo(HttpSession session, LoginVO lvo) {
		lvo = loginMapper.selectLoginInfo(lvo);
		if(lvo != null) {
			
			// 세션정보 세팅
			session.setAttribute("userId", lvo.getLoginId());
			session.setAttribute("authYn", lvo.getAuthYn());
			session.setAttribute("email", lvo.getEmail());
			session.setAttribute("cpNo", lvo.getCpNo());
			session.setAttribute("pwd", lvo.getPwd());

		}
		return lvo;
	}
}
