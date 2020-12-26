package com.config;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
<<<<<<< HEAD
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;
=======
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
>>>>>>> b450a2157c521835d2c384566a639fe61b18eeb4
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.ContentNegotiationConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

<<<<<<< HEAD
=======
import com.dh.login.serviceimpl.LoginServiceimpl;
import com.interceptor.AuthInterceptor;
import com.securityconfig.UserArgumentResolver;


>>>>>>> b450a2157c521835d2c384566a639fe61b18eeb4
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

	
	private static final String[] RESOURCE_LOCATIONS = {
			"classpath:/static/**/*",
			"/css/**", "/js/**", "/images/**", "/fonts/**", "/color/**", "/ico/**", "/img/**", "/upload/**"
	};
	
	private static final String[] AUTH_LOCATIONS = {
			"/study/**",
			"/studymanagement/**"
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
	
	@Autowired
	LoginServiceimpl loginServiceimpl;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(interceptor)
				.excludePathPatterns(RESOURCE_LOCATIONS);
		registry.addInterceptor(authInterceptor())
				.addPathPatterns(AUTH_LOCATIONS)
				.excludePathPatterns(RESOURCE_LOCATIONS);
	}
	
	@Bean
	public AuthInterceptor authInterceptor() {
		return new AuthInterceptor();
	}
	
	@Bean
	public HandlerMethodArgumentResolver userArgumentResolver() {
		return new UserArgumentResolver(loginServiceimpl);
	}
	
	@Override
	public void addArgumentResolvers(List<HandlerMethodArgumentResolver> resolvers) {
		resolvers.add(userArgumentResolver());
	}
<<<<<<< HEAD
=======

	
>>>>>>> b450a2157c521835d2c384566a639fe61b18eeb4
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


