package egovframework.example.notice.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.notice.service.NoticeService;
import egovframework.example.util.BoardVO;
import egovframework.example.util.FileVO;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Resource
	private NoticeMapper noticeMapper;
	
	// 게시글 출력
	@Override
	public List<BoardVO> selectNoticeViewList(BoardVO vo) {
		return noticeMapper.selectNoticeViewList(vo);
	}
	
	// 페이징 처리를 위한 최대 게시물 수
	@Override
	public int selectNoticeViewListCnt(BoardVO vo) {
		return noticeMapper.selectNoticeViewListCnt(vo);
	}

	// 상세정보 출력
	@Override
	public BoardVO selectNoticeDetail(BoardVO vo) {
		return noticeMapper.selectNoticeDetail(vo);
	}
	
	// 상세정보에 쓰일 파일정보 
	@Override
	public List<FileVO> selectFileList(BoardVO vo) {
		return noticeMapper.selectFileList(vo);
	}
	
	// 조회수 증가
	@Override
	public void addVisitCnt(BoardVO vo) {
		noticeMapper.addVisitCnt(vo);
	}

}
