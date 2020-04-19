package com.dh.study.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dh.common.controller.ComController;
import com.dh.study.service.StudyVO;
import com.dh.study.serviceimpl.StudyServiceimpl;

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
		// 그룹 내 댓글
		List<StudyVO> replist = new ArrayList<StudyVO>();
		replist = studyService.groupreply(groupId);
		model.addObject("replist", replist);
		return model;
	}
	
	/**
	 * 멤버별 진행상황 등록 페이지
	 * @param model
	 * @param groupId
	 * @param subtitleId
	 * @return
	 */
	@GetMapping("/studyprocess/{groupId}/{subtitleId}")
	public String studyprocess(ModelMap model, @PathVariable("groupId") String groupId, @PathVariable("subtitleId") String subtitleId) {
		// 그룹 정보
		StudyVO vo = studyService.view(groupId);
		model.addAttribute("vo",vo);	
		// 선택된 소목차 정보
		StudyVO processVO = new StudyVO();
		processVO = studyService.processview(groupId, subtitleId);
		model.addAttribute("processVO", processVO);
		// 멤버별 진행상황 정보
		List<StudyVO> list = new ArrayList<StudyVO>();
		list = studyService.progressbymember(groupId, subtitleId);
		model.addAttribute("list", list);
		return "study/studyprocess";
	} 	
	
	/**
	 * 멤버별 진행 현황 등록
	 * @param map
	 * @param vo
	 * @return
	 */
	@PostMapping("/registprogress")
	public String registprogress(ModelMap map, StudyVO vo) {
		studyService.registprogress(vo);
		return "redirect:/study/studyprocess/" + vo.getGroupId() + "/" + vo.getSubtitleId();
	}
	
	/**
	 * 소주제 등록 form페이지
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
	
	/**
	 * 	소주제등록하기
	 * @param model
	 * @param vo
	 * @return
	 */
	@PostMapping("/createstudydetail")
	public String createstudydetail(ModelMap model, StudyVO vo) {
		studyService.createstudydetail(vo);
		return "redirect:/study/view/" + vo.getGroupId();
	}
	
	/**
	 * 그룹별 질문 등록
	 * @param vo
	 * @return
	 */
	@PostMapping("/registqna")
	public String registqna(StudyVO vo) {
		studyService.registqna(vo);
		return "redirect:/study/view/" + vo.getGroupId();
	}
	
	
	 @RequestMapping("/joinrequest") 
	 public @ResponseBody String  joinrequest(StudyVO vo) {
		 int val = studyService.joinrequest(vo);
		 String result = "";
		 if(val > 0) {
			 result = "가입요청이 성공적으로 전송되었습니다.";
		 } else {
			 result = "가입요청에 실패하였습니다. 관리자에게 문의바랍니다.";
		 }
		 return result;	 
	 }
	 @RequestMapping("/test/test") 
	 public @ResponseBody String  test(StudyVO vo) {
		 System.out.println("test");
		 return "success";	 
	 }
	
}
