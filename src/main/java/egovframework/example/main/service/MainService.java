package egovframework.example.main.service;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import egovframework.example.login.service.LoginVO;

public interface MainService {

	void selectIdCheck(HttpServletResponse response, LoginVO lvo) throws IOException;

	void insertMbr(HttpServletResponse response, LoginVO lvo) throws IOException;

}
