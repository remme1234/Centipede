package egovframework.example.login.service.impl;

import egovframework.example.login.service.LoginVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface LoginMapper {
	
	// 로그인 정보 확인
	LoginVO selectLoginInfo(LoginVO lvo);

}
