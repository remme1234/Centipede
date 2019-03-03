package egovframework.example.main.service.impl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import egovframework.example.cmmn.web.JsonUtil;
import egovframework.example.login.service.LoginVO;
import egovframework.example.main.service.MainService;

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
}
