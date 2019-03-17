
package egovframework.example.review.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.review.service.ReviewService;
import egovframework.example.review.service.ReviewVO;
import egovframework.example.util.BoardVO;
import egovframework.example.util.FileVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Resource
	private ReviewMapper reviewMapper;
	
	// 리뷰 게시판 내용출력
	@Override
	public List<BoardVO> selectReviewList(BoardVO vo) {
		return reviewMapper.selectReviewList(vo);
	}
	
	// 리뷰 검색 게시판 내용출력
	@Override
	public List<BoardVO> selectReviewSearchList(BoardVO vo) {
		return reviewMapper.selectReviewSearchList(vo);
	}
	
	// 카테고리 목록 호출
	@Override
	public List<BoardVO> selectCatCdList() {
		return reviewMapper.selectCatCdList();
	}
	
	// 세부항목 내용 불러오는 메서드
	@Override
	public BoardVO selectReviewDetailList(BoardVO vo) {
		return reviewMapper.selectReviewDetailList(vo);
	}
	
	// 첨부파일 리스트를 호출하는 메서드
	@Override
	public List<FileVO> selectFileList(BoardVO vo) {
		List<FileVO> fileInfo = reviewMapper.selectFileList(vo);
		return fileInfo;
	}
	
	// 사이즈 후기에 쓰일 select 박스 호출
	@Override
	public List<ReviewVO> selectRplCatList() {
		return reviewMapper.selectRplCatList();
	}
	
	// 사이즈 후기 select Box에 쓰일 ajax 호출
	@Override
	public List<EgovMap> selectRplPrdList(String param) {
		return reviewMapper.selectRplPrdList(param);
	}

	// 리뷰게시판 사이즈 후기 리플 작성시 업데이트 기능
	@Override
	public void rplUpdate(ReviewVO vo) {
		reviewMapper.rplUpdate(vo);
	}

	// 사이즈 후기에 쓰일 select 박스 호출
	@Override
	public List<ReviewVO> selectRplDataList(ReviewVO vo) {
		return reviewMapper.selectRplDataList(vo);
	}
	
	// 조회수 증가 쿼리
	@Override
	public void addVisitCnt(BoardVO vo) {
		reviewMapper.addVisitCnt(vo);
	}
}
