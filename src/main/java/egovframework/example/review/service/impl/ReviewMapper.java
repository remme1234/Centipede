package egovframework.example.review.service.impl;

import java.util.List;

import egovframework.example.review.service.ReviewVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface ReviewMapper {

	List<ReviewVO> selectReviewList();
	int selectReviewListCnt();
	ReviewVO selectReviewDetailList(ReviewVO vo);


}
