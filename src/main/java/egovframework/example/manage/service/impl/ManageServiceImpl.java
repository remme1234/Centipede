package egovframework.example.manage.service.impl;

import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.example.manage.service.ManageService;
import egovframework.example.util.BoardVO;
import egovframework.example.util.FileUtils;
import egovframework.example.util.FileVO;

@Service
public class ManageServiceImpl implements ManageService{
	
	@Resource
	private ManageMapper manageMapper;
	
	@Resource(name="fileUtils")
    private FileUtils fileUtils;
	
	// releaseInfo 게시판 목록출력
	@Override
	public List<BoardVO> selectMngRelInfoList(BoardVO vo) {
		return manageMapper.selectMngRelInfoList(vo);
	}
	
	// releaseInfo 수정화면 출력
	@Override
	public BoardVO selectReleaseInfoDetail(BoardVO vo) {
		return manageMapper.selectReleaseInfoDetail(vo);
	}
	
	// releaseInfo 글작성 수정 update 기능 
	public void updateReleaseInfo(BoardVO vo, HttpServletRequest request) throws Exception{
		
		// releaseInfo 내용 입력한 값
		manageMapper.updateReleaseInfo(vo);
		
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
	    	 manageMapper.insertFile(list.get(i));
         }
	}
	// releaseInfo 글 숨김, 보이기 설정 
	@Override
	public void deleteReleaseInfoDisable(BoardVO vo) {
		manageMapper.deleteReleaseInfoDisable(vo);
	}
	
	// releaseInfo 글 삭제
	@Override
	public void deleteReleaseInfdelete(BoardVO vo) {
		manageMapper.deleteReleaseInfdelete(vo);
	}
	
	
	//  review 게시판 목록 출력
	@Override
	public List<BoardVO> selectMngRevInfoList(BoardVO vo) {
		return manageMapper.selectMngRevInfoList(vo);
	}
	
	// review 글작성 수정 update 기능 
	@Override
	public void updateReview(BoardVO vo, HttpServletRequest request) throws Exception {
		// review 내용 입력한 값
		manageMapper.updateReview(vo);
		
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
			manageMapper.insertFile(list.get(i));
		}		
	}
	
	// review 수정화면에 데이터 출력
	@Override
	public BoardVO selectReviewDetail(BoardVO vo) {
		return manageMapper.selectReviewDetail(vo);
	}
	
	// review 글 숨김, 보이기 설정 
	@Override
	public void deleteReviewDisable(BoardVO vo) {
		manageMapper.deleteReviewDisable(vo);
	}
	
	// review 게시글 삭제
	@Override
	public void mngReviewDelete(BoardVO vo) {
		manageMapper.mngReviewDelete(vo);
	}
	
	
	// notice 게시판 목록 출력
	@Override
	public List<BoardVO> selectMngNoticeList(BoardVO vo) {
		return manageMapper.selectMngNoticeList(vo);
	}
	
	// notice 수정화면에 데이터 출력
	@Override
	public BoardVO selectNoticeDetail(BoardVO vo) {
		return manageMapper.selectNoticeDetail(vo);
	}

	@Override
	public void updateNotice(BoardVO vo, HttpServletRequest request) throws Exception {
		// review 내용 입력한 값
		manageMapper.updateNotice(vo);
		
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
			manageMapper.insertFile(list.get(i));
		}	
	}







}
