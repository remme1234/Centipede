package egovframework.example.manage.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.manage.service.ManageService;
import egovframework.example.util.BoardVO;

@Controller
public class ManageController {

	@Resource
	private ManageService manageService;
	
	@RequestMapping(value="mngRelInfoList.do")
	public String mngRelInfoList(BoardVO vo) {
		
		return "manage/mngRelInfoList.tiles";
	}
}
