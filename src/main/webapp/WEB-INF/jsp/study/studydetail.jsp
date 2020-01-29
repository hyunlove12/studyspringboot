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

            
              
            </div>
            <!-- 토론하기  -->
            
            <!-- 소주제 -->
            <div class="span12">
            <div class="post-heading">
            	<h4 class="title">
	            	<strong>목차</strong>
	            	<a href="${pageContext.request.contextPath }/study/createstudydetail/${vo.groupId}" class="align-right">등록하기</a>  
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
			              <pre>${r.contents }
			              </pre> 
		                    <a href="#" class="align-right">들어가기</a>
		                    <a href="#" class="align-right">수정하기</a>
		                  </div>
		                </div>
	                </div>		
            	</c:forEach>
            	
              <!-- <div class="accordion-group">
                <div class="accordion-heading">
                  <a class="accordion-toggle active" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
								<i class="icon-minus"></i>1주차 - 스프링 기본 개념 </a>
                </div>
                <div id="collapseOne" class="accordion-body collapse in">
                  <div class="accordion-inner">
                   스프링에 대한 기본개념에 대하여 학습합니다.
                    <a href="#" class="align-right">들어가기</a>
                    <a href="#" class="align-right">수정하기</a>
                  </div>
                </div>
              </div>
              
              <div class="accordion-group">
                <div class="accordion-heading">
                  <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">
								<i class="icon-plus"></i>2주차 - 스프링 설치하기 </a>
                </div>
                <div id="collapseTwo" class="accordion-body collapse">
                  <div class="accordion-inner">
                    스프링을 설치합니다.
                     <a href="#" class="align-right">들어가기</a>
                     <a href="#" class="align-right">수정하기</a>
                  </div>
                </div>
              </div>
              
               <div class="accordion-group">
                <div class="accordion-heading">
                  <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">
								<i class="icon-plus"></i>1. 데이터 수집 </a>
                </div>
                <div id="collapseTwo" class="accordion-body collapse">
                  <div class="accordion-inner">
                    데이터 수집 후 주제 정하기
                     <a href="#" class="align-right">들어가기</a>
                     <a href="#" class="align-right">수정하기</a>
                  </div>
                </div>
              </div>
              
              <div class="accordion-group">
                <div class="accordion-heading">
                  <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">
								<i class="icon-plus"></i>2. 플랫폼 개발 </a>
                </div>
                <div id="collapseTwo" class="accordion-body collapse">
                  <div class="accordion-inner">
                    필요 기술 정한 후 개발일정 및 개발 진행
                     <a href="#" class="align-right">들어가기</a>
                     <a href="#" class="align-right">수정하기</a>
                  </div>
                </div>
              </div> -->
              
              </div>
              
            
            

			<!-- 댓글달기 -->
            <div class="comment-area">
              <h4>4 Comments</h4>
              <div class="media">
                <a href="#" class="pull-left"><img src="${pageContext.request.contextPath }/img/avatar.png" alt="" class="img-circle" /></a>
                <div class="media-body">
                  <div class="media-content">
                    <h6><span>March 12, 2013</span> Smith karlsen</h6>
                    <p>
                      미 참여시 벌금제도 운영하나요?
                    </p>

                    <a href="#" class="align-right">Reply</a>
                  </div>
                  
                  <div class="media">
                    <a href="#" class="pull-left"><img src="${pageContext.request.contextPath }/img/avatar.png" alt="" class="img-circle" /></a>
                    <div class="media-body">
                      <div class="media-content">
                        <h6><span>June 22, 2013</span> Jay Moeller</h6>
                        <p>
                          아니요~~자율 참석이고 자유롭고 토론하며 진행합니다.
                        </p>
                        <a href="#" class="align-right">Reply</a>
                      </div>
                    </div>
                  </div>
                  
                </div>
              </div>
              <div class="media">
                <a href="#" class="pull-left"><img src="${pageContext.request.contextPath }/img/avatar.png" alt="" class="img-circle" /></a>
                <div class="media-body">
                  <div class="media-content">
                    <h6><span>June 24, 2013</span> Dean Zaloza</h6>
                    <p>
                      자리 남아있나요?
                    </p>

                    <a href="#" class="align-right">Reply</a>
                  </div>
                </div>
              </div>

              <div class="marginbot30"></div>
              <h4>Leave your comment</h4>

              <form id="commentform" action="#" method="post" name="comment-form">
                <div class="row">
                  <div class="span6">
                    <input type="text" placeholder="* Enter your full name" />
                  </div>
                  <div class="span6">
                    <input type="text" placeholder="* Enter your email address" />
                  </div>
                  <div class="span12 margintop10">
                    <input type="text" placeholder="Enter your website" />
                  </div>
                  <div class="span12 margintop10">
                    <p>
                      <textarea rows="12" class="input-block-level" placeholder="*Your comment here"></textarea>
                    </p>
                    <p>
                      <button class="btn btn-theme btn-medium margintop10" type="submit">Submit comment</button>
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
