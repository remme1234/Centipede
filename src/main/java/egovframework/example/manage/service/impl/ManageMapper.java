package egovframework.example.manage.service.impl;

import java.util.List;

import egovframework.example.util.BoardVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface ManageMapper {

	List<BoardVO> selectMngRelInfoList(BoardVO vo);

	List<BoardVO> selectMngRevInfoList(BoardVO vo);

	List<BoardVO> selectMngNotInfoList(BoardVO vo);

}
