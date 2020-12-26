package com.config;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class UrlFilter implements Filter{

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest hsr = (HttpServletRequest) request;
        if (hsr.getUserPrincipal() == null) {
            HttpSession session = hsr.getSession();
            if (!(hsr == null)) {
            	System.out.println(hsr.getPathInfo());
                session.setAttribute("beforeLoginUrl", hsr.getPathInfo());
            }
        }
        chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig config) throws ServletException {		
	}
}
