<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- start header -->
<header>
  <div class="top">
    <div class="container">
      <div class="row">
        <div class="span6">
          <p class="topcontact"><i class="icon-phone"></i> hyunlove12@temp.co.kr</p>
        </div>
        <div class="span6">

          <ul class="social-network">
	          <sec:authorize access="isAnonymous()">
					<li><a href="/login" class="btn btn-medium btn-theme"><i class="icon-chevron-down"></i> 로그인</a></li>
	          		<li><a href="/join/join" class="btn btn-medium btn-theme"><i class="icon-chevron-down"></i> 회원가입</a></li>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">	
	          		<li><a href="/chatmain" class="btn btn-medium btn-theme"><i class="icon-chevron-down"></i> 채팅하기</a></li>
	          		<li><a href="/study/createstudy" class="btn btn-medium btn-theme"><i class="icon-chevron-down"></i> 그룹 만들기</a></li>	          		
	          		<li><a href="/logout" class="btn btn-medium btn-theme"><i class="icon-chevron-down"></i> 로그아웃</a></li>	
				</sec:authorize>
	          <c:if test="${userId == null or empty userId or userId == 'anonymousUser' or userId == ''}">
	          </c:if>          
          	  <c:if test="${userId != null and !empty userId and userId != '' and  userId != 'anonymousUser'}">
          	  </c:if>        	
            <!-- <li><a href="#" data-placement="bottom" title="Facebook"><i class="icon-facebook icon-white"></i></a></li>
            <li><a href="#" data-placement="bottom" title="Twitter"><i class="icon-twitter icon-white"></i></a></li>
            <li><a href="#" data-placement="bottom" title="Dribbble"><i class="icon-dribbble icon-white"></i></a></li> -->
          </ul>
          
          <ul class="social-network">
          	<sec:authorize access="isAuthenticated()">	
          		<li style="color:white"><sec:authentication property="principal.username"/>님 환영합니다!</li>
          	</sec:authorize>	
          </ul>

        </div>
      </div>
    </div>
  </div>
  <div class="container">


    <div class="row nomargin">
      <div class="span4">
        <div class="logo">
          <a href="/main"><!-- <img src="img/logo.png" alt="" /> -->자율 스터디 ${pageContext.request.contextPath }/</a>
        </div>
      </div>
      <div class="span8">
        <div class="navbar navbar-static-top">
          <div class="navigation">
            <nav>
              <ul class="nav topnav">
                <li><a href="/study/studylist">그룹 리스트</a></li>
                <sec:authorize access="isAuthenticated()">	
		          	<li class="dropdown">
	                  <a href="#">그룹관리 <i class="icon-angle-down"></i></a>
	                  <ul class="dropdown-menu">
	                    <li><a href="about.html">가입그룹</a></li>
	                    <li><a href="faq.html">FAQ</a></li>
	                  </ul>
	                </li>	
	                <li class="dropdown">
	                  <a href="#">요청 메시지 </a>                 
	                </li>
	                <li class="dropdown">
	                  <a href="#">요청그룹 </a>                 
	                </li>      
	                <li class="dropdown">
	                  <a href="#">내정보 </a>                 
	                </li>              
				</sec:authorize>
              </ul>
            </nav>
          </div>
          <!-- end navigation -->
        </div>
      </div>
    </div>
  </div>
</header>
<!-- end header -->