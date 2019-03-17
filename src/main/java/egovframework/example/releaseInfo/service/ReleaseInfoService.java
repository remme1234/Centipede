package egovframework.example.releaseInfo.service;

import java.util.List;

import egovframework.example.util.BoardVO;
import egovframework.example.util.FileVO;

public interface ReleaseInfoService {

	// 발매정보게시판 리스트 
	List<BoardVO> selectReleaseInfoList(BoardVO vo);

	// 페이징 처리
	int selectRelInfoViewListCnt(BoardVO vo);
	
	// 발매정보게시판 상세정보 조회
	BoardVO selectReleaseInfoDetail(BoardVO vo);
	List<FileVO> selectFileList(BoardVO vo);

	// 조회수 증가
	void addVisitCnt(BoardVO vo);
}
