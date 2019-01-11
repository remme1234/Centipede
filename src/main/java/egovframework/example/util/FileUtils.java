package egovframework.example.util;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.example.releaseInfo.service.ReleaseInfoVO;

// 어노테이션을 통해 스프링이 관리
@Component("fileUtils")
public class FileUtils {
	
	// 저장될 위치 선언
    private static final String filePath = "C:\\dev\\file\\";
    
    public List<FileVO> parseInsertFileInfo(ReleaseInfoVO vo, HttpServletRequest request) throws Exception{
        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
        Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
        
        MultipartFile multipartFile = null;
        String originFileNm = null;
        String originalFileExtension = null;
        String savedFileNm = null;
         
        // 클라이언트에서 전송된 파일정보를 반환할 list
        List<FileVO> list = new ArrayList<FileVO>();
        FileVO fvo = null;
         
        String boardUid = vo.getBoardUid();
         
        // 파일을 저장할 경로에 폴더가 없으면 폴더 생성
        File file = new File(filePath);
        if(file.exists() == false){
            file.mkdirs();
        }
        
        while(iterator.hasNext()){
            multipartFile = multipartHttpServletRequest.getFile(iterator.next());
            if(multipartFile.isEmpty() == false){
            	// 파일의 정보를 받아 새로운 이름으로 변경
            	originFileNm = multipartFile.getOriginalFilename();
                originalFileExtension = originFileNm.substring(originFileNm.lastIndexOf("."));
                savedFileNm = CommonUtils.getRandomString() + originalFileExtension;
                
                // 파일을 저장하는 부분
                file = new File(filePath + savedFileNm);
                multipartFile.transferTo(file);
                 
                // 위에서 만든 정보를 list에 추가하는 부분
                fvo = new FileVO();
                fvo.setBoardUid(boardUid);
                fvo.setOriginFileNm(originFileNm);
                fvo.setSavedFileNm(savedFileNm);
                fvo.setSavedFilePath(filePath);
                fvo.setFileSize(String.valueOf(multipartFile.getSize()));
                list.add(fvo);
            }
        }
        return list;
    }
}
