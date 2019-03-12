package egovframework.example.main.service.impl;

import java.util.List;

import egovframework.example.login.service.LoginVO;
import egovframework.example.util.BoardVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface MainMapper {

	int selectIdCheck(LoginVO lvo) ;

	int insertMbr(LoginVO lvo);

	List<BoardVO> selectReleaseInfoList();

	List<BoardVO> selectNoticeList();

	List<BoardVO> selectReviewList();

	int updateMbr(LoginVO lvo);

	int selectPwdChk(LoginVO lvo);

	int updatePwd(LoginVO lvo);

	LoginVO selectInfo(LoginVO lvo);

}
