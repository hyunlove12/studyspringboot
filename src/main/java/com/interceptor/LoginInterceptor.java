package com.interceptor;
	 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.dh.common.service.ComVO;
 
@Component
public class LoginInterceptor extends HandlerInterceptorAdapter{
 
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        
       // HttpSession session = request.getSession();
       // LoginVO loginVO = (LoginVO) session.getAttribute("loginVO");
		/*
		 * if(loginVO == null){ System.out.println("호출 됐는지");
		 * response.sendRedirect("/main.do"); return false; }
		 */
        return true;
    }
 
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
    	ComVO vo = new ComVO();
    	String userId = vo.getSuserId();
    	modelAndView.addObject("suserId", userId);
    	System.out.println("suserId" + userId);
        super.postHandle(request, response, handler, modelAndView);
    }
 
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
        // TODO Auto-generated method stub
        super.afterCompletion(request, response, handler, ex);
    }	    
}
	 
