package com.dh.study.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.annotation.Auth;
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
	
	/**
	 * 
	 * 그룹 가입 요청 메시지 리슽
	 * @param model
	 * @param vo
	 * @return
	 */
	@GetMapping("/sendrequestlist")
	public String sendRequestList(ModelMap model, StudyVO vo) {
		List<StudyVO> sendrequestlist = new ArrayList<StudyVO>();
		sendrequestlist = studyManageService.sendRequestList(vo);
		model.addAttribute("sendrequestlist", sendrequestlist);
		return "studymanage/sendrequestlist";
	} 
	
	/**
	 * 
	 * 가입한 그룹 목록
	 * @param model
	 * @param vo
	 * @return
	 */
	@GetMapping("/joinstudylist")
	public String joinStudyList(ModelMap model, StudyVO vo) {
		List<StudyVO> joinStudyList = new ArrayList<StudyVO>();
		joinStudyList = studyManageService.joinStudyList(vo);
		model.addAttribute("joinStudyList", joinStudyList);
		return "studymanage/joinstudylist";
	} 
	
	 /**
	  * 
	  * 회원 가입 요청 승인 / 거부
	  * @param vo
	  * @return
	  */
	 @Auth(flag="admin")
	 @PostMapping("/joinMember")
	 public @ResponseBody String joinMember(StudyVO vo) {
		 int resultInsert = studyManageService.joinMember(vo);
		 String result = "";
		 if(resultInsert >= 3) {
			 if(("refuse").equals(vo.getGroupRole())) {			 
				 result = "가입 요청을 거부하였습니다.";				 
			 } else {
				 result = "가입 요청을 승인하였습니다.";				 
			 }
		 } else if(resultInsert == -100) { 
			 result = "가입인원을 초과하였습니다.";
		 } else {
			 result = "가입 요청 승인 / 거부에 실패했습니다.";
		 }
		 return result;
	 }
	 
	 /**
	  * 
	  * 그룹 탈퇴
	  * @param vo
	  * @return
	  */
	 @Auth(flag="user")
	 @PostMapping("/leavegroup")
	 public @ResponseBody String leavegroup(StudyVO vo) {
		 String result = "";
		 // 일반 관리자 및 일반 회원일 경우 -> 바로 탈퇴 -> 기존 게시글 삭제 여부 
		 
		 
		
	
		 // 슈퍼 관리자일 경우 -> 1명일 경우 슈퍼관리자 지정 후 탈퇴 -> 기존 게시글 삭제 여부
		 return result;
	 }
	 
	 /**
	  * 
	  * 그룹 삭제
	  * @param vo
	  * @return
	  */
	 @Auth(flag="sadmin")
	 @PostMapping("/deletegroup")
	 public @ResponseBody String deletegroup(StudyVO vo) {
		 String result = "";
		 // 슈퍼 관리자만 삭제 가능
		 // 1명일 경우 -> 
		 return result;
	 }
	 
}
