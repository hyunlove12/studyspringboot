package com.dh.common.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CustomErrorController implements ErrorController{

	// 시큐리티에서 404가 로그인페이지로 가는이유가 해당 에러에 대한 권한이 없어서/..?
	@RequestMapping("/error")
	public String handleError(HttpServletRequest request) {
		Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE); 
		if(status != null){ 
			int statusCode = Integer.valueOf(status.toString()); 
			// 
			if(statusCode == HttpStatus.NOT_FOUND.value()){ 
				return "error/notfound";
			}
			if(statusCode == HttpStatus.FORBIDDEN.value()){ 
				return "error/notauth";
			}
		} 
		return "error/error";
	}
			
	@Override
	public String getErrorPath() {
		return "/error";
	}
	
	
}
