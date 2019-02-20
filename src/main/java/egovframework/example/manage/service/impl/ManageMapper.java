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
	void insertFile(FileVO fileVO) ;
	
	void deleteReleaseInfoDisable(BoardVO vo);
	
	void deleteReleaseInfdelete(BoardVO vo);
	
	// 이하 review
	List<BoardVO> selectMngRevInfoList(BoardVO vo);

	BoardVO selectReviewDetail(BoardVO vo);
	
	void updateReview(BoardVO vo);
	
	void deleteReviewDisable(BoardVO vo);
	
	void mngReviewDelete(BoardVO vo);
	
	//이하 notice
	List<BoardVO> selectMngNotInfoList(BoardVO vo);








}
