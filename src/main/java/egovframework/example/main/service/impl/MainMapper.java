package egovframework.example.main.service.impl;

import java.util.List;

import egovframework.example.login.service.LoginVO;
import egovframework.example.util.BoardVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface MainMapper {

	// 메인페이지 출력
	List<BoardVO> selectReleaseInfoList();
	List<BoardVO> selectNoticeList();
	List<BoardVO> selectReviewList();
	
	// 아이디 check
	int selectIdCheck(LoginVO lvo) ;

	// 회원가입 기능
	int insertMbr(LoginVO lvo);

	// myPage 입장시 본인확인을 위한 비밀번호 체크
	int selectPwdChk(LoginVO lvo);

	// myPage 페이지 출력
	LoginVO selectInfo(LoginVO lvo);
	
	// myPage 수정 기능
	int updateMbr(LoginVO lvo);

	// myPage 비밀번호 변경 기능
	int updatePwd(LoginVO lvo);


}
