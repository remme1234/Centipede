package egovframework.example.releaseInfo.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.releaseInfo.service.ReleaseInfoService;
import egovframework.example.util.BoardVO;
import egovframework.example.util.FileVO;

@Service("ReleaseInfoService")
public class ReleaseInfoServiceImpl implements ReleaseInfoService {

	@Resource
	private ReleaseInfoMapper releaseInfoMapper;
	

	// 발매정보게시판 리스트 
	@Override
	public List<BoardVO> selectReleaseInfoList(BoardVO vo){
		return releaseInfoMapper.selectReleaseInfoList(vo);
	}
	
	// 발매정보게시판 상세정보 조회
	@Override
	public BoardVO selectReleaseInfoDetail(BoardVO vo) {
		return releaseInfoMapper.selectReleaseInfoDetail(vo);
	}
	
	// 첨부파일 리스트를 호출하는 메서드
	@Override
	public List<FileVO> selectFileList(BoardVO vo) {
		List<FileVO> fileInfo = releaseInfoMapper.selectFileList(vo);
		return fileInfo;
	}

	// 조회수 증가
	@Override
	public void addVisitCnt(BoardVO vo) {
		releaseInfoMapper.addVisitCnt(vo);
	}
	
	// 페이징 처리
	@Override
	public int selectRelInfoViewListCnt(BoardVO vo) {
		return releaseInfoMapper.selectRelInfoViewListCnt(vo);
	}
}
