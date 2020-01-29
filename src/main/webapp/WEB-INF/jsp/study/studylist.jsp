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
		                  <li id="${r.groupId }" class="item-thumbs span3 design" data-id="id-0" data-type="design">
		                    <div class="team-box thumbnail">
		                      <%-- <img src="${pageContext.request.contextPath }/img/dummies/team/1.jpg" alt="" /> --%>
		                      <div class="caption">
		                        <h5>${r.groupNm }</h5>
		                        <p>
		                          ${r.groupBrief }
		                        </p>
		                        <ul class="social-network">
		                          <li><a href="/main" title="Twitter">쪽지</a></li>
		                          <li><a href="#" title="Google +">가입하기</i></a></li>
		                          <li><a href="#" title="Dribbble">비밀<!-- <i class="icon-circled icon-bgdark icon-dribbble"></i> --></a></li>
		                        </ul>
		                      </div>
		                    </div>
		                  </li>
		                  <!-- End Item Project -->					
					</c:forEach>

                  <!-- Item Project and Filter Name -->
                  <li class="item-thumbs span3 dev" data-id="id-1" data-type="dev">
                    <div class="team-box thumbnail">
                      <img src="img/dummies/team/2.jpg" alt="" />
                      <div class="caption">
                        <h5>David Clark</h5>
                        <p>
                          Web programmer
                        </p>
                        <ul class="social-network">
                          <li><a href="#" title="Twitter"><i class="icon-circled icon-bgdark icon-twitter"></i></a></li>
                          <li><a href="#" title="Google +"><i class="icon-circled icon-bgdark icon-google-plus"></i></a></li>
                          <li><a href="#" title="Dribbble"><i class="icon-circled icon-bgdark icon-dribbble"></i></a></li>
                        </ul>
                      </div>
                    </div>
                  </li>
                  <!-- End Item Project -->

          

                </ul>
              </section>

            </div>
          </div>
        </div>
      </div>
    </section>
	<c:import url="/WEB-INF/jsp/includes/footer.jsp" /> 
  </div>
  <a href="#" class="scrollup"><i class="icon-angle-up icon-square icon-bglight icon-2x active"></i></a>
  <script type="text/javascript">
       $(function(){
       		$("li").click(function(){
       			var id = $(this).attr("id");
       			window.location.href = '${pageContext.request.contextPath }/study/view/' + id;
	       	});
       	});
	</script>

</body>

</html>
