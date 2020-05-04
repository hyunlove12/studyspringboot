package com.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.annotation.Auth;
import com.dh.study.service.StudyVO;
import com.dh.study.serviceimpl.StudyMapper;

public class AuthInterceptor extends HandlerInterceptorAdapter{
	
	@Autowired
	StudyMapper studyMapper;
	
	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
			// 전체에 대한 어노테이션 검사 -> 비효율... 복잡
			/*System.out.println("인터셉터 출력!");
			String groupId = request.getParameter("groupId");
			Method[] methods = Class.forName(StudyController.class.getName()).getDeclaredMethods();
			StudyVO vo = new StudyVO();
			vo.setGroupId(groupId);
			
			for (Method method : methods) {
				Auth auth = method.getAnnotation(Auth.class);
				// auth.getClass().
				if (auth != null) {
					// 해당 스터디에 가입되어 있는지와 권한이 무엇인지만 확인하며 응용 가능..
					StudyVO vo1 = studyMapper.checkGroup(vo);
					System.out.println("호출!!");
					// System.out.println(vo1.getGroupRole() + "호출");
					if(vo1 != null && (("admin").equals(vo1.getGroupRole()) || ("user").equals(vo1.getGroupRole()))) {
						return true;
					} else {
						return false;
					}
				}
			}
		} catch (Throwable e) {
			throw new RuntimeException(e);
		}*/
		if(handler instanceof HandlerMethod == false ) {
			//DefaulstservletHttpRequestHandler
			return true;
		}
		
		//2. casting
		//HandlerMethod -> 모든 method가 존재
		HandlerMethod handlerMethod = (HandlerMethod)handler;
		
		//3. @Auth받기
		Auth auth = handlerMethod.getMethodAnnotation(Auth.class);
		//4. @Auth가 없다면 인증이 필요없는 handler
		if(auth == null) {
			return true;
		}
		String flag = auth.flag();
		String groupId = request.getParameter("groupId");
		StudyVO vo = new StudyVO();
		vo.setGroupId(groupId);		
		// 해당 스터디에 가입되어 있는지와 권한이 무엇인지만 확인하며 응용 가능..
		StudyVO vo1 = studyMapper.checkGroup(vo);
		
		
		System.out.println(request.getPathInfo());
		System.out.println(request.getRequestURI());
		System.out.println(request.getRequestURL());
		System.out.println(request.getQueryString());
		System.out.println(request.getRemoteAddr());
		System.out.println(request.getRemoteHost());
		System.out.println(request.getRemoteUser());
		System.out.println("호출!!");
		if(vo1 != null && ("admin").equals(vo1.getGroupRole())) {
			System.out.println("true");
			return true;
		} else if(vo1 != null && ("user").equals(vo1.getGroupRole())) {
			if(("admin").equals(flag)) {
				response.sendRedirect("/notauth");
				return false;
			}		
			return true;
		} else {
			response.sendRedirect("/notauth");
			System.out.println("false");
			return false;
		}
    }
 
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
        super.postHandle(request, response, handler, modelAndView);
    }
 
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
        super.afterCompletion(request, response, handler, ex);
    }	
}
