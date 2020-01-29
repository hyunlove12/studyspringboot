package com.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import com.study.login.serviceimpl.LoginServiceimpl;


@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Autowired
	LoginServiceimpl loginServiceimpl;
	
	/*
	 * @Override public void configure(WebSecurity web) throws Exception {
	 * web.ignoring().antMatchers("/echo/**").anyRequest(); }
	 */
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		//메소드체이닝을 하지 않아도 된다.
		//http 각각 설정해도 된다.
		http.authorizeRequests()
				.antMatchers(HttpMethod.POST, "/join/join").permitAll()
				.antMatchers("/css/**", "/js/**", "/images/**", "/fonts/**", "/color/**", "/ico/**", "/img/**").permitAll()
				.mvcMatchers("/", "/info", "/account/**", "/join/**", "/main").permitAll()
				//.mvcMatchers("/admin").hasRole("ADMIN") // admin은 ADMIN권한 필요
				.anyRequest().authenticated() //그 외 어떠한 요청은 인증만 하면 된다.
				.and()	//메소드 체이닝
			.formLogin(); //form 로그인 사용
		http.httpBasic(); //httpbasic사용		
	}
}