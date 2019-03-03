package egovframework.example.main.service.impl;

import egovframework.example.login.service.LoginVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface MainMapper {

	int selectIdCheck(LoginVO lvo) ;

	int insertMbr(LoginVO lvo);

}
