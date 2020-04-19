package com.study.login.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.controller.ComController;
import com.service.ComVO;
import com.study.login.service.LoginVO;
import com.study.login.serviceimpl.LoginServiceimpl;
import com.study.service.StudyVO;

@Controller
@SessionAttributes(value="LoginVO")
public class LoginController extends ComController<LoginServiceimpl, LoginVO> {
	
	LoginController() {
		super();
	}

	//web-inf 밑의 jsp가 루트 경로
	@Autowired
	LoginServiceimpl loginService;
	

	@RequestMapping("/main") 
	public ModelAndView welcome(ModelAndView mv, LoginVO vo) {
		
		String userId = ComVO.currentUserName();		
		mv.addObject("userId", userId);
		System.out.println("userId : " + userId);
		// 메인의 스터디 리스트
		List<StudyVO> list = new ArrayList<StudyVO>();
		list = loginService.mainlist();
		mv.addObject("list", list);
		mv.setViewName("login/main");	
		return mv; 
	}

	@RequestMapping("/loginpage")
	public String loginPage(ModelAndView model, LoginVO vo) {			
		return "login/login";
	} 
	

	
//	@RequestMapping(value="/save.do", produces="text/plain;charset=UTF-8")
	@PostMapping(value="/join")
	public String join(ModelAndView model, LoginVO vo) throws IOException {
		loginService.join(vo);		
		return "redirect:/main"; 
	}
	
	@GetMapping("/join/joinpage")
	public String join() {			
		return "login/join";
	}
}
