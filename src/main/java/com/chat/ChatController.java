package com.chat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dh.login.service.LoginVO;

@Controller
public class ChatController {
	//web-inf 밑의 jsp가 루트 경로
	
	/*
	 * @RequestMapping("/") public String welcome(HttpServletResponse response,
	 * HttpServletRequest req, ModelAndView model, LoginVO vo) { return "index"; }
	 */
	
	@RequestMapping("/chatmain") public String welcome(HttpServletResponse response,
			HttpServletRequest req, ModelAndView model, LoginVO vo) { 
		return "chat/chatmain"; 
	}




}
