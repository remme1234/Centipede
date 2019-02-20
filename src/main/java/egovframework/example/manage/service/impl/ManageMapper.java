package egovframework.example.manage.service.impl;

import java.util.List;

import egovframework.example.util.BoardVO;
import egovframework.example.util.FileVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface ManageMapper {

	List<BoardVO> selectMngRelInfoList(BoardVO vo);

	BoardVO selectReleaseInfoDetail(BoardVO vo);
	
	void updateReleaseInfo(BoardVO vo);
	void insertFile(FileVO fileVO) ;
	
	void deleteReleaseInfoDisable(BoardVO vo);
	
	void deleteReleaseInfdelete(BoardVO vo);
	
	
	
	
	
	
	List<BoardVO> selectMngRevInfoList(BoardVO vo);

	List<BoardVO> selectMngNotInfoList(BoardVO vo);




}
