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
                <li class="active">수행 현황 등록</li>
              </ul>
              <h2>수행 현황 등록</h2>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section id="content">
      <div class="container">
        <div class="row">

          <div class="span12">

            <article class="single">
              <div class="row">

                <div class="span12">
                  <div class="post-image">
                    <div class="post-heading">
                      <h3><a href="#">${vo.groupNm }</a></h3>
                    </div>
                    <img src="${pageContext.request.contextPath }/img/dummies/blog/img1.jpg" alt="" />
                  </div>
                  <div class="meta-post">
                    <ul>
                      <li><i class="icon-file"></i></li>
                      <li>By <a href="#" class="author">Admin</a></li>
                      <li>On <a href="#" class="date">10 Jun, 2013</a></li>
                      <li>Tags: <a href="#">Design</a>, <a href="#">Blog</a></li>
                    </ul>
                  </div>
                 ${vo.groupExplain }
                </div>
              </div>
            </article>
         </div>      
            <!-- 토론하기  -->
            
            <!-- 소주제 -->
            <div class="span12">
            <div class="post-heading">
            	<h4 class="title">
	            	<strong>목차</strong>
	            	<c:if test="${groupRole == 'admin' or groupRole == 'sadmin'}">
	            		<a href="${pageContext.request.contextPath }/study/createstudydetail/${vo.groupId}" class="align-right">등록하기</a>  
            		</c:if>
            	</h4>       	
            </div>  
                   
           
              
              
            <!-- start: Accordion -->
            <div class="accordion" id="accordion">
            	<div class="accordion-group">
	                <div class="accordion-heading">
	                  <a class="accordion-toggle active" data-toggle="collapse" data-parent="#accordion" href="#${processVO.subtitleId }">
									<i class="icon-minus"></i>${processVO.subtitleNm } </a>
	                </div>
	                <div id="${processVO.subtitleId }" class="accordion-body collapse in">
	                  <div class="accordion-inner">
		              <pre>${processVO.contents }
		              </pre> 
	                    <c:if test="${groupRole == 'admin'}"><a href="#" class="align-right">수정하기</a></c:if>
	                  </div>
	                </div>
                </div>		 
              </div>
              
            
            

			<!-- 댓글달기 -->
            <div class="comment-area">
              <h4>${listCount }명 등록</h4>
              <c:forEach var="r" items="${list }">
	              <div class="media">
	                <a href="#" class="pull-left"><img src="${pageContext.request.contextPath }/upload/profile/${r.unityId }" alt="" class="img-circle reply" /></a>
	                <div class="media-body">
	                  <div class="media-content">
	                    <h6><span>${r.regDt }</span> ${r.id }</h6>
	                    <pre>${r.progressSit }</pre>
	                    <div class="progress progress-striped">
		                  <div class="bar bar${r.progressing }"></div>
		                 
		                </div>   
	                </div>
	              </div>
	             </div>
              </c:forEach>
              
              <%-- <div class="media">
                <a href="#" class="pull-left"><img src="${pageContext.request.contextPath }/img/avatar.png" alt="" class="img-circle" /></a>
                <div class="media-body">
                  <div class="media-content">
                    <h6><span>March 12, 2013</span> hong</h6>
                    <pre>
                      수행완료~
                    </pre>
                    <div class="progress progress-striped bar-success">
	                  <div class="progress-striped bar-success"></div>
	                </div>   
                </div>
              </div>
              
              <div class="media">
                <a href="#" class="pull-left"><img src="${pageContext.request.contextPath }/img/avatar.png" alt="" class="img-circle" /></a>
                <div class="media-body">
                  <div class="media-content">
                    <h6><span>June 24, 2013</span> Dean Zaloza</h6>
                    <pre>
                      제대로 못함..ㅠ
                    </pre>
                    
                    <div class="progress progress-striped">
	                  <div class="bar bar20"></div>
	                </div>  
	                  
                  </div>
                </div>
              </div> --%>


              <div class="marginbot30"></div>
              <h4>수행현황 등록 / 수정</h4>

              <form id="commentform" onsubmit="return fn_checkForm();" action="/study/registprogress" method="post" name="comment-form">
              	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
              	<input type="hidden" name="groupId" value="${vo.groupId}" />
              	<input type="hidden" name="subtitleId" value="${processVO.subtitleId }" />
                <div class="row">
                  <div class="span6">
                    <input id="progressing" name="progressing" type="text" onKeyup="inNumber();" placeholder="진행도(0 ~ 100)" />
                  </div>
                  <div class="span6">
                    <input id="limitDate" name="limitDate" type="text" placeholder="완료 예상 일정" />
                  </div>
                  <div class="span12 margintop10">
                    <input type="file" />
                  </div>
                  <div class="span12 margintop10">
                    <p>
                      <textarea id="progressSit" name="progressSit" rows="12" class="input-block-level" placeholder="설명"></textarea>
                    </p>
                    <p>
                      <button class="btn btn-theme btn-medium margintop10" type="submit">수행현황 등록</button>
                    </p>
                  </div>
                </div>
              </form>
              
            </div>
          </div>

        </div>
      </div>
    </section>

    <c:import url="/WEB-INF/jsp/includes/footer.jsp" /> 
  </div>
  <a href="#" class="scrollup"><i class="icon-angle-up icon-square icon-bglight icon-2x active"></i></a>

	<script type="text/javascript">
        function fn_checkForm(){
    		if($("#progressing").val() == '' ){
    			alert('진행도를 적어주세요!');
    			return false;
    		}
    		if($("#limitDate").val() == '' ){
    			alert('완료예상 일정을 적어주세요!');
    			return false;
    		}
    		if($("#progressSit").val() == '' ){
    			alert('설명을 적어주세요!');
    			return false;
    		}
    		return true;
    	}	        
        function inNumber(){
       	  if(event.keyCode<48 || event.keyCode>57){
           	 alert('숫자만 입력하세요!');
       	     event.returnValue=false;
       	  }
       	}
    </script>
</body>

</html>
