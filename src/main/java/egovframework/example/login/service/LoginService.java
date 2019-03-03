package egovframework.example.login.service;

import javax.servlet.http.HttpSession;

public interface LoginService {

	LoginVO selectLoginInfo(HttpSession session, LoginVO vo);

}
