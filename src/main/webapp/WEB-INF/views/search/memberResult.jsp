<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>검색결과 :: Tripster</title>
	
    <!-- Bootstrap -->
    <link href="/resources/dist/css/bootstrap.css" rel="stylesheet" media="screen">
    <link href="/resources/assets/css/custom.css" rel="stylesheet" media="screen">
	<link href="/resources/examples/carousel/carousel.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="assets/js/html5shiv.js"></script>
      <script src="assets/js/respond.min.js"></script>
    <![endif]-->
	
    <!-- Fonts -->	
	<link href='http://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:700,400,300,300italic' rel='stylesheet' type='text/css'>	
	<!-- Font-Awesome -->
    <link rel="stylesheet" type="text/css" href="/resources/assets/css/font-awesome.css" media="screen" />
    <!--[if lt IE 7]><link rel="stylesheet" type="text/css" href="assets/css/font-awesome-ie7.css" media="screen" /><![endif]-->
    <!-- REVOLUTION BANNER CSS SETTINGS -->
    <link rel="stylesheet" type="text/css" href="/resources/css/fullscreen.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="/resources/rs-plugin/css/settings.css" media="screen" />
    <!-- Picker -->	
	<link rel="stylesheet" href="/resources/assets/css/jquery-ui.css" />	
	<!-- bin/jquery.slider.min.css -->
	<link rel="stylesheet" href="/resources/plugins/jslider/css/jslider.css" type="text/css">
	<link rel="stylesheet" href="/resources/plugins/jslider/css/jslider.round.css" type="text/css">	
    <!-- jQuery -->	
    <script src="/resources/assets/js/jquery.v2.0.3.js"></script>
	<!-- bin/jquery.slider.min.js -->
	<script type="text/javascript" src="/resources/plugins/jslider/js/jshashtable-2.1_src.js"></script>
	<script type="text/javascript" src="/resources/plugins/jslider/js/jquery.numberformatter-1.2.3.js"></script>
	<script type="text/javascript" src="/resources/plugins/jslider/js/tmpl.js"></script>
	<script type="text/javascript" src="/resources/plugins/jslider/js/jquery.dependClass-0.1.js"></script>
	<script type="text/javascript" src="/resources/plugins/jslider/js/draggable-0.1.js"></script>
	<script type="text/javascript" src="/resources/plugins/jslider/js/jquery.slider.js"></script>
	<!-- end -->
  </head>
  <body id="top" class="thebg" >

	<!--####### HEADER #######-->
	<%@include file="../include/header2.jsp" %>
	
	<div class="container breadcrub">
	    <div>
			<a class="homebtn left" href="#"></a>
			<div class="left offset-2">
				
				<p style="color: black;font-weight:bold;">'${cri.keyword }' 검색결과</p>		
				
			</div>
			
		</div>
		<div class="clearfix"></div>
		<div class="brlines"></div>
	</div>


	<!--####### CONTAINER #######-->
	<div class="container">
		<!-- CONTENTS CONTAINER -->
		<div class="container pagecontainer offset-0">	
			<!-- LEFT CONTENT: SIDE FILTERS -->
			
			<%@include file="../include/sidefilter.jsp" %>
			
			<!-- RIGHT CONTENT -->
			<div class="rightcontent col-md-9 offset-0">
				<div class="tab-content6">
	
					<!-- 유저 리스트 -->
					<div class="member " id="userList">
						<!-- Top FILTERS -->
						<div class="hpadding20">
							<div class="topsortby">
								<div class="col-md-4 offset-0">
										
										<div class="left mt7"><b>Sort by:</b></div>
										
										<div class="right wh70percent">
											<select class="form-control mySelectBoxClass ">
											  <option selected>Guest rating</option>
											  <option>5 stars</option>
											  <option>4 stars</option>
											  <option>3 stars</option>
											  <option>2 stars</option>
											  <option>1 stars</option>
											</select>
										</div>
		
								</div>			
								<div class="col-md-4">
									<div class="w50percent">
										<div class="wh90percent">
											<select class="form-control mySelectBoxClass ">
											  <option selected>Name</option>
											  <option>A to Z</option>
											  <option>Z to A</option>
											</select>
										</div>
									</div>
									<div class="w50percentlast">
										<div class="wh90percent">
											<select class="form-control mySelectBoxClass ">
											  <option selected>Price</option>
											  <option>Ascending</option>
											  <option>Descending</option>
											</select>
										</div>
									</div>					
								</div>
								<div class="col-md-4 offset-0">
									<button class="popularbtn left">Most Popular</button>
									<div class="right">
										<button class="gridbtn" onClick="window.open('list2.html','_self');">&nbsp;</button>
										<button class="listbtn active">&nbsp;</button>
									</div>
								</div>
							</div>
						</div>
						<!-- End of Top FILTERS-->
						
						<!--####### 유저 검색결과 : 템플릿 list2.html #######-->
						<div class="itemscontainer offset-1" >	
						
							<!-- 검색 결과가 없을경우 -->
							<c:set var="more" value="${getNum.memberNum }" />
							<c:if test="${more == 0 }" >
								<div class="offset-2" style="padding:20px ">	
									<br/>
									<em style="color:red;">'${cri.keyword }'</em>
									에 대한 검색 결과가 없습니다.
								</div>	
							</c:if>
							
							<c:forEach items="${memberList}" var = "esMemberVO" begin="0" end="9">
								<div class="col-md-4" >
									<!-- CONTAINER-->
									<div class="carscontainer" style="border:1px solid #e6e6e6">
										<div class="center">
											<a href=""><img src="/resources/updates/update1/img/cars/car04.jpg" alt="유저 배경사진"/></a>
										</div>
																
										<div class="purchasecontainer">
											<div class="col-md-8 offset-0">
												<img src="/resources/images/user.png" alt="유저프로필"  class="left margright10">
												<p class="size14 margtop10">
													<span class="bold"><%-- ${esMemberVO.memberName} --%></span><br>
													<span class="size12 grey">일정수 / 팔로워수</span>
												</p>
												<div class="clearfix"></div>
											</div>		
											<button class="col-md-4 bookbtn">Follow</button>	
										</div>
										<div class="clearfix"></div>
									</div>
									<!-- END OF CONTAINER-->
								</div>
								<div class="offset-2" style="padding-top:30px"></div>
							</c:forEach>
							<div class="clearfix"></div>
						</div>
						<!-- pagination -->
						<div class="hpadding20">
							<ul class="pagination right paddingbtm20">
								<c:set value="member" var="go"/>
								
								<c:if test="${pageMaker.prev }">
									<li><a href="${pageMaker.makeQuery(pageMaker.startPage-1,go) }">&laquo;</a></li>
								</c:if>
								
								<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
									
									<li id="contentsPage"
										<c:out value="${pageMaker.cri.page == idx?'class=active':'' }"></c:out>>
										<a href=${pageMaker.makeQuery(idx,go) } >${idx }</a>
									</li>
									
								</c:forEach>
								
								<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
									<li><a href="${pageMaker.makeQuery(pageMaker.endPage+1,go) }">&raquo;</a></li>
								</c:if>
							</ul>
						</div>
					
					</div>
					<!-- 유저 리스트 끝 -->		

					<div class="clearfix"></div><br/>
						
				</div>
				
			</div>
			
		</div>
		<!-- END OF CONTENTS CONTAINER -->

	</div>
	<!-- END OF Container -->
	
	<!--####### FOOTER #######-->
	<%@include file="../include/footer.jsp" %>

    <!-- Javascript -->	
    <script src="/resources/assets/js/js-list4.js"></script>	
    <!-- Custom Select -->
	<script type='text/javascript' src='/resources/assets/js/jquery.customSelect.js'></script>
    <!-- Custom Select -->
	<script type='text/javascript' src='/resources/js/lightbox.js'></script>	
    <!-- JS Ease -->	
    <script src="/resources/assets/js/jquery.easing.js"></script>
    <!-- Custom functions -->
    <script src="/resources/assets/js/functions.js"></script>
    <!-- jQuery KenBurn Slider  -->
    <script type="text/javascript" src="/resources/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
    <!-- Counter -->	
    <script src="/resources/assets/js/counter.js"></script>	
    <!-- Nicescroll  -->	
	<script src="/resources/assets/js/jquery.nicescroll.min.js"></script>
    <!-- Picker -->	
	<script src="/resources/assets/js/jquery-ui.js"></script>
    <!-- Bootstrap -->	
    <script src="/resources/dist/js/bootstrap.min.js"></script>
  </body>

</html>