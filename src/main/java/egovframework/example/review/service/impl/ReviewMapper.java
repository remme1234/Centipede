package egovframework.example.review.service.impl;

import java.util.List;

import egovframework.example.util.BoardVO;
import egovframework.example.util.FileVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface ReviewMapper {

	List<BoardVO> selectReviewList();
	List<BoardVO> selectCatCdList();
	int selectReviewListCnt();
	
	BoardVO selectReviewDetailList(BoardVO vo);
	List<FileVO> selectFileList(BoardVO vo);
	
	void deleteReviewDelete(BoardVO vo);
	
	void updateReview(BoardVO vo);
	void insertFile(FileVO fileVO);
}
