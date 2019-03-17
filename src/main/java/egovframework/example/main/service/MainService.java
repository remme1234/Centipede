package egovframework.example.main.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import egovframework.example.login.service.LoginVO;
import egovframework.example.util.BoardVO;

public interface MainService {

	// 메인페이지 출력
	List<BoardVO> selectReleaseInfoList();
	List<BoardVO> selectNoticeList();
	List<BoardVO> selectReviewList();
	
	// 아이디 check
	void selectIdCheck(HttpServletResponse response, LoginVO lvo) throws IOException;

	// 회원가입 기능
	void insertMbr(HttpServletResponse response, LoginVO lvo) throws IOException;

	// myPage 입장시 본인확인을 위한 비밀번호 체크
	void selectPwdChk(HttpServletResponse response, LoginVO lvo) throws IOException;

	// myPage 페이지 출력
	LoginVO selectInfo(LoginVO lvo);
	
	// myPage 수정 기능
	void updateMbr(HttpServletResponse response, LoginVO lvo) throws IOException;

	// myPage 비밀번호 변경 기능
	void updatePwd(HttpServletResponse response, LoginVO lvo) throws IOException;


}
