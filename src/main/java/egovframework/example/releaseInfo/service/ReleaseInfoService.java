package egovframework.example.releaseInfo.service;

import java.util.List;

public interface ReleaseInfoService {

	List<ReleaseInfoVO> selectReleaseInfoList();

	ReleaseInfoVO selectReleaseInfoDetail(ReleaseInfoVO vo);

	void updateReleaseInfo(ReleaseInfoVO vo);

	void deleteReleaseInfoDelete(ReleaseInfoVO vo);

	void addVisitCnt(ReleaseInfoVO vo);
}
