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
                <li><a href="index.html">Home</a> <i class="icon-angle-right"></i></li>
                <li class="active">그룹 만들기</li>
              </ul>
              <h2>그룹 만들기</h2>
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
            <h4>회원가입</h4>

            <div id="sendmessage">Your message has been sent. Thank you!</div>
            <div id="errormessage"></div>            
            
            <form action="/join" method="post" role="form" accept-charset="UTF-8">                  
            	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            	  <div class="row controls">
                    <div class="span4 control-group">
                      <label>ID</label>
                      <input type="text" id="id" name="id" value="" maxlength="100" class="span4">
                    </div>
                    <div class="span2 control-group">
                      <input type="button"  id="idCheck" value="중복체크"  class="btn btn-primary">
                    </div>
                  </div>
            	  <div class="row controls">
                    <div class="span3 control-group">
                      <label>이름</label>
                      <input type="text" id="name" name="name" maxlength="100" class="span3">
                    </div>
                    <div class="span3 control-group">
                      <label>email</label>
                      <input type="text" id="email" name="email" maxlength="100" class="span3">
                    </div>
                  </div>
                  <div class="row controls">
                    <div class="span6 control-group">
                      <label>비밀번호</label>
                      <input type="password" id="beforePassword" class="span6">
                    </div>
                  </div>
                  <div class="row controls">
                    <div class="span6 control-group">
                      <label>비밀번호 확인</label>
                      <input type="password" id="password" name="password" value="" maxlength="100" class="span6">
                    </div>
                  </div>
                  <div class="row controls">
                    <div class="span6 control-group">
                      <label>Comment </label>
                      <textarea maxlength="5000" rows="4" class="span6"></textarea>
                    </div>
                  </div>
                  <div class="btn-toolbar">
                    <input type="submit" value="회원가입" class="btn btn-primary">
                  </div>
                </form>
                
          </div>
          <div class="span4">
            <div class="clearfix"></div>
            <aside class="right-sidebar">

              <div class="widget">
                <h5 class="widgetheading">회원가입 약관<span></span></h5>

                <ul class="contact-info">
                  <li><label>회원가입 약관 입니다:</label> 회원 가입시 본 사이트의 약관에 동의한 것으로 간주합니다.</li>
                  <li>연습 사이트입니다. 회원가입이나 카카오 로그인시 개인정보 유출이 일어날 수 있습니다. 가입시 가상의 데이터를 사용하고 카카오 로그인은 주의하여 사용해주세요!</li>
                </ul>

              </div>
            </aside>
          </div>
        </div>
      </div>
    </section>

    <c:import url="/WEB-INF/jsp/includes/footer.jsp" /> 
  </div>
  <a href="#" class="scrollup"><i class="icon-angle-up icon-square icon-bglight icon-2x active"></i></a>
	<script type="text/javascript">
	$(function(){        
		
        	$("#idCheck").click(function(){
        		alert('중복체크!');
        		
        		return;
	       		$.ajax({
	    	        type : "post", //전송방식을 지정한다 (POST,GET)
	    	        url : "${pageContext.request.contextPath }/study/joinrequest",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
	    	        dataType : "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
	    	        data : {
	    	        	      "groupId" : $("#tempGroupId").val()
	    	        	    , "message" : $("#message").val()
	    	        	     },
	    	        error : function(data){
	    	          alert(data);
	    	        },
	    	        success : function(data){
	    	            alert(data);
	    	            $("#message").val("");
	    	            $("#myModal").modal("hide");
	    	        }         
	    	    });
	       		
	       	});       
        	
        });
        
    </script>
</body>

</html>
