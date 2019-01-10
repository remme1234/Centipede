package egovframework.example.releaseInfo.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.releaseInfo.service.ReleaseInfoService;
import egovframework.example.releaseInfo.service.ReleaseInfoVO;

@Service("ReleaseInfoService")
public class ReleaseInfoServiceImpl implements ReleaseInfoService {

	@Resource
	private ReleaseInfoMapper releaseInfoMapper;
	
	@Override
	public List<ReleaseInfoVO> selectReleaseInfoList(){
		List<ReleaseInfoVO> list = releaseInfoMapper.selectReleaseInfoList();
		int cnt = releaseInfoMapper.selectReleaseInfoListCnt();
		
		for(ReleaseInfoVO vo : list) {
			vo.setCount(cnt);
			cnt -= 1;
		}
		
		return list;
	}
	
	@Override
	public ReleaseInfoVO selectReleaseInfoDetail(ReleaseInfoVO vo) {
		return releaseInfoMapper.selectReleaseInfoDetail(vo);
	}

	@Override
	public void updateReleaseInfo(ReleaseInfoVO vo) {
		releaseInfoMapper.updateReleaseInfo(vo);
	}

	@Override
	public void deleteReleaseInfoDelete(ReleaseInfoVO vo) {
		releaseInfoMapper.deleteReleaseInfoDelete(vo);
	}

	@Override
	public void addVisitCnt(ReleaseInfoVO vo) {
		releaseInfoMapper.addVisitCnt(vo);
	}
}
