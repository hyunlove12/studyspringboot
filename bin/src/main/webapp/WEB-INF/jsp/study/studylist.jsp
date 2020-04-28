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
                <li><a href="#">Pages</a> <i class="icon-angle-right"></i></li>
                <li class="active">GroupList</li>
              </ul>
              <h2>스터디 그룹 리스트</h2>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section id="content">
      <div class="container">
        <div class="row">
          <div class="span12">
            <ul class="team-categ filter">
              <li class="all active"><a href="#">전체</a></li>
              <li class="design"><a href="#" title="">개발</a></li>
              <li class="marketing"><a href="#" title="">영어</a></li>
              <li class="dev"><a href="#" title="">기타</a></li>
            </ul>

            <div class="clearfix"></div>
            <div class="row">
              <section id="team">
                <ul id="thumbs" class="team">
					<c:forEach var="r" items="${list }"  varStatus="i">
		                  <!-- Item Project and Filter Name -->
		                  <li id="${r.groupId }" class="outer item-thumbs span3 design" data-id="id-0" data-type="design">
		                    <div class="team-box thumbnail">
		                      <%-- <img src="${pageContext.request.contextPath }/img/dummies/team/1.jpg" alt="" /> --%>
		                      <div class="caption">
		                        <h5>${r.groupNm }</h5>
		                        <p>
		                          ${r.groupBrief }
		                        </p>
		                        <ul class="social-network">
		                          <li><a href="/main" title="Twitter">쪽지</a></li>
		                          <!-- <li><a href="/study/joinrequest" title="Google +">가입요청</a></li> -->
		                          <c:if test="${r.suserId ne r.checkJoinId}">
		                          	<li><a href="#myModal" groupId="${r.groupId }" groupNm="${r.groupNm }" class="noClick" rel="modal:open" data-toggle="modal">가입요청</a></li>		                          
		                          </c:if>
		                          <li><a href="#" title="Dribbble">비밀<!-- <i class="icon-circled icon-bgdark icon-dribbble"></i> --></a></li>
		                        </ul>
		                      </div>
		                    </div>
		                  </li>
		                  <!-- End Item Project -->					
					</c:forEach>

                          

                </ul>
              </section>

            </div>
          </div>
        </div>
      </div>
    </section>
    
    <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog"	aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 id="myModalLabel"></h3>
		</div>
		<form >
			<div class="row controls">
		        <div class="span6 control-group">
		        	<label>요청내용</label>
		      	  <textarea id="message"  rows="4" class="span4"></textarea>
		        </div>
	        </div>
	        <div class="btn-toolbar">
	        	<input id="requestbutton" type="button" value="가입요청" class="btn btn-primary">
	        	<input type="hidden" id="tempGroupId"/>	        	
	        </div>
		</form>
		<!-- <div class="modal-body">
			<p>One fine body…</p>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
			<button class="btn btn-primary">가입요청</button>
		</div> -->
	</div>

	<c:import url="/WEB-INF/jsp/includes/footer.jsp" /> 
  </div>
  <a href="#" class="scrollup"><i class="icon-angle-up icon-square icon-bglight icon-2x active"></i></a>
  <script type="text/javascript">
       $(function(){
    	   let result = ${result};
    	   if(result > 0) {
    		   alert('생성에 성공하였습니다.');
    	   } else if(result == 0) {
    		   alert("생성에 실패하였습니다.");
    	   } else {
    		   result = -1;
    	   }
    	   var token = $("meta[name='_csrf']").attr("content");
    	   var header = $("meta[name='_csrf_header']").attr("content");
    	   $(function() {
    	       $(document).ajaxSend(function(e, xhr, options) {
    	           xhr.setRequestHeader(header, token);
    	       });
    	   });
    	   
       		$("li.outer").click(function(){
       			var id = $(this).attr("id");
       			window.location.href = '${pageContext.request.contextPath }/study/view/' + id;
	       	});
       		
       		$(".noClick").click(function(event) {
       			var groupNm = $(this).attr("groupNm") + ' 가입요청';
       			var groupId = $(this).attr("groupId");
       			$("#tempGroupId").val(groupId);
       			$("#myModalLabel").empty();
       			$("#myModalLabel").append(groupNm);
       			$("#myModal").modal("show");
       			setNoClick(event);
       		});
       		
       		$("#requestbutton").click(function(){
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
	    	          //console.log(data);
	    	        },
	    	        success : function(data){
	    	            alert(data);
	    	            $("#message").val("");
	    	            $("#myModal").modal("hide");
	    	        }         
	    	    });
	       	});
       		
       	});
       
       function setNoClick(event){
    		if(event.stopPropagation) {
    		    event.stopPropagation();
    		} else {		// ie8
    			event.cancelBubble = true;
    		}
    	}
	</script>

</body>
</html>