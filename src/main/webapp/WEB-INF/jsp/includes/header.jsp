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
          <p class="topcontact"><i class="icon-phone"></i> ddd@temp.co.kr</p>
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
	          		<li><a href="/study/groupadmin" class="btn btn-medium btn-theme"><i class="icon-chevron-down"></i> 그룹 관리</a></li>
	          		<li><a href="/logout" class="btn btn-medium btn-theme"><i class="icon-chevron-down"></i> 로그아웃</a></li>	
				</sec:authorize>
	          <c:if test="${userId == null or empty userId or userId == 'anonymousUser' or userId == ''}">
	          </c:if>          
          	  <c:if test="${userId != null and !empty userId and userId != '' and  userId != 'anonymousUser'}">
          	  </c:if>        	
            <!-- <li><a href="#" data-placement="bottom" title="Facebook"><i class="icon-facebook icon-white"></i></a></li>
            <li><a href="#" data-placement="bottom" title="Twitter"><i class="icon-twitter icon-white"></i></a></li>
            <li><a href="#" data-placement="bottom" title="Linkedin"><i class="icon-linkedin icon-white"></i></a></li>
            <li><a href="#" data-placement="bottom" title="Pinterest"><i class="icon-pinterest  icon-white"></i></a></li>
            <li><a href="#" data-placement="bottom" title="Google +"><i class="icon-google-plus icon-white"></i></a></li>
            <li><a href="#" data-placement="bottom" title="Dribbble"><i class="icon-dribbble icon-white"></i></a></li> -->
          </ul>
          
          <ul class="social-network">
          	<sec:authorize access="isAuthenticated()">	
          		<li><sec:authentication property="principal.username"/>님 환영합니다!</li>
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
                <!-- <li class="dropdown active">
                  <a href="index.html"><i class="icon-home"></i> Home <i class="icon-angle-down"></i></a>
                  <ul class="dropdown-menu">
                    <li><a href="index-alt2.html">Homepage 2</a></li>
                    <li><a href="index-alt3.html">Homepage 3</a></li>
                    <li><a href="index-alt4.html">Parallax slider</a></li>
                    <li><a href="index-landingpage.html">Landing page</a></li>
                  </ul>
                </li> -->
                <!-- <li class="dropdown">
                  <a href="#">Features <i class="icon-angle-down"></i></a>
                  <ul class="dropdown-menu">
                    <li><a href="typography.html">Typography</a></li>
                    <li><a href="components.html">Components</a></li>
                    <li><a href="icons.html">Icons</a></li>
                    <li><a href="icon-variations.html">Icon variations</a></li>
                    <li class="dropdown"><a href="#">3rd menus<i class="icon-angle-right"></i></a>
                      <ul class="dropdown-menu sub-menu-level1">
                        <li><a href="index.html">Sub menu</a></li>
                        <li><a href="index.html">Sub menu</a></li>
                      </ul>
                    </li>
                  </ul>
                </li> -->
                <li><a href="/study/studylist">그룹 리스트</a></li>
                <!-- <li class="dropdown">
                  <a href="#">Pages <i class="icon-angle-down"></i></a>
                  <ul class="dropdown-menu">
                    <li><a href="about.html">About us</a></li>
                    <li><a href="faq.html">FAQ</a></li>
                    <li><a href="team.html">Team</a></li>
                    <li><a href="services.html">Services</a></li>
                    <li><a href="pricingbox.html">Pricing boxes</a></li>
                    <li><a href="404.html">404</a></li>
                  </ul>
                </li> -->
                <li class="dropdown">
                  <a href="#">가입그룹</a>                  
                </li>
                <li class="dropdown">
                  <a href="#">내정보 </a>                 
                </li>
                <!-- <li>
                  <a href="contact.html">Contact </a>
                </li> -->
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