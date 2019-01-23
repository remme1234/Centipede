package egovframework.example.review.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.review.service.ReviewService;
import egovframework.example.review.service.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Resource
	private ReviewMapper reviewMapper;
	
	@Override
	public List<ReviewVO> selectReviewList() {
		List<ReviewVO> list = reviewMapper.selectReviewList();
		int cnt = reviewMapper.selectReviewListCnt();
		
		for(ReviewVO vo : list) {
			vo.setCount(cnt);
			cnt -= 1;
		}
		
		return list;
	}

	@Override
	public ReviewVO selectReviewDetailList(ReviewVO vo) {
		return reviewMapper.selectReviewDetailList(vo);
	}

	@Override
	public void deleteReviewDelete(ReviewVO vo) {
		reviewMapper.deleteReviewDelete(vo);
	}
}
