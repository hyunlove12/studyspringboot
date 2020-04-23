package com.dh.study.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dh.common.controller.ComController;
import com.dh.study.service.StudyVO;
import com.dh.study.serviceimpl.StudyManageServiceimpl;
import com.dh.study.serviceimpl.StudyServiceimpl;

@Controller
// requestmapping 주소가 같으면 빈 생성 오류 발생 
@RequestMapping("/studymanagement")
public class StudyManageController extends ComController<StudyServiceimpl, StudyVO>{
	//web-inf 밑의 jsp가 루트 경로
	
	@Autowired
	StudyManageServiceimpl studyManageService;
	
	public StudyManageController() {
	}
	
	/**
	 * 그룹 가입 요청 리스트
	 * @param model
	 * @param vo
	 * @return
	 */
	@GetMapping("/list")
	public String managementlist(ModelMap model, StudyVO vo) {
		List<StudyVO> list = new ArrayList<StudyVO>();
		list = studyManageService.list(vo);
		model.addAttribute("list", list);
		return "studymanage/studymanagelist";
	} 
	
	
}
