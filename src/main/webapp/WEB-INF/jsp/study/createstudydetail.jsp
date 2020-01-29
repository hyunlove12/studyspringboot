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
                <li class="active">Post left sidebar</li>
              </ul>
              <h2>Post left sidebar</h2>
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

            <!-- 토론하기  -->
            
            <!-- 소주제 -->
            <div class="span12">
            <div class="post-heading">
            	<h4 class="title">
	            	<strong>목차</strong>
            	</h4>       	
            </div>                 
           
          
            <!-- start: Accordion -->
            <div class="accordion" id="accordion">            
            	<c:forEach items="${sublist }" var="r">
	            	<div class="accordion-group">
		                <div class="accordion-heading">
		                  <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#${r.subtitleId }">
										<i class="icon-plus"></i>${r.subtitleNm } </a>
		                </div>
		                <div id="${r.subtitleId }" class="accordion-body collapse">
		                  <div class="accordion-inner">
		                   ${r.contents }
		                    <a href="#" class="align-right">들어가기</a>
		                    <a href="#" class="align-right">수정하기</a>
		                  </div>
		                </div>
	                </div>		
            	</c:forEach>
              </div>
              
              <div class="marginbot30"></div>
              <h4>소주제 등록</h4>

              <form id="commentform" action="/study/createstudydetail" method="post" name="comment-form">
              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
              <input type="hidden" value="${vo.groupId }" name="groupId"  id="groupId" />
                <div class="row">
                  <div class="span12 margintop10">
                    <input id="subtitleNm" name="subtitleNm" type="text" placeholder="소제목" />
                  </div>
                  <div class="span6">
                    <input type="text" placeholder="기한" />
                  </div>
                  <div class="span6">
                    <input type="text" placeholder="대상자" />
                  </div>
                  <div class="span12 form-group">
                  	<input type="file" name="file" id="file" placeholder="첨부파일"  data-msg="Please enter a valid email" />
                </div>
                  <div class="span12 margintop10">
                    <p>
                      <textarea id="contents" name="contents" rows="12" class="input-block-level" placeholder="설명"></textarea>
                    </p>
                    <p>
                      <button class="btn btn-theme btn-medium margintop10" type="submit">등록하기</button>
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


</body>

</html>
