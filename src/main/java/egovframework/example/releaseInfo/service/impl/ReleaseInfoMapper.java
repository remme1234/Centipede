package egovframework.example.releaseInfo.service.impl;

import java.util.List;

import egovframework.example.releaseInfo.service.ReleaseInfoVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("ReleaseInfoMapper")
public interface ReleaseInfoMapper {
	
	List<ReleaseInfoVO> selectReleaseInfoList();
	int selectReleaseInfoListCnt();

	ReleaseInfoVO selectReleaseInfoDetail(ReleaseInfoVO vo);

	void updateReleaseInfo(ReleaseInfoVO vo);

	void deleteReleaseInfoDelete(ReleaseInfoVO vo);
	
	void addVisitCnt(ReleaseInfoVO vo);
}
