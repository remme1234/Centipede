package egovframework.example.manage.service.impl;

import java.util.List;

import egovframework.example.util.BoardVO;
import egovframework.example.util.FileVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface ManageMapper {
	
	// 이하 release Info 
	List<BoardVO> selectMngRelInfoList(BoardVO vo);

	BoardVO selectReleaseInfoDetail(BoardVO vo);
	
	void updateReleaseInfo(BoardVO vo);
	
	void deleteReleaseInfoDisable(BoardVO vo);
	
	void deleteReleaseInfdelete(BoardVO vo);
	
	// 이하 review
	List<BoardVO> selectMngRevInfoList(BoardVO vo);

	BoardVO selectReviewDetail(BoardVO vo);
	
	void updateReview(BoardVO vo);
	
	void deleteReviewDisable(BoardVO vo);
	
	void mngReviewDelete(BoardVO vo);
	
	//이하 notice
	List<BoardVO> selectMngNoticeList(BoardVO vo);

	BoardVO selectNoticeDetail(BoardVO vo);

	void updateNotice(BoardVO vo);

	// 파일 insert 공통 메서드
	void insertFile(FileVO fileVO) ;






}
