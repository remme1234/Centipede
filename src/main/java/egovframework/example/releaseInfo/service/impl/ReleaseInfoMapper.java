package egovframework.example.releaseInfo.service.impl;

import java.util.List;

import egovframework.example.util.BoardVO;
import egovframework.example.util.FileVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("ReleaseInfoMapper")
public interface ReleaseInfoMapper {
	
	// 발매정보게시판 리스트 
	List<BoardVO> selectReleaseInfoList(BoardVO vo);
	
	// 발매정보게시판 상세정보 조회
	BoardVO selectReleaseInfoDetail(BoardVO vo);
	
	// 첨부파일 리스트를 호출하는 메서드
	List<FileVO> selectFileList(BoardVO vo);

	// 조회수 증가
	void addVisitCnt(BoardVO vo);
	
	// 페이징 처리
	int selectRelInfoViewListCnt(BoardVO vo);
}
