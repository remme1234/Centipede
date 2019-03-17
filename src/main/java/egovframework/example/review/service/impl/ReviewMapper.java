package egovframework.example.review.service.impl;

import java.util.List;

import egovframework.example.review.service.ReviewVO;
import egovframework.example.util.BoardVO;
import egovframework.example.util.FileVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper
public interface ReviewMapper {

	// 리뷰게시판 리스트
	List<BoardVO> selectReviewList(BoardVO vo);
	List<BoardVO> selectCatCdList();
	
	// 리뷰게시판 검색 리스트
	List<BoardVO> selectReviewSearchList(BoardVO vo);
	
	// 리뷰게시판 상세정보 조회
	BoardVO selectReviewDetailList(BoardVO vo);
	List<FileVO> selectFileList(BoardVO vo);
	List<ReviewVO> selectRplDataList(ReviewVO vo);
	
	// 조회수 증가
	void addVisitCnt(BoardVO vo);
	
	// 사이즈 후기에 쓰일 select박스 내용 호출
	List<ReviewVO> selectRplCatList();
	List<EgovMap> selectRplPrdList(String param);
	
	// 리뷰게시판 사이즈 후기 리플 작성시 업데이트 기능
	void rplUpdate(ReviewVO vo);
}
