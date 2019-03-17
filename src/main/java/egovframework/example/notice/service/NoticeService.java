package egovframework.example.notice.service;

import java.util.List;

import egovframework.example.util.BoardVO;
import egovframework.example.util.FileVO;

public interface NoticeService {

	// notice 공지사항 게시판 출력
	List<BoardVO> selectNoticeViewList(BoardVO vo);

	// 페이징 처리
	int selectNoticeViewListCnt(BoardVO vo);

	// notice 상세정보 출력
	BoardVO selectNoticeDetail(BoardVO vo);

	// 파일 리스트 출력
	List<FileVO> selectFileList(BoardVO vo);

	// 조회수 증가
	void addVisitCnt(BoardVO vo);

}
