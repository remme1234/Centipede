package egovframework.example.main.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import egovframework.example.login.service.LoginVO;
import egovframework.example.util.BoardVO;

public interface MainService {

	void selectIdCheck(HttpServletResponse response, LoginVO lvo) throws IOException;

	void insertMbr(HttpServletResponse response, LoginVO lvo) throws IOException;

	List<BoardVO> selectReleaseInfoList();

	List<BoardVO> selectNoticeList();

	List<BoardVO> selectReviewList();

}
