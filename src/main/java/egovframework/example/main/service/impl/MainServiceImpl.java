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

	
	// 본인확인 위한 비밀번호 select ajax
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
	
	// 개인정보 수정 ajax
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


	@Override
	public LoginVO selectInfo(LoginVO lvo) {
		return mainMapper.selectInfo(lvo);
	}
}
