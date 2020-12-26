package com.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.ContentNegotiationConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

	
	private static final String[] RESOURCE_LOCATIONS = {
			"classpath:/static/"
	};
	
	@Bean 
	public ServletRegistrationBean servletRegistrationBean(WebApplicationContext webApplicationContext) {
		  DispatcherServlet disServlet = new DispatcherServlet(webApplicationContext);
		  ServletRegistrationBean servlet = new ServletRegistrationBean(disServlet, false, "/"); 
		  servlet.setLoadOnStartup(1); 
		  return servlet; 
	}
	@Autowired
	@Qualifier(value = "loginInterceptor")
	private HandlerInterceptor interceptor;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(interceptor);
				//.excludePathPatterns("/main.do");
				//.excludePathPatterns("static/**/*")
	}
	/*@Bean
	public FilterRegistrationBean getFilterRegistrationBean() {
		FilterRegistrationBean registrationBean = new FilterRegistrationBean(new UrlFilter());
		registrationBean.setOrder(Integer.MIN_VALUE);
		registrationBean.setUrlPatterns(Arrays.asList("/*"));
		return registrationBean;
	}*/
	/*
	 * @Override public void addResourceHandlers(ResourceHandlerRegistry registry) {
	 * registry .addResourceHandler("/**") .addResourceLocations(RESOURCE_LOCATIONS)
	 * .setCachePeriod(3600) .resourceChain(true) .addResolver(new
	 * PathResourceResolver()); }
	 */
    
}


