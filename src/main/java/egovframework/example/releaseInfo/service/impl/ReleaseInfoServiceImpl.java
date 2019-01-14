package egovframework.example.releaseInfo.service.impl;

import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.example.releaseInfo.service.ReleaseInfoService;
import egovframework.example.releaseInfo.service.ReleaseInfoVO;
import egovframework.example.util.FileUtils;
import egovframework.example.util.FileVO;

@Service("ReleaseInfoService")
public class ReleaseInfoServiceImpl implements ReleaseInfoService {

	@Resource
	private ReleaseInfoMapper releaseInfoMapper;
	
	@Resource(name="fileUtils")
    private FileUtils fileUtils;

	
	@Override
	public List<ReleaseInfoVO> selectReleaseInfoList(){
		List<ReleaseInfoVO> list = releaseInfoMapper.selectReleaseInfoList();
		int cnt = releaseInfoMapper.selectReleaseInfoListCnt();
		
		// 게시글 번호 설정
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
	
	// 첨부파일 리스트를 호출하는 메서드
	@Override
	public List<FileVO> selectFileList(ReleaseInfoVO vo) {
		List<FileVO> fileInfo = releaseInfoMapper.selectFileList(vo);
		return fileInfo;
	}
	
	// 발매정보 게시글 입력기능 , 첨부파일 등록 기능
	@Override
	public void updateReleaseInfo(ReleaseInfoVO vo, HttpServletRequest request) throws Exception {
		releaseInfoMapper.updateReleaseInfo(vo);
		
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
	public void deleteReleaseInfoDelete(ReleaseInfoVO vo) {
		releaseInfoMapper.deleteReleaseInfoDelete(vo);
	}

	@Override
	public void addVisitCnt(ReleaseInfoVO vo) {
		releaseInfoMapper.addVisitCnt(vo);
	}

}
