<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<c:import url="/WEB-INF/jsp/includes/head.jsp" />

<body>

  <div id="wrapper">

  <c:import url="/WEB-INF/jsp/includes/header.jsp" />

    <section id="inner-headline">
      <div class="container">
        <div class="row">
          <div class="span12">
            <div class="inner-heading">
              <ul class="breadcrumb">
                <li><a href="${pageContext.request.contextPath }/main">메인</a> <i class="icon-angle-right"></i></li>
                <li class="active">로그인</li>
              </ul>
              <h2>로그인</h2>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section id="content">
      <!-- <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d22864.11283411948!2d-73.96468908098944!3d40.630720240038435!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c24fa5d33f083b%3A0xc80b8f06e177fe62!2sNew+York%2C+NY%2C+USA!5e0!3m2!1sen!2sbg!4v1540447494452" width="100%" height="380" frameborder="0" style="border:0" allowfullscreen></iframe> -->

      <div class="container">
        <div class="row">
          <div class="span8">
            <h4>로그인</h4>

            <div id="sendmessage">Your message has been sent. Thank you!</div>
            <div id="errormessage"></div>
            <form action="/login" onsubmit="return fn_checkForm();" method="post" role="form" class="contactForm">
              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
              <div class="row">
                <div class="span8 form-group">
                  <input type="text" name="username" id="username" placeholder="ID" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" />
                  <div class="validation"></div>
                </div>
                <div class="span8 form-group">
                  <input type="password" name="password" id="password" placeholder="PASSWORD" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" />
                  <div class="validation"></div>
                </div>
                <div class="span8 form-group">
                  <div class="text-center"> 
                    <button class="btn btn-theme btn-medium margintop10" type="button" id="kakaoLogin">카카오톡</button>
                    <button class="btn btn-theme btn-medium margintop10" type="submit">로그인</button>
                    <button class="btn btn-theme btn-medium margintop10" type="button">ID 찾기</button>
                    <button class="btn btn-theme btn-medium margintop10" type="button">비밀번호 찾기</button>
                  </div>
                </div>
              </div>
            </form>
          </div>
          <div class="span4">
            <div class="clearfix"></div>
            <aside class="right-sidebar">

              <div class="widget">
                <h5 class="widgetheading">공지사항<span></span></h5>

                <ul class="contact-info">
                  <li><label>공지사항 :</label> 사이트 오픈!!!축하 이벤트</li>
                  <li>연습 사이트입니다. 회원가입이나 카카오 로그인시 개인정보 유출이 일어날 수 있습니다. 가입시 가상의 데이터를 사용하고 카카오 로그인은 주의하여 사용해주세요!</li>
                </ul>

              </div>
            </aside>
          </div>
        </div>
      </div>
    </section>

  </div>
  <c:import url="/WEB-INF/jsp/includes/footer.jsp" /> 
  <a href="#" class="scrollup"><i class="icon-angle-up icon-square icon-bglight icon-2x active"></i></a>

   <script type="text/javascript">
        $(function(){           
        	
        	$("#kakaoLogin").click(function(){
            	alert('카카오로그인');
	   			location.href="/oauth2/authorization/kakao";
	       	});
        	 
        });
        function fn_checkForm(){
    		if($("#username").val() == '' ){
    			alert('ID를 입력해 주세요!');
    			return false;
    		}
    		if($("#password").val() == '' ){
    			alert('비밀번호를 입력해 주세요!');
    			return false;
    		}
    		return true;
    	}	
        
    </script>


</body>

</html>
