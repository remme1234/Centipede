package egovframework.example.main.service.impl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import egovframework.example.cmmn.web.JsonUtil;
import egovframework.example.login.service.LoginVO;
import egovframework.example.main.service.MainService;
import egovframework.example.util.BoardVO;

@Service
public class MainServiceImpl implements MainService { 
	
	@Resource
	private MainMapper mainMapper;

	
	// 아이디 check
	@Override
	public void selectIdCheck(HttpServletResponse response, LoginVO lvo) throws IOException {
		int cnt = mainMapper.selectIdCheck(lvo);
		
		HashMap<String, Object> resMap = new HashMap<String, Object>();
		
		if (cnt > 0) {
			resMap.put("result", "false");
		} else {
			if (lvo.getLoginId().equals("")) {
				resMap.put("result", "none");
			} else {
				resMap.put("result", "true");
			}
		}
		
		response.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		
		String resultMapToJson = JsonUtil.HashMapToJson(resMap);
		
		out.write(resultMapToJson);
	}

	// 회원가입 기능
	@Override
	public void insertMbr(HttpServletResponse response, LoginVO lvo) throws IOException {
		int cnt = mainMapper.insertMbr(lvo);
		
		HashMap<String, Object> resMap = new HashMap<String, Object>();
		
		if (cnt > 0) {
			//가입완료
			resMap.put("result", "true");
		} else {
			//오류
			resMap.put("result", "false");
		}
		
		response.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		
		String resultMapToJson = JsonUtil.HashMapToJson(resMap);
		
		out.write(resultMapToJson);
	}

	// release info 데이터 호출
	@Override
	public List<BoardVO> selectReleaseInfoList() {
		return mainMapper.selectReleaseInfoList();
	}

	// notice 데이터 호출	
	@Override
	public List<BoardVO> selectNoticeList() {
		return mainMapper.selectNoticeList();
	}

	// review 데이터 호출	
	@Override
	public List<BoardVO> selectReviewList() {
		return mainMapper.selectReviewList();
	}
	
	// myPage 입장시 본인확인을 위한 비밀번호 체크
	@Override
	public void selectPwdChk(HttpServletResponse response, LoginVO lvo) throws IOException {
		
		int cnt = mainMapper.selectPwdChk(lvo);
		
		HashMap<String, Object> resMap = new HashMap<String, Object>();
		
		if (cnt > 0) {
			// 비밀번호 체크결과 일치한다면 true
			resMap.put("result", "true");
		} else {
			// 비일치 false
			resMap.put("result", "false");
		}
		
		response.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		
		String resultMapToJson = JsonUtil.HashMapToJson(resMap);
		
		out.write(resultMapToJson);
	}
	
	// myPage 페이지 출력
	@Override
	public LoginVO selectInfo(LoginVO lvo) {
		return mainMapper.selectInfo(lvo);
	}
	
	// myPage 수정 기능
	@Override
	public void updateMbr(HttpServletResponse response, LoginVO lvo) throws IOException {
		int cnt = mainMapper.updateMbr(lvo);
		
		HashMap<String, Object> resMap = new HashMap<String, Object>();
		
		if (cnt > 0) {
			//수정완료
			resMap.put("result", "true");
		} else {
			//오류
			resMap.put("result", "false");
		}
		
		response.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		
		String resultMapToJson = JsonUtil.HashMapToJson(resMap);
		
		out.write(resultMapToJson);
	}

	// myPage 비밀번호 변경 기능
	@Override
	public void updatePwd(HttpServletResponse response, LoginVO lvo) throws IOException {
		
		int cnt = mainMapper.updatePwd(lvo);
		
		HashMap<String, Object> resMap = new HashMap<String, Object>();
		
		if (cnt > 0) {
			//비밀번호 변경 완료
			resMap.put("result", "true");
		} else {
			//오류
			resMap.put("result", "false");
		}
		
		response.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		
		String resultMapToJson = JsonUtil.HashMapToJson(resMap);
		
		out.write(resultMapToJson);
	}

}
