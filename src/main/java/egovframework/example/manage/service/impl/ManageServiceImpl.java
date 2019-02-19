package egovframework.example.manage.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.manage.service.ManageService;
import egovframework.example.util.BoardVO;

@Service
public class ManageServiceImpl implements ManageService{
	
	@Resource
	private ManageMapper manageMapper;

	@Override
	public List<BoardVO> selectMngRelInfoList(BoardVO vo) {
		return manageMapper.selectMngRelInfoList(vo);
	}

	@Override
	public List<BoardVO> selectMngRevInfoList(BoardVO vo) {
		return manageMapper.selectMngRevInfoList(vo);
	}

	@Override
	public List<BoardVO> selectMngNotInfoList(BoardVO vo) {
		return manageMapper.selectMngNotInfoList(vo);
	}
	
}
