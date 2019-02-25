package egovframework.example.manage.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import egovframework.example.util.BoardVO;

public interface ManageService {
	
	// 이하 release Info 
	List<BoardVO> selectMngRelInfoList(BoardVO vo);

	BoardVO selectReleaseInfoDetail(BoardVO vo);

	void updateReleaseInfo(BoardVO vo, HttpServletRequest request) throws Exception ;

	void deleteReleaseInfoDisable(BoardVO vo);
	
	void deleteReleaseInfdelete(BoardVO vo);
	
	
	// 이하 review 
	List<BoardVO> selectMngRevInfoList(BoardVO vo);
	
	BoardVO selectReviewDetail(BoardVO vo);
	
	void updateReview(BoardVO vo, HttpServletRequest request) throws Exception;

	void deleteReviewDisable(BoardVO vo);
	
	void mngReviewDelete(BoardVO vo);
	
	// 이하 notice
	List<BoardVO> selectMngNoticeList(BoardVO vo);

	BoardVO selectNoticeDetail(BoardVO vo);

	void updateNotice(BoardVO vo, HttpServletRequest request)throws Exception;

	void deleteNoticeDisable(BoardVO vo);

	void mngNoticeDelete(BoardVO vo);
}
