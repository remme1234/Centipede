package egovframework.example.review.service.impl;

import java.util.List;

import egovframework.example.review.service.ReviewVO;
import egovframework.example.util.BoardVO;
import egovframework.example.util.FileVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper
public interface ReviewMapper {

	List<BoardVO> selectReviewList(BoardVO vo);
	List<BoardVO> selectCatCdList();
	int selectReviewListCnt();
	
	BoardVO selectReviewDetailList(BoardVO vo);
	List<FileVO> selectFileList(BoardVO vo);
	List<ReviewVO> selectRplCatList();
	
	void deleteReviewDelete(BoardVO vo);
	
	void updateReview(BoardVO vo);
	void insertFile(FileVO fileVO);
	List<EgovMap> selectRplPrdList(String param);
	
	void rplUpdate(ReviewVO vo);
}
