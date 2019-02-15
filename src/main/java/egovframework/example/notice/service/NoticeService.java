package egovframework.example.notice.service;

import java.util.List;

import egovframework.example.util.BoardVO;

public interface NoticeService {

	List<BoardVO> selectNoticeViewList(BoardVO vo);


}
