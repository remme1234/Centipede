package egovframework.example.releaseInfo.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface ReleaseInfoService {

	List<ReleaseInfoVO> selectReleaseInfoList();

	ReleaseInfoVO selectReleaseInfoDetail(ReleaseInfoVO vo);

	void updateReleaseInfo(ReleaseInfoVO vo, HttpServletRequest request)throws Exception;

	void deleteReleaseInfoDelete(ReleaseInfoVO vo);

	void addVisitCnt(ReleaseInfoVO vo);
}
