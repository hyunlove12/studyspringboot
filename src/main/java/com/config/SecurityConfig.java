package com.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.authentication.AuthenticationFilter;

import com.study.login.serviceimpl.LoginServiceimpl;


@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Autowired
	LoginServiceimpl loginServiceimpl;
	
	//@Autowired
	//LoginSuccessHandler loginSuccessHandler;
	/*
	 * @Override public void configure(WebSecurity web) throws Exception {
	 * web.ignoring().antMatchers("/echo/**").anyRequest(); }
	 */
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		//메소드체이닝을 하지 않아도 된다.
		//http 각각 설정해도 된다.
		http.authorizeRequests()
			.antMatchers(HttpMethod.POST, "/join").permitAll()
			.antMatchers("/css/**", "/js/**", "/images/**", "/fonts/**", "/color/**", "/ico/**", "/img/**", "/loginPage", "/login").permitAll()
			.mvcMatchers("/", "/info", "/account/**", "/join/**", "/main").permitAll()
			//.mvcMatchers("/admin").hasRole("ADMIN") // admin은 ADMIN권한 필요
			.anyRequest().authenticated(); //그 외 어떠한 요청은 인증만 하면 된다.			
		
		
		// .successForwardUrl("/main") -> 안적어주면 forarding이 안된다...
		// 404도 무조건 로그인 페이지로 보낸다..?
		// //.successForwardUrl("/main") -> success핸들러 작동안함.. 우선순위 문제?		
		//.loginPage("/loginPage") -> successHandler의 redirect페이지가 undefined로 정의된다...
		http.formLogin()			
		    .successHandler(new LoginSuccessHandler("/main"))
			//.loginPage("/loginPage")
			.loginProcessingUrl("/login")			
			.usernameParameter("username")
			.passwordParameter("password")
			//.successForwardUrl("/main")			 
			.permitAll(); 
		// http.csrf().disable();
		
		http.logout()	    			
		    .logoutUrl("/logout") // 로그아웃로직이 진행되는 주소
		    .logoutSuccessUrl("/main") // 로그아웃 성공 시 리다이렉트 주소
		 // .addLogoutHandler()
		    //.logoutSuccessHandler() // 성공 핸들러
		    .invalidateHttpSession(true); // session제거
		
		 // .deleteCookies("cookiename") // 쿠키 사용로그인시 해당 쿠키 제거
		http.httpBasic(); //httpbasic사용		
	}
	
	/*
	 * .loginPage("/loginPage")
			.loginProcessingUrl("/login")
			.usernameParameter("username")
			설정 없이 기본페이지로 로그인하면로그인처리 가 된다..어디로직?
	 * */
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(loginServiceimpl);	//bean으로 등록만 되어 있으면 사용 가능	
	}
}