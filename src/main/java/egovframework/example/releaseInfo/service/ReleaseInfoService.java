package egovframework.example.releaseInfo.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import egovframework.example.util.BoardVO;
import egovframework.example.util.FileVO;
import egovframework.example.util.PageMakerVO;

public interface ReleaseInfoService {

	List<PageMakerVO> selectReleaseInfoList(PageMakerVO vo);

	BoardVO selectReleaseInfoDetail(BoardVO vo);
	List<FileVO> selectFileList(BoardVO vo);
	
	void updateReleaseInfo(BoardVO vo, HttpServletRequest request)throws Exception;

	void deleteReleaseInfoDelete(BoardVO vo);

	void addVisitCnt(BoardVO vo);

	int Allcount();
}
