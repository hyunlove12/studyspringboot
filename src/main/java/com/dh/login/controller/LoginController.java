package com.dh.login.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dh.common.controller.ComController;
import com.dh.login.service.LoginVO;
import com.dh.login.serviceimpl.LoginServiceimpl;
import com.dh.study.service.StudyVO;
import com.securityconfig.SocialUser;
import com.securityconfig.User;

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
		
		// 메인의 스터디 리스트
		List<StudyVO> list = new ArrayList<StudyVO>();
		list = loginService.mainlist(vo);
		mv.addObject("list", list);
		mv.setViewName("login/main");	
		return mv; 
	}

	@GetMapping("/loginpage")
	public String loginPage(HttpServletRequest request) {		
		String referrer = request.getHeader("Referer");
	    request.getSession().setAttribute("prevPage", referrer);
	    System.out.println("loginpage :" + referrer);
		return "login/login";
	} 
	

	
//	@RequestMapping(value="/save.do", produces="text/plain;charset=UTF-8")
	@PostMapping(value="/join")
	public String join(@RequestPart MultipartFile files, ModelAndView model, LoginVO vo, RedirectAttributes rttr) throws IOException {
		loginService.join(vo, files);		
		return "redirect:/main"; 
	}
	
	@GetMapping("/join/joinpage")
	public String join() {			
		return "login/join";
	}
	
	@GetMapping("/loginSuccess")
	public String loginSuccess(@SocialUser User user) {			
		System.out.println(user.getEmail() + "email");
		return "login/main";
	}
	
	/**
	 * 
	 * 중복 아이디 체크
	 * @param vo
	 * @return
	 */
	@GetMapping("/join/checkId")
	public @ResponseBody Boolean checkId(LoginVO vo) {
		Boolean boo = true;
		boo = loginService.checkId(vo);
		return boo; 
	}
	
}
