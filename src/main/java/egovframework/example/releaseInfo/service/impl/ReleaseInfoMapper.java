package egovframework.example.releaseInfo.service.impl;

import java.util.List;

import egovframework.example.util.BoardVO;
import egovframework.example.util.FileVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("ReleaseInfoMapper")
public interface ReleaseInfoMapper {
	
	List<BoardVO> selectReleaseInfoList(BoardVO vo);
	
	BoardVO selectReleaseInfoDetail(BoardVO vo);
	List<FileVO> selectFileList(BoardVO vo);

	void updateReleaseInfo(BoardVO vo);;

	void deleteReleaseInfoDelete(BoardVO vo);
	
	void addVisitCnt(BoardVO vo);
	
	void insertFile(FileVO fileVO);

	int selectRelInfoViewListCnt(BoardVO vo);
}
