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
                <li><a href="${pageContext.request.contextPath }/main">main</a> <i class="icon-angle-right"></i></li>
                <li class="active">error</li>
              </ul>
              <h2>에러페이지</h2>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section id="content">
      <div class="container">
        <div class="row">
          <div class="span12">
            <!-- <ul class="team-categ filter">
              <li class="all active"><a href="#">전체</a></li>
              <li class="design"><a href="#" title="">개발</a></li>
            </ul> -->

            <div class="clearfix"></div>
            <div class="row">
              <section id="team">	
	                <h4 class="title"><strong>페이지가 없습니다! -> <a href="${pageContext.request.contextPath }/main">메인페이지로 돌아가기</a></strong> <span></span></h4>     
              </section>

            </div>
          </div>
        </div>
      </div>
    </section>
	
	<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
       <div class="modal-header">
         <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
         <h3 id="myModalLabel">요청 승인 / 거부</h3>
       </div>
       <form>
	       <div class="modal-body">
	       		<div class="span12">
		       		<div class="row controls">
				        <div class="span6 control-group">
				        	<label>내용</label>
				      	  <textarea id="confirmCont"  rows="4" class="span4"></textarea>
				        </div>
			        </div>
		        </div>
	       </div>
	       <div class="modal-footer">
	       	 <select id="confirmRole">
	       	 	<option value="">승인 / 거부 선택</option>	
	       	 	<option value="admin">관리자</option>
                <option value="user">일반</option>
                <option value="refuse">가입 거부</option>
	       	 </select>
	         <input id="requestbutton" type="button" value="확인" class="btn btn-primary">
		     <input type="hidden" id="tempGroupId"/>	
		     <input type="hidden" id="tempId"/>  
	       </div>
       </form>
     </div>

	<c:import url="/WEB-INF/jsp/includes/footer.jsp" /> 
	
  </div>
  <a href="#" class="scrollup"><i class="icon-angle-up icon-square icon-bglight icon-2x active"></i></a>
  <script type="text/javascript">
       $(function(){
    	   checkTable();
    	   
    	   var token = $("meta[name='_csrf']").attr("content");
    	   var header = $("meta[name='_csrf_header']").attr("content");
    	   $(function() {
    	       $(document).ajaxSend(function(e, xhr, options) {
    	           xhr.setRequestHeader(header, token);
    	       });
    	   });

    	   
       	   $("#requestbutton").click(function(){
           	   if($("#confirmRole").val() == '') {
					alert('승인 여부를 확인하세요!');
					return;
               }
               alert($("#tempId").val());
               alert($("#tempGroupId").val());
               alert($("#confirmRole").val());
               alert($("#confirmCont").val());
	       		$.ajax({
	    	        type : "post", //전송방식을 지정한다 (POST,GET)
	    	        url : "${pageContext.request.contextPath }/studymanagement/joinMember",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
	    	        dataType : "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
	    	        data : {
	    	        	      "id" : $("#tempId").val()
	    	        	    , "groupId" : $("#tempGroupId").val()
	    	        	    , "groupRole" : $("#confirmRole").val()
	    	        	    , "confirmCont" : $("#confirmCont").val()
	    	        	     },
	    	        error : function(data){
	    	          $("#confirmCont").val("");
	    	          $("#tempId").val("");
	    	          $("#tempGroupId").val("");
	    	          $("#confirmRole").find('option:first').attr('selected', 'selected');
	    	          alert(data);
	    	          //console.log(data);
	    	        },
	    	        success : function(data){
	    	            alert(data);
	    	            $("#confirmCont").val("");
	    	            $("#tempId").val("");
	    	            $("#tempGroupId").val("");
	    	            $("#confirmRole").find('option:first').attr('selected', 'selected');
	    	            $("#myModal").modal("hide");
	    	            location.href = location.href;
	    	        }         
	    	    });
	       	});
       		
       		$(".requestConfirm").click(function(event) {
       			console.log(event);
       			setNoClick(event);
       		}); 
       		
       	});
       
       function setNoClick(event){
    		if(event.stopPropagation) {
    		    event.stopPropagation();
    		} else {		// ie8
    			event.cancelBubble = true;
    		}
       }
       
       function openContent(index){
    	   var disAttr = $("#requestContent"+index).css("display");
    	   if(disAttr == 'none') {
    		   $("#requestContent"+index).removeClass("hide"); 
    	   } else {
    		   $("#requestContent"+index).addClass("hide"); 
    	   }  	   
       }

       
       function openModal(groupId, id){
    	   // setNoClick(this.event)
           $("#tempGroupId").val(groupId);
           $("#tempId").val(id);
    	   $("#myModal").modal("show");
  		   // setNoClick(event);   
       }

       function checkTable(id, class_, colsapn){
			let requestListCount = $(".requestlist").length
			if(requestListCount == 0) {
				let element = "<tr><td colspan='6'>받은 요청이 없습니다.</td></tr>"
				$("#requestTable").html(element);
			}
       }
	</script>

</body>
</html>