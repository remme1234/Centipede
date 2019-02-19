package egovframework.example.manage.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.manage.service.ManageService;
import egovframework.example.util.BoardVO;

@Controller
public class ManageController {

	@Resource
	private ManageService manageService;
	
	@RequestMapping(value="mngRelInfoList.do")
	public String mngRelInfoList(BoardVO vo, ModelMap model) {
		
		List<BoardVO> mngRelInfoList = manageService.selectMngRelInfoList(vo);
		model.addAttribute("mngRelInfoList", mngRelInfoList);
		
		return "manage/mngRelInfoList.tiles";
	}
	
	@RequestMapping(value="mngRevInfoList.do")
	public String mngRevInfoList(BoardVO vo,ModelMap model) {
		
		List<BoardVO> mngRevInfoList = manageService.selectMngRevInfoList(vo);
		model.addAttribute("mngRevInfoList", mngRevInfoList);
		
		return "manage/mngRevInfoList.tiles";
	}
	
	@RequestMapping(value="mngNotInfoList.do")
	public String mngNotInfoList(BoardVO vo,ModelMap model) {
		
		List<BoardVO> mngNotInfoList = manageService.selectMngNotInfoList(vo);
		model.addAttribute("mngNotInfoList", mngNotInfoList);
		
		return "manage/mngNotInfoList.tiles";
	}
}
