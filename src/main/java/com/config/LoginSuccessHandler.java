package com.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Component;

public class LoginSuccessHandler implements AuthenticationSuccessHandler {
        
    private String defaultUrl;
    private RedirectStrategy redirectStratgy = new DefaultRedirectStrategy();
    private RequestCache requestCache = new HttpSessionRequestCache();

    public LoginSuccessHandler() {
    	
    }
    public LoginSuccessHandler(String defaultUrl) {
    	this.defaultUrl = defaultUrl;
    }
    public String getDefaultUrl() {
    	return defaultUrl;
    }
    
    public void setDefaultUrl(String defaultUrl) {
    	this.defaultUrl = defaultUrl;
    }
    
	@Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {
		sendRedirect(request, response, authentication);
		clearAuthenticationAttributes(request);
    }
	
	protected void sendRedirect(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {
		
		SavedRequest savedRequest = requestCache.getRequest(request, response);      
		String referer = request.getHeader("REFERER");
		System.out.println(referer + "ddd");
		redirectStratgy.sendRedirect(request, response, defaultUrl);
        if(savedRequest!=null) {
            String targetUrl = savedRequest.getRedirectUrl();
            System.out.println("url1" + targetUrl);
           // redirectStratgy.sendRedirect(request, response, targetUrl);
        } else {
            System.out.println("url" + defaultUrl);
            redirectStratgy.sendRedirect(request, response, defaultUrl);            
        }
	}
	
	protected void clearAuthenticationAttributes(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if(session==null) return;
        session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
    }

}
