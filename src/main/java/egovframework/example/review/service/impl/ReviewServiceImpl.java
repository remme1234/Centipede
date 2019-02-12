
package egovframework.example.review.service.impl;

import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.example.review.service.ReviewService;
import egovframework.example.review.service.ReviewVO;
import egovframework.example.util.BoardVO;
import egovframework.example.util.FileUtils;
import egovframework.example.util.FileVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Resource
	private ReviewMapper reviewMapper;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	// 리뷰 게시판 내용출력
	@Override
	public List<BoardVO> selectReviewList(BoardVO vo) {
		List<BoardVO> list = reviewMapper.selectReviewList(vo);
		// int cnt = reviewMapper.selectReviewListCnt();
		
		/*for(BoardVO vo : list) {
			vo.setCount(cnt);
			cnt -= 1;
		}*/
		
		return list;
	}
	
	// 리뷰 검색 게시판 내용출력
	@Override
	public List<BoardVO> selectReviewSearchList(BoardVO vo) {
		return reviewMapper.selectReviewSearchList(vo);
	}
	
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

	@Override
	public void deleteReviewDelete(BoardVO vo) {
		reviewMapper.deleteReviewDelete(vo);
	}
	
	
	// 리뷰게시판 게시글 및 첨부파일 등록기능
	@Override
	public void updateReview(BoardVO vo, HttpServletRequest request) throws Exception  {
		
		// 리뷰게시판 입력한 값
		reviewMapper.updateReview(vo);
		
		// 이하 파일 저장
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		
		while(iterator.hasNext()){
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if(multipartFile.isEmpty() == false){
	            System.out.println("------------- file start -------------");
	            System.out.println("name : "+multipartFile.getName());
	            System.out.println("filename : "+multipartFile.getOriginalFilename());
	            System.out.println("size : "+multipartFile.getSize());
	            System.out.println("-------------- file end --------------\n");
	       }
		}
		
		 List<FileVO> list = fileUtils.parseInsertFileInfo(vo, request);
	     for(int i=0, size=list.size(); i<size; i++){
	    	 reviewMapper.insertFile(list.get(i));
	     }
    }

	@Override
	public List<ReviewVO> selectRplCatList() {
		return reviewMapper.selectRplCatList();
	}

	@Override
	public List<EgovMap> selectRplPrdList(String param) {
		return reviewMapper.selectRplPrdList(param);
	}

	@Override
	public void rplUpdate(ReviewVO vo) {
		reviewMapper.rplUpdate(vo);
	}

	@Override
	public List<ReviewVO> selectRplDataList(BoardVO vo) {
		return reviewMapper.selectRplDataList(vo);
	}

}
