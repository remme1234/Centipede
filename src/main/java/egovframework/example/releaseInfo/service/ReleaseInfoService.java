package egovframework.example.releaseInfo.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import egovframework.example.util.FileVO;

public interface ReleaseInfoService {

	List<ReleaseInfoVO> selectReleaseInfoList();

	ReleaseInfoVO selectReleaseInfoDetail(ReleaseInfoVO vo);
	List<FileVO> selectFileList();

	void updateReleaseInfo(ReleaseInfoVO vo, HttpServletRequest request)throws Exception;

	void deleteReleaseInfoDelete(ReleaseInfoVO vo);

	void addVisitCnt(ReleaseInfoVO vo);


}
