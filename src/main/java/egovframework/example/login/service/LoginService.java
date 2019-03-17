package egovframework.example.login.service;

import javax.servlet.http.HttpSession;

public interface LoginService {

	// 로그인 정보 확인
	LoginVO selectLoginInfo(HttpSession session, LoginVO vo);

}
