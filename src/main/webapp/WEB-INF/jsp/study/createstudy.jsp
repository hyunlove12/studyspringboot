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
            <h4>스터디 그룹 만들기</h4>

            <div id="sendmessage">Your message has been sent. Thank you!</div>
            <div id="errormessage"></div>
            
            <form action="/study/createstudy" method="post" role="form" class="contactForm" enctype="multipart/form-data" accept-charset="UTF-8">
              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
              <div class="row">
                <div class="span4 form-group field">
                  <input type="text" name="groupNm" id="groupNm" placeholder="그룹명" data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                  <div class="validation"></div>
                </div>

                <div class="span4 form-group">
                  <input type="text" name="total" id="total" placeholder="가입 가능 인원"  data-msg="Please enter a valid email" />
                  <div class="validation"></div>
                </div>
                <div class="span8 form-group">
                  <!-- <input type="email" name="GROUP_BRIEF" id="GROUP_BRIEF" placeholder="스터디 그룹 요약" data-rule="email" data-msg="Please enter a valid email" /> -->
                  <input type="text" name="groupBrief" id="groupBrief" placeholder="스터디 그룹 요약"   />
                  <div class="validation"></div>
                </div>
                <div class="span4 form-group">
                  <input type="file" name="file" id="file" placeholder="첨부파일"  data-msg="Please enter a valid email" />
                  <div class="validation"></div>
                </div>
                <div class="span8 form-group">
                  <textarea id="groupExplain" name="groupExplain" rows="5" data-rule="required" data-msg="Please write something for us" placeholder="스터디 그룹 설명"></textarea>
                  <div class="validation"></div>
                  <div class="text-center">
                    <button class="btn btn-theme btn-medium margintop10" type="submit">그룹 만들기</button>
                  </div>
                </div>
              </div>
            </form>
          </div>
          <div class="span4">
            <div class="clearfix"></div>
            <aside class="right-sidebar">

              <div class="widget">
                <h5 class="widgetheading">그룹 만들기 설명<span></span></h5>

                <ul class="contact-info">
                  <li><label>그룹명 :</label> 스터디 명을 입력하세요.</li>
                  <li><label>가입 가능 인원 :</label>그룹장 포함 가능한 가입 인원입니다.</li>
                  <li><label>그룹 요약 : </label>그룹에 대한 요약입니다. - 메인화면에 노출됩니다.</li>
                  <li><label>첨부파일 : </label> 필요한 파일을 첨부해주세요. 1개까지 가능합니다.</li>
                  <li><label>그룹 설명 : </label> 그룹에대한 전반적인 규칙, 설명, 방법등에 대하여 적어주세요.</li>
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

</body>

</html>
