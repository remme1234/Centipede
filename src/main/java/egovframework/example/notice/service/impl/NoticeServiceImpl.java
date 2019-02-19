package egovframework.example.notice.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.notice.service.NoticeService;
import egovframework.example.util.BoardVO;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Resource
	private NoticeMapper noticeMapper;

	@Override
	public List<BoardVO> selectNoticeViewList(BoardVO vo) {
		return noticeMapper.selectNoticeViewList(vo);
	}

}
