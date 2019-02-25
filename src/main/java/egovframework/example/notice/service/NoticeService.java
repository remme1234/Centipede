package egovframework.example.notice.service;

import java.util.List;

import egovframework.example.util.BoardVO;
import egovframework.example.util.FileVO;

public interface NoticeService {

	List<BoardVO> selectNoticeViewList(BoardVO vo);

	int selectNoticeViewListCnt(BoardVO vo);

	BoardVO selectNoticeDetail(BoardVO vo);

	List<FileVO> selectFileList(BoardVO vo);

	void addVisitCnt(BoardVO vo);

}
