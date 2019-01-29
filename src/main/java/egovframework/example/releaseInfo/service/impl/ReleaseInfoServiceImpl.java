package egovframework.example.releaseInfo.service.impl;

import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.example.releaseInfo.service.ReleaseInfoService;
import egovframework.example.util.BoardVO;
import egovframework.example.util.FileUtils;
import egovframework.example.util.FileVO;

@Service("ReleaseInfoService")
public class ReleaseInfoServiceImpl implements ReleaseInfoService {

	@Resource
	private ReleaseInfoMapper releaseInfoMapper;
	
	@Resource(name="fileUtils")
    private FileUtils fileUtils;

	
	@Override
	public List<BoardVO> selectReleaseInfoList(){
		List<BoardVO> list = releaseInfoMapper.selectReleaseInfoList();
		int cnt = releaseInfoMapper.selectReleaseInfoListCnt();
		
		// 게시글 번호 설정
		for(BoardVO vo : list) {
			vo.setCount(cnt);
			cnt -= 1;
		}
		
		return list;
	}
	
	@Override
	public BoardVO selectReleaseInfoDetail(BoardVO vo) {
		return releaseInfoMapper.selectReleaseInfoDetail(vo);
	}
	
	// 첨부파일 리스트를 호출하는 메서드
	@Override
	public List<FileVO> selectFileList(BoardVO vo) {
		List<FileVO> fileInfo = releaseInfoMapper.selectFileList(vo);
		return fileInfo;
	}
	
	// 발매정보 게시판 게시글 및 첨부파일 등록기능
	@Override
	public void updateReleaseInfo(BoardVO vo, HttpServletRequest request) throws Exception {
		
		// 발매정보 입력한 값
		releaseInfoMapper.updateReleaseInfo(vo);
		
		// 이하 파일 저장
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		 
		while(iterator.hasNext()){
		       multipartFile = multipartHttpServletRequest.getFile(iterator.next());
		       if(multipartFile.isEmpty() == false){
		            System.out.println("------------- file start -------------");
		            System.out.println("name : "+multipartFile.getName());
		            System.out.println("filename : "+multipartFile.getOriginalFilename());
		            System.out.println("size : "+multipartFile.getSize());
		            System.out.println("-------------- file end --------------\n");
		       }
		}
		 
		 List<FileVO> list = fileUtils.parseInsertFileInfo(vo, request);
	     for(int i=0, size=list.size(); i<size; i++){
	    	 releaseInfoMapper.insertFile(list.get(i));
         }
	}

	@Override
	public void deleteReleaseInfoDelete(BoardVO vo) {
		releaseInfoMapper.deleteReleaseInfoDelete(vo);
	}

	@Override
	public void addVisitCnt(BoardVO vo) {
		releaseInfoMapper.addVisitCnt(vo);
	}

	

}
