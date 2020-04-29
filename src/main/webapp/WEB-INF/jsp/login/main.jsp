<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<c:import url="/WEB-INF/jsp/includes/head.jsp" />
<body>

  <div id="wrapper">

    <c:import url="/WEB-INF/jsp/includes/header.jsp" />

    <!-- section featured -->
    <section id="featured">

      <!-- slideshow start here -->

      <div class="camera_wrap" id="camera-slide">

		<!-- slide 1 here -->
        <div data-src="img/slides/camera/slide1/img1.jpg">
          <div class="camera_caption fadeFromLeft">
            <div class="container">
              <div class="row">
                <div class="span12">
                  <h2 class="animated fadeInDown"><strong>함께하는 <span class="colored">스터디!!</span></strong></h2>
                  <p class="animated fadeInUp"> 나만의 스터디 그룹을 만들어서 사람들과 같이 공부하고 일정관리를 해보세요!</p>
                  <p class="animated fadeInUp"> 일정관리를 위한 캘린더, 엑셀다운 등 다양한 기능을 제공합니다.</p>
                  <p class="animated fadeInUp"> 학교 팀프로젝트로 더이상 스트레스 받지 마세요!</p>
                  <a href="#" class="btn btn-success btn-large animated fadeInUp">
											<i class="icon-link"></i> Read more
										</a>
                  <a href="#" class="btn btn-theme btn-large animated fadeInUp">
											<i class="icon-download"></i> Download
										</a>
                </div>
              </div>
            </div>
          </div>
        </div>
        
     

      </div>

      <!-- slideshow end here -->

    </section>
    <!-- /section featured -->

    <section id="content">
      <div class="container">

        <div class="row">
          <div class="span12">
            <div class="row">
              <div class="span12">
                <div class="aligncenter">
                  <h3>최신 등록 그룹 </h3>                  
                </div>
              </div>
            </div>


            <div class="row">
            	<sec:authorize access="isAnonymous()">
            		<input type="hidden" value=''  id="tempUserId"/>
            	</sec:authorize>
            	<sec:authorize access="isAuthenticated()">
	            	<%-- <input type="hidden" value='<sec:authentication property="principal.username"/>'  id="tempUserId"/> --%>
	            	<!-- property="principal 객체 -->
	            	<input type="hidden" value='${suserId }'  id="tempUserId"/>
	            </sec:authorize>
				<c:forEach items="${list }" var="r">
					<div class="span3">
		                <div class="pricing-box-wrap animated-fast flyIn">
		                  <div class="pricing-heading">
		                    <h3><strong>${r.groupNm } </strong></h3>
		                  </div>
		                  <div class="pricing-terms">
		                    <h6>${r.groupBrief }</h6>
		                  </div>
		                  <div class="pricing-content">
		                    <ul>
		                      <li><i class="icon-ok"></i> ${r.currentMember } / ${r.total } 명 </li>
		                      <li><i class="icon-ok"></i> ${r.regDt } 설립 </li>
		                      <li><i class="icon-ok"></i> ${r.email } </li>
		                    </ul>
		                  </div>
		                  <div class="pricing-action">
		                   <!--  <a href="#" class="btn btn-medium btn-theme"><i class="icon-chevron-down"></i> Sign Up</a> -->	
		                   	<c:if test="${r.suserId ne r.checkJoinId}">
		                   		<a groupId="${r.groupId }" groupNm="${r.groupNm }"  class="muted joinRequest" ><i class="icon-laptop"></i> 가입요청 <i class="icon-angle-down"></i></a>
		                   	</c:if>	   
		                   	 <a class="muted" href="${pageContext.request.contextPath }/study/view/${r.groupId }"><i class="icon-home"></i> 상세보기 <i class="icon-angle-down"></i></a>
		                  </div>
		                </div>
		              </div>
				</c:forEach>
            
   

          </div>


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
				        	<label>요청내용</label>
				      	  <textarea id="message"  rows="4" class="span4"></textarea>
				        </div>
			        </div>
		        </div>
	       </div>
	       <div class="modal-footer">
	         <input id="requestbutton" type="button" value="가입요청" class="btn btn-primary">
		     <input type="hidden" id="tempGroupId"/>	  
	       </div>
       </form>
     </div>
     
	
  	<c:import url="/WEB-INF/jsp/includes/footer.jsp" /> 
  </div>
  <a href="#" class="scrollup"><i class="icon-angle-up icon-square icon-bglight icon-2x active"></i></a>
  
  <script type="text/javascript">
        $(function(){           
        	
        	var token = $("meta[name='_csrf']").attr("content");
      	    var header = $("meta[name='_csrf_header']").attr("content");
      	    $(function() {
      	       $(document).ajaxSend(function(e, xhr, options) {
      	           xhr.setRequestHeader(header, token);
      	       });
      	    });
      	    
        	$("a.joinRequest").click(function(event) {
        		if($("#tempUserId").val() == "anonymousUser" || $("#tempUserId").val() == "" || $("#tempUserId").val() == null){
        			alert("로그인이 필요합니다!");
        			return;
        		}
        		
       			var groupNm = $(this).attr("groupNm") + ' 가입요청';
       			var groupId = $(this).attr("groupId");
       			$("#tempGroupId").val(groupId);
       			$("#myModalLabel").empty();
       			$("#myModalLabel").append(groupNm);
       			$("#myModal").modal("show");
       		});

       		let boo = true;
        	$("#requestbutton").click(function(){
            	// 재선언이 되는것?
            	// let boo = true;
        		// 요청 여부 확인
        		$.ajax({
		    	        type : "get", //전송방식을 지정한다 (POST,GET)
		    	        url : "${pageContext.request.contextPath }/study/checkrequestjoin",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
		    	        dataType : "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
		    	        data : {
		    	        	      "groupId" : $("#tempGroupId").val()
		    	        	     },
		    	        error : function(data){
			    	        alert('요청에 실패했습니다.');
			    	        boo = false;
		    	            console.log(data);
		    	        },
		    	        success : function(data){
		    	            boo = data;
		    	            // ajax라 밖에 선언하면 값이 이상하게 될 가능성
		    	            if(boo == 'true') {
		    	        		// 가입 요청
		    		       		$.ajax({
		    		    	        type : "post", //전송방식을 지정한다 (POST,GET)
		    		    	        url : "${pageContext.request.contextPath }/study/joinrequest",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
		    		    	        dataType : "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
		    		    	        data : {
		    		    	        	      "groupId" : $("#tempGroupId").val()
		    		    	        	    , "requestCont" : $("#message").val()
		    		    	        	     },
		    		    	        error : function(data){
		    		    	        	alert('요청에 실패했습니다.');
		    		    	            console.log(data);
		    		    	        },
		    		    	        success : function(data){
		    		    	            alert(data);
		    		    	            $("#message").val("");
		    		    	            $("#myModal").modal("hide");
		    		    	        }         
		    		    	    });
		    	          	} else {
		    					alert('이미 요청된 그룹 입니다!');	
		    	          	}
		    	        }         
	    	    });
	          		
	       	});
        	 
        	 
        	 
        });
        
    </script>
</body>

</html>

