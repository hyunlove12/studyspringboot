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
                <li class="active">개인정보 수정</li>
              </ul>
              <h2>개인정보 수정</h2>
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
            <h4>개인정보</h4>

            <div id="sendmessage">Your message has been sent. Thank you!</div>
            <div id="errormessage"></div>            
            
            <form action="/update/me" enctype="multipart/form-data" onsubmit="return fn_checkForm();" method="post" role="form" accept-charset="UTF-8">                  
            	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            	  <div class="row controls">
                    <div class="span4 control-group">
                      <label>ID</label>
                      <input type="text" id="id" name="id" value="${lvo.id }" maxlength="100" class="span4" readonly="true" >
                    </div>
                  </div>
                  <div class="row controls">
                    <div class="span4 control-group">
                      <label>email</label>
                      <input type="text" id="email" value="${lvo.email }" name="email" maxlength="100" class="span4" readonly="true">
                    </div>
                    <div class="span2 control-group">
                   	  <label> </label>
                      <input type="button"  id="emailCheck" value="이메일 재 인증"  class="btn btn-primary">
                    </div>
                  </div>
            	  <div class="row controls">
                    <div class="span6 control-group">
                      <label>이름</label>
                      <input type="text" id="name" value="${lvo.name }" name="name" maxlength="100" class="span6">
                    </div>
                  </div>
                  <div class="row controls">
                    <div class="span6 control-group">
                      <label>기존 비밀번호</label>
                      <input type="password" id="oldPassword" name="oldPassword" class="span6">
                    </div>
                  </div>
                  <div class="row controls">
                    <div class="span6 control-group">
                      <label>비밀번호 변경</label>
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
                  <div class="row controls">
                  	<div class="span3 control-group">
                  	  <label>프로필 이미지 </label>
	                  <input type="file" name="files" id="files" placeholder="프로필 이미지"  data-msg="Please enter a valid email" onchange="loadImg(this)"/>
	                </div>
	                <div class="span3 control-group">
	                  <img id="fileupload" style="height:50px; width:50px;" src="${pageContext.request.contextPath }/upload/profile/${lvo.unityId }" alt="" class="reply img-circle" />
                    </div>
                  </div>
                  <div class="btn-toolbar">
                    <input type="submit" value="수정" class="btn btn-primary">
                    <input type="button" value="탈퇴" class="btn btn-primary">
                  </div>
                </form>
                
          </div>
          <div class="span4">
            <div class="clearfix"></div>
            <aside class="right-sidebar">

              <div class="widget">
                <h5 class="widgetheading">개인정보수정<span></span></h5>

                <ul class="contact-info">
                  <li><label>개인정보 수정페이지 입니다.</label></li>      
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
	// bind, unbind, on, off, removeEventListener 등 이벤트 할당에 대한 공부...
	
	function fn_checkForm(){
		if($("#name").val() == '' ){
			alert('이름을 입력해 주세요!');
			return false;
		}
		if($("#password").val() != '' ){
			if($("#beforePassword").val() != $("#password").val()){
				alert('비밀번호가 일치하지 않습니다.')
				return false;
			}
		}
		return true;
	}	
	
	function loadImg(file){
		if(file.files && file.files[0]) {
			let render = new FileReader();
			render.onload = function(e) {
				$("#fileupload").attr("src", e.target.result);
			}
			render.readAsDataURL(file.files[0]);
		}
	}
	
	
//	$(document).on('click',"#idCheck", noCheckEvent);	
	
	
/* 	$(document).on('click', 'input.noCheck', (function(){  
			//.idCheck -> 포함된 것 찾는것?
        	$("input.noCheck").click(function(){
            	// 스크립트 조작 방지에 대한 대책 필요?            	
	       		$.ajax({
	    	        type : "get", //전송방식을 지정한다 (POST,GET)
	    	        url : "${pageContext.request.contextPath }/join/checkId",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
	    	        dataType : "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
	    	        data : {
	    	        	      "groupId" : $("#id").val()
	    	        	     },
	    	        error : function(data){
						alert('요청에 실패했습니다.');
	    	            console.log(data);
	    	        },
	    	        success : function(data){
	    	            if(data == 'true') {
	    	            	alert('사용가능한 ID입니다.');
	    	            	$("#idCheck").removeClass('noCheck');
	    	            	$("#idCheck").addClass('idChecked');
							$("#id").attr('disabled','disabled');
	    	            	$("#idCheck").val('체크 완료! - 초기화');
			    	    } else {
							alert('중복 된 아이디 입니다.')
				    	}
	    	            $("input.noCheck").removeEventListener('click');
	    	        }         
	    	    });       		
	       	});     
       })); */
     /*   $("input.idChecked").off("click").on("click", function(){  
    		alert('중복체크를 초기화합니다.');
       		$("#idCheck").val('중복체크');
       		$("#idCheck").removeClass('idChecked');
       		$("#idCheck").addClass('noCheck');
       		$("#id").removeAttr('disabled');   
  		}); */
 		
		// 이벤트 동적 할당        	
       /* 	$(document).on('click', 'input.idChecked', (function(){  
           	alert('중복체크를 초기화합니다.');
       		$("#idCheck").val('중복체크');
       		$("#idCheck").removeClass('idChecked');
       		$("#idCheck").addClass('noCheck');
       		$("#id").removeAttr('disabled');
       	})); */	 
	    
    </script>
</body>

</html>
