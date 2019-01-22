package egovframework.example.review.service;

import java.util.List;

public interface ReviewService {

	List<ReviewVO> selectReviewList();

	ReviewVO selectReviewDetailList(ReviewVO vo);

}
