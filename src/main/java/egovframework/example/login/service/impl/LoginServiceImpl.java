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

	@Override
	public LoginVO selectLoginInfo(HttpSession session, LoginVO lvo) {
		lvo = loginMapper.selectLoginInfo(lvo);
		if(lvo != null) {
			session.setAttribute("userId", lvo.getLoginId());
			session.setAttribute("authYn", lvo.getAuthYn());
		}
		return lvo;
	}
}
