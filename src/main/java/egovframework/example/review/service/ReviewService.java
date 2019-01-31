package egovframework.example.review.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import egovframework.example.util.BoardVO;
import egovframework.example.util.FileVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface ReviewService {

	List<BoardVO> selectReviewList(BoardVO vo);

	BoardVO selectReviewDetailList(BoardVO vo);
	List<FileVO> selectFileList(BoardVO vo);
	void deleteReviewDelete(BoardVO vo);

	void updateReview(BoardVO vo, HttpServletRequest request) throws Exception;

	List<BoardVO> selectCatCdList();

	List<ReviewVO> selectRplCatList();

	List<EgovMap> selectRplPrdList(String param);

	void rplUpdate(ReviewVO vo);
}
