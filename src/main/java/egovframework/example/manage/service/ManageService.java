package egovframework.example.manage.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import egovframework.example.util.BoardVO;

public interface ManageService {

	List<BoardVO> selectMngRelInfoList(BoardVO vo);

	BoardVO selectReleaseInfoDetail(BoardVO vo);

	void updateReleaseInfo(BoardVO vo, HttpServletRequest request) throws Exception ;

	void deleteReleaseInfoDisable(BoardVO vo);
	
	void deleteReleaseInfdelete(BoardVO vo);
	
	List<BoardVO> selectMngRevInfoList(BoardVO vo);
	
	List<BoardVO> selectMngNotInfoList(BoardVO vo);


}
