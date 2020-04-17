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
        
        
       <!-- slide 1 here -->
       <!--  <div data-src="img/slides/camera/slide1/img1.jpg">
          <div class="camera_caption fadeFromLeft">
            <div class="container">
              <div class="row">
                <div class="span6">
                  <h2 class="animated fadeInDown"><strong>Great template for <span class="colored">multi usage</span></strong></h2>
                  <p class="animated fadeInUp"> Vim porro dicam reprehendunt te, populo quodsi dissentiet cum ad. Ne natum deseruisse vis. Iisque deseruisse sententiae mel ne, dolores appetere vim ut. Sea no tamquam reprimique.</p>
                  <a href="#" class="btn btn-success btn-large animated fadeInUp">
											<i class="icon-link"></i> Read more
										</a>
                  <a href="#" class="btn btn-theme btn-large animated fadeInUp">
											<i class="icon-download"></i> Download
										</a>
                </div>
                <div class="span6">
                  <img src="img/slides/camera/slide1/screen.png" alt="" class="animated bounceInDown delay1" />
                </div>
              </div>
            </div>
          </div>
        </div> -->

       <!-- slide 2 here -->
       <!--  <div data-src="img/slides/camera/slide2/img1.jpg">
          <div class="camera_caption fadeFromLeft">
            <div class="container">
              <div class="row">
                <div class="span6">
                  <img src="img/slides/camera/slide2/iMac.png" alt="" />
                </div>
                <div class="span6">
                  <h2 class="animated fadeInDown"><strong>Put your <span class="colored">Opt in form</span></strong></h2>
                  <p class="animated fadeInUp"> Vim porro dicam reprehendunt te, populo quodsi dissentiet cum ad. Ne natum deseruisse vis. Iisque deseruisse sententiae mel ne, dolores appetere vim ut. Sea no tamquam reprimique.</p>
                  <form>
                    <div class="input-append">
                      <input class="span3 input-large" type="text">
                      <button class="btn btn-theme btn-large" type="submit">Subscribe</button>
                    </div>
                  </form>
                </div>

              </div>
            </div>
          </div>
        </div> -->

        <!-- slide 3 here -->
        <!-- <div data-src="img/slides/camera/slide2/img1.jpg">
          <div class="camera_caption fadeFromLeft">
            <div class="container">
              <div class="row">
                <div class="span12 aligncenter">
                  <h2 class="animated fadeInDown"><strong><span class="colored">Responsive</span> and <span class="colored">cross broswer</span> compatibility</strong></h2>
                  <p class="animated fadeInUp">Pellentesque habitant morbi tristique senectus et netus et malesuada</p>
                  <img src="img/slides/camera/slide3/browsers.png" alt="" class="animated bounceInDown delay1" />
                </div>
              </div>
            </div>
          </div>
        </div>  -->

      </div>

      <!-- slideshow end here -->

    </section>
    <!-- /section featured -->

    <section id="content">
      <div class="container">


       <!--  <div class="row">
          <div class="span12">
            <div class="row">
              <div class="span4">
                <div class="box flyLeft">
                  <div class="icon">
                    <i class="ico icon-circled icon-bgdark icon-star active icon-3x"></i>
                  </div>
                  <div class="text">
                    <h4>High <strong>Quality</strong></h4>
                    <p>
                      Lorem ipsum dolor sit amet, has ei ipsum scaevola deseruisse am sea facilisis.
                    </p>
                    <a href="#">Learn More</a>
                  </div>
                </div>
              </div>

              <div class="span4">
                <div class="box flyIn">
                  <div class="icon">
                    <i class="ico icon-circled icon-bgdark icon-dropbox active icon-3x"></i>
                  </div>
                  <div class="text">
                    <h4>Rich of <strong>Features</strong></h4>
                    <p>
                      Lorem ipsum dolor sit amet, has ei ipsum scaevola deseruisse am sea facilisis.
                    </p>
                    <a href="#">Learn More</a>
                  </div>
                </div>
              </div>
              <div class="span4">
                <div class="box flyRight">
                  <div class="icon">
                    <i class="ico icon-circled icon-bgdark icon-laptop active icon-3x"></i>
                  </div>
                  <div class="text">
                    <h4>Modern <strong>Design</strong></h4>
                    <p>
                      Lorem ipsum dolor sit amet, has ei ipsum scaevola deseruisse am sea facilisis.
                    </p>
                    <a href="#">Learn More</a>
                  </div>
                </div>
              </div>

            </div>
          </div>
        </div> -->

        <!-- <div class="row">
          <div class="span12">
            <div class="solidline"></div>
          </div>
        </div> -->

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
	            	<input type="hidden" value='<sec:authentication property="principal.username"/>'  id="tempUserId"/>
	            </sec:authorize>
				<c:forEach items="${list }" var="r">
					<div class="span3">
		                <div class="pricing-box-wrap animated-fast flyIn">
		                  <div class="pricing-heading">
		                    <h3><strong>${r.groupNm }</strong></h3>
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
		                   	 <a groupId="${r.groupId }" groupNm="${r.groupNm }"  class="muted joinRequest" ><i class="icon-laptop"></i> 가입요청 <i class="icon-angle-down"></i></a>
		                   	 <a class="muted" href="${pageContext.request.contextPath }/study/view/${r.groupId }"><i class="icon-home"></i> 상세보기 <i class="icon-angle-down"></i></a>
		                  </div>
		                </div>
		              </div>
				</c:forEach>
              

              <!-- <div class="span3">
                <div class="pricing-box-wrap special animated-slow flyIn">
                  <div class="pricing-heading">
                    <h3>영어공부 <strong>**기초반입니다**</strong></h3>
                  </div>
                  <div class="pricing-terms">
                    <h6>1달 스파르타 과정!!!!</h6>
                  </div>
                  <div class="pricing-content">
                    <ul>
                      <li><i class="icon-ok"></i> 1 / 5</li>
                      <li><i class="icon-ok"></i> 2020.01.01 ~ 2020.06.30</li>
                      <li><i class="icon-ok"></i> 대학생위주</li>
                      <li><i class="icon-ok"></i> Free 30-days trial</li>
                      <li><i class="icon-ok"></i> Stop anytime easily</li>
                    </ul>
                  </div>
                  <div class="pricing-action">
                    <a href="#" class="btn btn-medium btn-theme"><i class="icon-chevron-down"></i> Sign Up</a>
                  </div>
                </div>
              </div> -->

   

          </div>


        </div>

	</div>

        <!-- <div class="row">
          <div class="span12 aligncenter">
            <h3 class="title">What people <strong>saying</strong> about us</h3>
            <div class="blankline30"></div>

            <ul class="bxslider">
              <li>
                <blockquote>
                  Aliquam a orci quis nisi sagittis sagittis. Etiam adipiscing, justo quis feugiat.Suspendisse eu erat quam. Vivamus porttitor eros quis nisi lacinia sed interdum lorem vulputate. Aliquam a orci quis nisi sagittis sagittis. Etiam adipiscing, justo quis
                  feugiat
                </blockquote>
                <div class="testimonial-autor">
                  <img src="img/dummies/testimonial/1.png" alt="" />
                  <h4>Hillary Doe</h4>
                  <a href="#">www.companyname.com</a>
                </div>
              </li>
              <li>
                <blockquote>
                  Aliquam a orci quis nisi sagittis sagittis. Etiam adipiscing, justo quis feugiat.Suspendisse eu erat quam. Vivamus porttitor eros quis nisi lacinia sed interdum lorem vulputate. Aliquam a orci quis nisi sagittis sagittis. Etiam adipiscing, justo quis
                  feugiat
                </blockquote>
                <div class="testimonial-autor">
                  <img src="img/dummies/testimonial/2.png" alt="" />
                  <h4>Michael Doe</h4>
                  <a href="#">www.companyname.com</a>
                </div>
              </li>
              <li>
                <blockquote>
                  Aliquam a orci quis nisi sagittis sagittis. Etiam adipiscing, justo quis feugiat.Suspendisse eu erat quam. Vivamus porttitor eros quis nisi lacinia sed interdum lorem vulputate. Aliquam a orci quis nisi sagittis sagittis. Etiam adipiscing, justo quis
                  feugiat
                </blockquote>
                <div class="testimonial-autor">
                  <img src="img/dummies/testimonial/3.png" alt="" />
                  <h4>Mark Donovan</h4>
                  <a href="#">www.companyname.com</a>
                </div>
              </li>
              <li>
                <blockquote>
                  Aliquam a orci quis nisi sagittis sagittis. Etiam adipiscing, justo quis feugiat.Suspendisse eu erat quam. Vivamus porttitor eros quis nisi lacinia sed interdum lorem vulputate. Aliquam a orci quis nisi sagittis sagittis. Etiam adipiscing, justo quis
                  feugiat
                </blockquote>
                <div class="testimonial-autor">
                  <img src="img/dummies/testimonial/4.png" alt="" />
                  <h4>Marry Doe Elliot</h4>
                  <a href="#">www.companyname.com</a>
                </div>
              </li>
            </ul>

          </div>
        </div> -->

      </div>
    </section>


   <!--  <section id="works">
      <div class="container">
        <div class="row">
          <div class="span12">
            <h4 class="title">Recent <strong>Works</strong></h4>
            <div class="row">

              <div class="grid cs-style-4">
                <div class="span3">
                  <div class="item">
                    <figure>
                      <div><img src="img/dummies/works/1.jpg" alt="" /></div>
                      <figcaption>
                        <div>
                          <span>
								<a href="img/dummies/works/big.png" data-pretty="prettyPhoto[gallery1]" title="Portfolio caption here"><i class="icon-plus icon-circled icon-bglight icon-2x"></i></a>
								</span>
                          <span>
								<a href="#"><i class="icon-file icon-circled icon-bglight icon-2x"></i></a>
								</span>
                        </div>
                      </figcaption>
                    </figure>
                  </div>
                </div>
                <div class="span3">
                  <div class="item">
                    <figure>
                      <div><img src="img/dummies/works/2.jpg" alt="" /></div>
                      <figcaption>
                        <div>
                          <span>
								<a href="img/dummies/works/big.png" data-pretty="prettyPhoto[gallery1]" title="Portfolio caption here"><i class="icon-plus icon-circled icon-bglight icon-2x"></i></a>
								</span>
                          <span>
								<a href="#"><i class="icon-file icon-circled icon-bglight icon-2x"></i></a>
								</span>
                        </div>
                      </figcaption>
                    </figure>
                  </div>
                </div>
                <div class="span3">
                  <div class="item">
                    <figure>
                      <div><img src="img/dummies/works/3.jpg" alt="" /></div>
                      <figcaption>
                        <div>
                          <span>
								<a href="img/dummies/works/big.png" data-pretty="prettyPhoto[gallery1]" title="Portfolio caption here"><i class="icon-plus icon-circled icon-bglight icon-2x"></i></a>
								</span>
                          <span>
								<a href="#"><i class="icon-file icon-circled icon-bglight icon-2x"></i></a>
								</span>
                        </div>
                      </figcaption>
                    </figure>
                  </div>
                </div>
                <div class="span3">
                  <div class="item">
                    <figure>
                      <div><img src="img/dummies/works/4.jpg" alt="" /></div>
                      <figcaption>
                        <div>
                          <span>
								<a href="img/dummies/works/big.png" data-pretty="prettyPhoto[gallery1]" title="Portfolio caption here"><i class="icon-plus icon-circled icon-bglight icon-2x"></i></a>
								</span>
                          <span>
								<a href="#"><i class="icon-file icon-circled icon-bglight icon-2x"></i></a>
								</span>
                        </div>
                      </figcaption>
                    </figure>
                  </div>
                </div>
              </div>

            </div>
          </div>
        </div>
      </div>
    </section> -->
    
    
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
	    	        },
	    	        success : function(data){
	    	            alert(data);
	    	            $("#message").val("");
	    	            $("#myModal").modal("hide");
	    	        }         
	    	    });
	       	});
        	 
        	 
        	 
        });
        
    </script>
</body>

</html>

