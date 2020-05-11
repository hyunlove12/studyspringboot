package com.dh.login.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

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
	public String join(@RequestPart MultipartFile files, ModelAndView model, LoginVO vo, RedirectAttributes rttr, HttpServletRequest request) throws IOException {
		System.out.println("회원 가입!");
		HttpSession session = request.getSession();
		if(session.getAttribute("confirmMail") != null) {
			System.out.println("회원 가입!!");
			System.out.println(session.getAttribute("confirmMail").toString());
			if(Boolean.valueOf(session.getAttribute("confirmMail").toString())) {
				loginService.join(vo, files);		
				return "redirect:/main"; 
			} else {				
				System.out.println("이메일 인증 안됨!");
				return "redirect:/main"; 
			}
		}
		return "redirect:/main"; 
	}
	
	@GetMapping("/join/joinpage")
	public String join() {			
		return "login/join";
	}
	
	@GetMapping("/loginSuccess")
	public String loginSuccess(@SocialUser User user) {	
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
	
	/**
	 * 
	 * 개인 정보 확인 전 재 로그인 페이지
	 * @param vo
	 * @return
	 */
	@GetMapping("/info/relogin")
	public String relogin(LoginVO vo, ModelAndView model, HttpServletRequest request) {
		int result = 1;
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		if(flashMap != null && flashMap.get("result") != null ) {
			result = (int) flashMap.get("result");
		}
		model.addObject("result", result);
		return "info/relogin";
	}
	
	/**
	 * 
	 * 재로그인 확인
	 * @param vo
	 * @return
	 */
	@PostMapping("/info/me")
	public String me(LoginVO vo, ModelMap model, RedirectAttributes rttr) {
		LoginVO lvo = new LoginVO();
		// 재 로그인 
		if(vo.getUsername().equals(vo.getSuserId())) {
			lvo = loginService.me(vo);
			if(lvo == null) {
				rttr.addFlashAttribute("result",-2);
				return "redirect:/info/relogin";
			}
			// model and view -> 리턴값이 모델엔 뷰가 되면서 뷰세팅, 모델 세팅 각각해줘야
			model.addAttribute("lvo", lvo);
		} else {
			rttr.addFlashAttribute("result",-1);
			return "redirect:/info/relogin";
		}
		return "info/me";
	}
	
	/**
	 * 
	 * 회원가입 탈퇴
	 * @param vo
	 * @return
	 */
	@PostMapping("/leave")
	public String leave(LoginVO vo) {
		// 회원가입 탈퇴
		// 슈퍼관리자일 경우는?
		
		
		return "info/me";
	}
	
	/**
	 * 
	 * 회원정보 업데이트 
	 * @param vo
	 * @return
	 */
	@PostMapping("/update/me")
	public String updateme(LoginVO vo, @RequestPart MultipartFile files) {
		loginService.updateme(vo, files);		
		return "redirect:/main"; 
	}
	
}
