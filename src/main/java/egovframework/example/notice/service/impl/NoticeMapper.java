package egovframework.example.notice.service.impl;

import java.util.List;

import egovframework.example.util.BoardVO;
import egovframework.example.util.FileVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface NoticeMapper {

	List<BoardVO> selectNoticeViewList(BoardVO vo);

	int selectNoticeViewListCnt(BoardVO vo);

	BoardVO selectNoticeDetail(BoardVO vo);

	List<FileVO> selectFileList(BoardVO vo);

	void addVisitCnt(BoardVO vo);

}
