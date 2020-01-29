package com.study.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.controller.ComController;
import com.study.service.StudyVO;
import com.study.serviceimpl.StudyServiceimpl;

@Controller
@RequestMapping("/study")
public class StudyController extends ComController<StudyServiceimpl, StudyVO>{
	//web-inf 밑의 jsp가 루트 경로
	
	@Autowired
	StudyServiceimpl studyService;
	
	public StudyController() {
	}

	/**
	 * 그룹 목록
	 * @param model
	 * @param vo
	 * @return
	 */
	@GetMapping("/studylist")
	public String join(ModelMap model, StudyVO vo) {
		List<StudyVO> list = new ArrayList<StudyVO>();
		list = studyService.studylist(vo);
		model.addAttribute("list", list);
		return "study/studylist";
	} 
	
	/**
	 * 스터디 만들기 jsp 페이지 포워딩
	 * @param model
	 * @param vo
	 * @return
	 */
	@GetMapping("/createstudy")
	public String creatstudy(ModelAndView model) {				
		return "study/createstudy";
	} 
	
	/**
	 * 스터디 만들기 jsp 페이지 포워딩
	 * @param model
	 * @param vo
	 * @return
	 */
	@PostMapping("/createstudy")
	public String creatstudy(ModelAndView model, StudyVO vo) {
		studyService.createstudy(vo);
		return "redirect:/study/studylist";
	} 
	
	/**
	 * 스터디 그룹 가입
	 * @param model
	 * @param vo
	 * @return
	 */
	@GetMapping("/joinstudy")
	public String joinstudy(ModelAndView model, StudyVO vo) {			
		return "redirect:study/studylist";
	}
	
	/**
	 * 스터디 그룹 상세보기
	 * @param model
	 * @param vo
	 * @return
	 */
	@GetMapping("/view/{groupId}")
	public ModelAndView view(ModelAndView model, @PathVariable("groupId") String groupId) {
		StudyVO vo = studyService.view(groupId);
		List<StudyVO> sublist = new ArrayList<StudyVO>();
		sublist = studyService.detailview(groupId);
		model.addObject("vo", vo);
		model.addObject("sublist", sublist);
		model.setViewName("study/studydetail");
		return model;
	}
	/**
	 * 멤버별 진행상황 등록
	 * @param model
	 * @param groupId
	 * @param subtitleId
	 * @return
	 */
	@GetMapping("/studyprocess/{groupId}/{subtitleId}")
	public String studyprocess(ModelMap model, @PathVariable("groupId") String groupId, @PathVariable("subtitleId") String subtitleId) {
		StudyVO vo = studyService.view(groupId);
		model.addAttribute("", "");
		
		return "study/studyprocess";
	} 	
	
	/**
	 * 소주제 등록하기 form페이지
	 * @param model
	 * @param groupId
	 * @return
	 */
	@GetMapping("/createstudydetail/{groupId}")
	public String createstudydetail(ModelMap model, @PathVariable("groupId") String groupId) {
		StudyVO vo = studyService.view(groupId);
		model.addAttribute("vo",vo);		
		List<StudyVO> sublist = new ArrayList<StudyVO>();
		sublist = studyService.detailview(groupId);
		model.addAttribute("sublist", sublist);
		return "study/createstudydetail";
	}
	
	@PostMapping("/createstudydetail")
	public String createstudydetail(ModelMap model, StudyVO vo) {
		studyService.createstudydetail(vo);
		return "redirect:/study/view/" + vo.getGroupId();
	}
	
}
