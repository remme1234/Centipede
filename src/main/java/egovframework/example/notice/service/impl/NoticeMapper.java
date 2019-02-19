package egovframework.example.notice.service.impl;

import java.util.List;

import egovframework.example.util.BoardVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface NoticeMapper {

	List<BoardVO> selectNoticeViewList(BoardVO vo);

}
