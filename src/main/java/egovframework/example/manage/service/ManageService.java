package egovframework.example.manage.service;

import java.util.List;

import egovframework.example.util.BoardVO;

public interface ManageService {

	List<BoardVO> selectMngRelInfoList(BoardVO vo);

	List<BoardVO> selectMngRevInfoList(BoardVO vo);

	List<BoardVO> selectMngNotInfoList(BoardVO vo);

}
