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
                <li class="active">회원가입</li>
              </ul>
              <h2>회원가입</h2>
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
            
            <form action="/join" onsubmit="return fn_checkForm();" method="post" enctype="multipart/form-data" role="form" accept-charset="UTF-8">                  
            	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            	  <div class="row controls">
                    <div class="span4 control-group">
                      <label>ID</label>
                      <input type="text" id="id" name="id" maxlength="100" class="span4">
                    </div>
                    <div class="span2 control-group">
                      <label></label>
                      <input type="button"  id="idCheck" value="중복체크"  class="btn btn-primary noCheck">
                    </div>
                  </div>
                  <div class="row controls">
                    <div class="span4 control-group">
                      <label>email</label>
                      <input type="text" id="email" name="email" maxlength="100" class="span4">
                    </div>
                    <div class="span2 control-group">
                      <label></label>
                      <input type="button"  id="emailCheck" value="이메일 인증"  class="btn btn-primary">
                    </div>
                  </div>
            	  <div class="row controls">
                    <div class="span6 control-group">
                      <label>이름</label>
                      <input type="text" id="name" name="name" maxlength="100" class="span6">
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
                  <div class="row controls">
                  	<div class="span3 control-group">
                  	  <label>프로필 이미지 </label>
	                  <input type="file" name="files" id="files" placeholder="프로필 이미지"  data-msg="Please enter a valid email" onchange="loadImg(this)"/>
	                </div>
	                <div class="span3 control-group">
	                  <img id="fileupload" style="height:50px; width:50px;" class="reply img-circle"></img>
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

<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
       <div class="modal-header">
         <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
         <h3 id="myModalLabel">요청!</h3>
       </div>
       <form>
	       <div class="modal-body">
	       		<div class="span12">
		       		<div class="row controls">
				        <div class="span6 control-group">
				          <label>해당 메일로 인증번호가 발송되었습니다.</label>
				          <label>메일 확인 후 입력해주세요.</label>
				          <label>해당메일이 도착하지 않았을 경우 스팸함을 확인 해 주시고,</label>
				          <label>5분이 지나도 도착하지 않으면 재 요청을 클릭해주세요.</label>
				      	  <input id="mailNo" type="text" placeholder="인증번호입력" class="btn btn-primary">
				      	  <input id="timer" type="text" class="btn btn-primary">
				        </div>
			        </div>
		        </div>
	       </div>
	       <div class="modal-footer">
	         <input id="requestEmailNo" type="button" value="번호 재 요청" class="btn btn-primary">
		     <input id="submitNo" type="button" value="인증" class="btn btn-primary">
		     <input type="hidden" id="tempGroupId"/>	  
	       </div>
       </form>
     </div>
     
     
    <c:import url="/WEB-INF/jsp/includes/footer.jsp" /> 
  </div>
  <a href="#" class="scrollup"><i class="icon-angle-up icon-square icon-bglight icon-2x active"></i></a>
	<script type="text/javascript">


	function fn_checkForm(){
		if($("#idCheck[class*='idChecked']").length == 0 ){
			alert('아이디 중복을 체크하세요!');
			return false;
		}
		if($("#emailCheck[class*='emailChecked']").length == 0 ){
			alert('이메일을 인증해 주세요!');
			return false;
		}
		if($("#email").val() == '' ){
			alert('이메일을 입력해 주세요!');
			return false;
		}
		if($("#name").val() == '' ){
			alert('이름을 입력해 주세요!');
			return false;
		}
		return true;
	}	

	
	// bind, unbind, on, off, removeEventListener 등 이벤트 할당에 대한 공부...
	let checkId = document.getElementById('idCheck');
	let checkedEvent = function(){
		alert('중복체크를 초기화합니다.');
   		$("#idCheck").val('중복체크');
   		$("#idCheck").removeClass('idChecked');
   		$("#idCheck").addClass('noCheck');
   		$("#id").attr('readonly', false);
   		$("#idCheck").one('click', noCheckEvent);
   	//	checkId.removeEventListener('click', this.checkedEvent);
      // $(document).on('click',"#idCheck", noCheckEvent);
	}


	
	// 동적 이벤트 할당
	let noCheckEvent = function() {
		if($("#id").val() == ''){
			alert('id를 입력해 주세요!');
			$("#idCheck").one('click', noCheckEvent);
			return
		}
		// 스크립트 조작 방지에 대한 대책 필요?            	
   		$.ajax({
	        type : "get", //전송방식을 지정한다 (POST,GET)
	        url : "${pageContext.request.contextPath }/join/checkId",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
	        dataType : "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
	        data : {
	        	      "id" : $("#id").val()
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
					$("#id").attr('readonly', true);
	            	$("#idCheck").val('체크 완료! - 초기화');
		            $("#idCheck").one('click', checkedEvent);
	    	    } else {
					alert('중복 된 아이디 입니다.')
					$("#idCheck").one('click', noCheckEvent);
		    	}
	      //      checkId.removeEventListener('click', this.noCheckEvent);
	         //   $(document).on('click',"#idCheck", checkedEvent);
	        }         
	    });   
	}

	let emailCheck = function(){
		if($("#email").val() == ''){
			alert('이메일은 입력해 주세요!');
			$("#emailCheck").one('click', emailCheck);
			return false;
		}
		// $("#emailNo").val('');
		// 스크립트 조작 방지에 대한 대책 필요?            	
   		$.ajax({
	        type : "get", //전송방식을 지정한다 (POST,GET)
	        url : "${pageContext.request.contextPath }/mail/requestNo",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
	        dataType : "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
	        data : {
	        	      "email" : $("#email").val() 
	        	     },
	        error : function(data){
				alert('요청에 실패했습니다.');
	            console.log(data);
	        },
	        success : function(data){
				if(data == '-1'){
					$("#emailCheck").one('click', emailCheck);
		        	alert('이미 가입 된 메일입니다.');
		        	return false;
				}
	        	countDownTimer('timer');
	    		$("#myModal").modal("show");
	        }         
	    });  
	}



	
	$("#idCheck").one('click', noCheckEvent);

	$("#emailCheck").one('click', emailCheck);



	function delete_no(){
		$.ajax({
	        type : "get", //전송방식을 지정한다 (POST,GET)
	        url : "${pageContext.request.contextPath }/mail/deleteNo",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
	        dataType : "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.  
	        error : function(data){
				alert('요청에 실패했습니다.');
	            console.log(data);
	        },
	        success : function(data){
	            
	        }         
	    });
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



      	const countDownTimer1 = function (id, date) { 
          	var _vDate = new Date(date); // 전달 받은 일자 
          	var _second = 1000; 
          	var _minute = _second * 60; 
          	var _hour = _minute * 60; 
          	var _day = _hour * 24; 
          	var timer; 
          	function showRemaining() { 
              	var now = new Date(); 
              	var distDt = _vDate - now; 
              	if (distDt < 0) { 
                  	clearInterval(timer); 
                  	document.getElementById(id).value = '시간 만료!'; 
                  	return; 
                } 
                var days = Math.floor(distDt / _day); 
                var hours = Math.floor((distDt % _day) / _hour); 
                var minutes = Math.floor((distDt % _hour) / _minute); 
                var seconds = Math.floor((distDt % _minute) / _second); 
                //document.getElementById(id).textContent = date.toLocaleString() + "까지 : "; 
                document.getElementById(id).value = days + '일 '; 
                document.getElementById(id).value += hours + '시간 '; 
                document.getElementById(id).value += minutes + '분 '; 
                document.getElementById(id).value += seconds + '초'; 
            } 
            timer = setInterval(showRemaining, 1000); 
        } 

        
       	var timer;
       	const countDownTimer = function (id) { 
       		document.getElementById(id).value = '';
          	var _second = 1000; 
          	var _minute = _second * 60; 
          	var _hour = _minute * 60; 
          	var _day = _hour * 24; 
          	var time = 300000;
          //	var timer; 
          	function showRemaining() { 
              	if (time < 0) { 
                  	clearInterval(timer); 
                  	document.getElementById(id).value = '시간 만료!'; 
                  	return; 
                } 
                var minutes = Math.floor(time / _minute); 
                var seconds = Math.floor((time % _minute) / _second); 
                // += -> 계속 누적된다.
                document.getElementById(id).value = minutes + '분 '; 
                document.getElementById(id).value += seconds + '초'; 
                time = time - 1000;
            } 
            timer = setInterval(showRemaining, 1000); 
        } 
        
        $(function(){  
	        var dateObj = new Date(); 
	        dateObj.setDate(dateObj.getDate() + 1); 
	    //    countDownTimer('timer', dateObj); // 내일까지 
	  //      countDownTimer('timer', '04/01/2024 00:00 AM'); // 2024년 4월 1일까지, 시간을 표시하려면 01:00 AM과 같은 형식을 사용한다. 
	  //      countDownTimer('timer', '04/01/2024'); // 2024년 4월 1일까지 
	    //    countDownTimer('timer', '04/01/2024'); // 2024년 4월 1일까지

		    $("#submitNo").click(function(){
		    	$.ajax({
			        type : "get", //전송방식을 지정한다 (POST,GET)
			        url : "${pageContext.request.contextPath }/mail/confirmNo",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
			        dataType : "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
			        data : {
			        	      "mailNo" : $("#mailNo").val()
			        	     },
			        error : function(data){
						alert('요청에 실패했습니다.');
						$("#emailCheck").one('click', emailCheck);
			            console.log(data);
			        },
			        success : function(data){
			    		if(data == '1'){
					        alert('인증에 성공했습니다.');
			    			$("#emailCheck").one('click', reCheckEmail);
			    			$("#emailCheck").addClass('emailChecked');
			    			$("#emailCheck").val('인증완료 - 초기화');
			    			// $("#emailCheck").attr('readonly', true);
			    			$("#email").attr('readonly', true);
			    			clearInterval(timer); 
			    			$("#myModal").modal("hide");
					    } else {
					    	delete_no();
					    	$("#email").attr('readonly', false);
					    	$("#emailCheck").removeClass('emailChecked');
					    	$("#emailCheck").one('click', emailCheck);
					    	clearInterval(timer); 
					    	$("#myModal").modal("hide");
					    }
			        }         
			    });
		    });


		    $("#myModal").on("hidden.bs.modal", function () {
		    	if($("#emailCheck[class*='emailChecked']").length == 0 ){
		    		delete_no();
		    		$("#emailCheck").removeClass('emailChecked');
			    	clearInterval(timer); 
			    	$("#email").attr('readonly', false);
			    	$("#emailCheck").one('click', emailCheck);
				} else {

				}
		   });

			   
        });    

      const reCheckEmail = function() {
    	  // $("#emailCheck").attr('readonly', false);
    	  $("#email").attr('readonly', false);
    	  $("#emailCheck").val('이메일 인증');
    	  $("#emailCheck").one('click', emailCheck);
      }

           	
    </script>
</body>

</html>
