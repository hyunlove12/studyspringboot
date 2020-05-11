package com.securityconfig;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.security.oauth2.client.OAuth2ClientProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.configurers.oauth2.client.OAuth2LoginConfigurer;
import org.springframework.security.config.oauth2.client.CommonOAuth2Provider;
import org.springframework.security.oauth2.client.registration.ClientRegistration;
import org.springframework.security.oauth2.client.registration.ClientRegistrationRepository;
import org.springframework.security.oauth2.client.registration.InMemoryClientRegistrationRepository;

import com.dh.login.serviceimpl.LoginServiceimpl;


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
			.antMatchers("/css/**", "/js/**", "/images/**", "/fonts/**", "/color/**", "/ico/**", "/img/**", "/loginpage", "/login", "/mail/requestNo" ,"/mail/confirmNo", "/mail/deleteNo").permitAll()
			.mvcMatchers("/", "/info", "/account/**", "/join/**", "/main").permitAll()
			//.mvcMatchers("/admin").hasRole("ADMIN") // admin은 ADMIN권한 필요
			.anyRequest().authenticated() //그 외 어떠한 요청은 인증만 하면 된다.			
			.and()
			.oauth2Login()		
			.loginPage("/loginpage")
			.successHandler(new SocialLoginSuccessHandler("/sociallogin/main"));
			//.defaultSuccessUrl("/sociallogin/main"); -> undefined
			// undefined
			//.defaultSuccessUrl("/loginSuccess", true);
		
		// .successForwardUrl("/main") -> 안적어주면 forarding이 안된다...
		// 404도 무조건 로그인 페이지로 보낸다..?
		// //.successForwardUrl("/main") -> success핸들러 작동안함.. 우선순위 문제?		
		//.loginPage("/loginPage") -> successHandler의 redirect페이지가 undefined로 정의된다... cached에 기록 안됨..always default url??
		http.formLogin()			
			.loginPage("/loginpage")
			.loginProcessingUrl("/login")			
			.usernameParameter("username")
			.passwordParameter("password")
			.successHandler(new LoginSuccessHandler("/main"))
			// .successForwardUrl("/main")			 
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
	
	@Bean
    public ClientRegistrationRepository clientRegistrationRepository(OAuth2ClientProperties oAuth2ClientProperties, @Value("${custom.oauth2.kakao.client-id}") String kakaoClientId) {
        List<ClientRegistration> registrations = oAuth2ClientProperties.getRegistration().keySet().stream().map(client -> getRegistration(oAuth2ClientProperties, client))
                .filter(Objects::nonNull)
                .collect(Collectors.toList());

        registrations.add(CustomOAuth2Provider.KAKAO.getBuilder("kakao")
                .clientId(kakaoClientId)
                .clientSecret("test") //필요없는 값인데 null이면 실행이 안되도록 설정되어 있음
                .jwkSetUri("test") //필요없는 값인데 null이면 실행이 안되도록 설정되어 있음
                .build());

        return new InMemoryClientRegistrationRepository(registrations);
    }
	
	private ClientRegistration getRegistration(OAuth2ClientProperties clientProperties, String client) {
		
		  if ("google".equals(client)) { OAuth2ClientProperties.Registration
		  registration = clientProperties.getRegistration().get("google");
			  return
			  CommonOAuth2Provider.GOOGLE.getBuilder(client)
			  .clientId(registration.getClientId())
			  .clientSecret(registration.getClientSecret()) .scope("email", "profile")
			  .build(); 
			  } 
		  if ("facebook".equals(client)) {
			  OAuth2ClientProperties.Registration registration = clientProperties.getRegistration().get("facebook"); 
			  return
			  CommonOAuth2Provider.FACEBOOK.getBuilder(client)
			  .clientId(registration.getClientId())
			  .clientSecret(registration.getClientSecret())
			  .userInfoUri("https://graph.facebook.com/me?fields=id,name,email,link")
			  .scope("email") .build();
		  }
		 
        return null;
    }
	
}