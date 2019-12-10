<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>IT WILL BOOK - Location</title>
<!-- Fonts-->
    <link href="https://fonts.googleapis.com/css?family=Archivo+Narrow:300,400,700%7CMontserrat:300,400,500,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" href="<%=cp%>/book/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=cp%>/book/plugins/ps-icon/style.css">
    <!-- CSS Library-->
    <link rel="stylesheet" href="<%=cp%>/book/plugins/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=cp%>/book/plugins/owl-carousel/assets/owl.carousel.css">
    <link rel="stylesheet" href="<%=cp%>/book/plugins/jquery-bar-rating/dist/themes/fontawesome-stars.css">
    <link rel="stylesheet" href="<%=cp%>/book/plugins/slick/slick/slick.css">
    <link rel="stylesheet" href="<%=cp%>/book/plugins/bootstrap-select/dist/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="<%=cp%>/book/plugins/Magnific-Popup/dist/magnific-popup.css">
    <link rel="stylesheet" href="<%=cp%>/book/plugins/jquery-ui/jquery-ui.min.css">
    <link rel="stylesheet" href="<%=cp%>/book/plugins/revolution/css/settings.css">
    <link rel="stylesheet" href="<%=cp%>/book/plugins/revolution/css/layers.css">
    <link rel="stylesheet" href="<%=cp%>/book/plugins/revolution/css/navigation.css">
    <!-- Custom-->
    <link rel="stylesheet" href="<%=cp %>/book/css/style.css">
<script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script>
 function initialize() {
	//map1
	 var Y_point = 37.501428; // Y 좌표
	 var X_point = 127.026304; // X 좌표
	 var zoomLevel = 17; // 첫 로딩시 보일 지도의 확대 레벨
	 var markerTitle = "알라딘 중고서점 강남점"; // 현재 위치 마커에 마우스를 올렸을때 나타나는 이름
	 var markerMaxWidth = 300; // 마커를 클릭했을때 나타나는 말풍선의 최대 크기
	
	 // 말풍선 내용
	 var contentString = '<div id="content">' +
	 '<div id="siteNotice">' +
	 '</div>' +
	 '<h3 id="firstHeading" class="firstHeading">알라딘 중고서점 강남점</h3>' +
	 '<div id="bodyContent">' +
	 '<p>서울특별시 강남구 강남대로 438 지하 1층<br />' +
	 'Tel. 1544 - 2514</p>' +
	 '</div>' +
	 '</div>';
	
	 var myLatlng = new google.maps.LatLng(Y_point, X_point);
	 var mapOptions = {
	 zoom: zoomLevel,
	 center: myLatlng,
	 mapTypeId: google.maps.MapTypeId.ROADMAP
	 }
	 var map = new google.maps.Map(document.getElementById('map_view'), mapOptions);
	
	 var marker = new google.maps.Marker({
	 position: myLatlng,
	 map: map,
	 title: markerTitle
	 });
	
	 var infowindow = new google.maps.InfoWindow(
	 {
	 content: contentString,
	 maxWidth: markerMaxWidth
	 }
	 );
	
	 google.maps.event.addListener(marker, 'click', function() {
	 infowindow.open(map, marker);
	 });
	 
	 
	 //map2
	 var Y_point2 = 37.557527; // Y 좌표
	 var X_point2 = 126.936734; // X 좌표
	
	 var markerTitle2 = "알라딘 중고서점 신촌점"; // 현재 위치 마커에 마우스를 올렸을때 나타나는 이름
	
	
	 // 말풍선 내용
	 var contentString2 = '<div id="content">' +
	 '<div id="siteNotice">' +
	 '</div>' +
	 '<h3 id="firstHeading" class="firstHeading">알라딘 중고서점 신촌점</h3>' +
	 '<div id="bodyContent">' +
	 '<p>서울특별시 서대문구 신촌동 연세로 21<br />' +
	 'Tel. 1544 - 2514 </p>' +
	 '</div>' +
	 '</div>';
	
	 var myLatlng2 = new google.maps.LatLng(Y_point2, X_point2);
	 var mapOptions2 = {
	 zoom: zoomLevel,
	 center: myLatlng2,
	 mapTypeId: google.maps.MapTypeId.ROADMAP
	 }
	 var map2 = new google.maps.Map(document.getElementById('map_view2'), mapOptions2);
	
	 var marker2 = new google.maps.Marker({
	 position: myLatlng2,
	 map: map2,
	 title: markerTitle2
	 });
	
	 var infowindow2 = new google.maps.InfoWindow(
	 {
	 content: contentString2,
	 maxWidth: markerMaxWidth
	 }
	 );
	
	 google.maps.event.addListener(marker2, 'click', function() {
	 infowindow2.open(map2, marker2);
	 });
	 
	//map3
	 var Y_point3 = 37.266066; // Y 좌표
	 var X_point3 = 127.001336; // X 좌표
	
	 var markerTitle3 = "알라딘 중고서점 수원점"; // 현재 위치 마커에 마우스를 올렸을때 나타나는 이름
	
	
	 // 말풍선 내용
	 var contentString3 = '<div id="content">' +
	 '<div id="siteNotice">' +
	 '</div>' +
	 '<h3 id="firstHeading" class="firstHeading">알라딘 중고서점 수원점</h3>' +
	 '<div id="bodyContent">' +
	 '<p>경기도 수원시 팔달구 매산동 덕영대로 925<br />' +
	 'Tel. 1544 - 2514 </p>' +
	 '</div>' +
	 '</div>';
	
	 var myLatlng3 = new google.maps.LatLng(Y_point3, X_point3);
	 var mapOptions3 = {
	 zoom: zoomLevel,
	 center: myLatlng3,
	 mapTypeId: google.maps.MapTypeId.ROADMAP
	 }
	 var map3 = new google.maps.Map(document.getElementById('map_view3'), mapOptions3);
	
	 var marker3 = new google.maps.Marker({
	 position: myLatlng3,
	 map: map3,
	 title: markerTitle3
	 });
	
	 var infowindow3 = new google.maps.InfoWindow(
	 {
	 content: contentString3,
	 maxWidth: markerMaxWidth
	 }
	 );
	
	 google.maps.event.addListener(marker3, 'click', function() {
	 infowindow3.open(map3, marker3);
	 });
 }
 </script>
</head>
<body onload="initialize()">
<main class="ps-main">
 <header class="header">
      <div class="header__top">
        <div class="container-fluid">
          <div class="row">
                <div class="col-lg-6 col-md-8 col-sm-6 col-xs-12 ">
                  <p>IT WILL BOOKS</p>
                </div>
                <div class="col-lg-6 col-md-4 col-sm-6 col-xs-12 ">
                  <div class="header__actions">
                  
                 	 <c:choose>
						<c:when test="${empty sessionScope.customInfo.userId }">
							<a href="<%=cp%>/itwillbook/login.do">로그인 / 회원가입</a><br/><br/>
						</c:when>
					
						<c:otherwise>
							${sessionScope.customInfo.userName }님 안녕하세요:)♥</br></br>
							<a href="<%=cp %>/itwillbook/logout.do">로그아웃</a><br/>
						</c:otherwise>
					</c:choose>
					
                  </div>
                </div>
          </div>
        </div>
      </div>
      <nav class="navigation">
        <div class="container-fluid">
          <div class="navigation__column left">
            <div class="header__logo"><a class="ps-logo" href="<%=cp %>/itwillbook/index.do"><img src="<%=cp %>/book/images/logo.png" alt=""></a></div>
          </div>
          <div class="navigation__column center">
                <ul class="main-menu menu" style="width: 1000px;">
                  <li class="menu-item">
                  	<a href="<%=cp %>/itwillbook/index.do">Home</a></li>
                  <li class="menu-item">
                  	<a href="<%=cp %>/itwillbook/book-list.do">Books</a></li>
                  <li class="menu-item">
                  	<a href="<%=cp %>/itwillbook/board.do">Board</a></li>
                  <li class="menu-item">
                  	<a href="<%=cp %>/itwillbook/orders.do">Orders</a></li>
                  <li class="menu-item">
                  	<a href="<%=cp %>/itwillbook/location.do">Location</a></li>
                  <li class="menu-item">
                  	<a href="<%=cp %>/itwillbook/mail.do">Contact</a></li>
                </ul>
          </div>
          
          <div class="navigation__column right">
            <form class="ps-search--header" action="do_action" method="post">
            <!-- 
              <input class="form-control" type="text" placeholder="Search Producta|">
              <button><i class="ps-icon-search"></i></button>
               -->
            </form>
            
            
         <c:choose>
            <c:when test="${empty sessionScope.customInfo.userId }"></c:when>
            
            <c:otherwise>
           
            <div class="ps-cart"><a class="ps-cart__toggle" href="#"><i class="ps-icon-shopping-cart"></i></a>
              <div class="ps-cart__listing">
                <div class="ps-cart__content">
                <c:set var="sum" value="0"/>
                <c:set var="sum2" value="0"/>
                 <c:forEach var="dto" items="${ilists}">
                  <div class="ps-cart-item">
                  	<a class="ps-cart-item__close" href="<%=cp %>/itwillbook/deleteItemLocation.do?name=${dto.name}"></a>
                    <div class="ps-cart-item__thumbnail">
	                    <a href="<%=cp %>/itwillbook/product-detail.do?num=${dto.num }"></a>
	                    <img src="${imagePath }/${dto.saveFileName }" alt=""></div>
                    <div class="ps-cart-item__content">
	                    <a class="ps-cart-item__title" href="<%=cp %>/itwillbook/product-detail.do?num=${dto.num }">${dto.name}</a>
	                    <p><span>수량:<i>${dto.quantity}</i></span><span>가격:<i>${dto.price}</i></span></p>
                    </div>
                  </div>
                  <c:set var="sum2" value="${sum2+dto.quantity }"/>
                  <c:set var="sum" value="${sum+dto.price*dto.quantity }"/>
               </c:forEach>
                
                </div>
                <div class="ps-cart__total">
                  <p>총 수량:<span><c:out value="${sum2 }"/></span></p>
                  <p>총 상품 가격:<span><c:out value="${sum }"/></span></p>
                </div>
                <div class="ps-cart__footer">
                	<a class="ps-btn" href="<%=cp %>/itwillbook/cart.do">장바구니<i class="ps-icon-arrow-left"></i></a>
                </div>
              </div>
            </div>
           	</c:otherwise>
		</c:choose>
            
            
            <div class="menu-toggle"><span></span></div>
          </div>
        </div>
      </nav>
    </header>
    
    <div align="center" >
	    <div align="left" style="display:inline-block; margin-bottom: 20px; padding: 5px;">
		<p style="font-size: 15pt;"><a href="https://www.aladin.co.kr/usedstore/wstoremain.aspx?offcode=Gangnam"><b>-알라딘 강남점</b></a>&nbsp;&nbsp;&nbsp;(영업시간 : 9:30 ~ 22:00)</p>
		 <div id="map_view" style="width:500px; height:300px;"></div>
		 </div>
		 <br/>
		 <div align="left" style="display:inline-block; margin-bottom: 20px; padding: 5px;">
		 <p style="font-size: 15pt;"><a href="https://www.aladin.co.kr/usedstore/wstoremain.aspx?offcode=Sinchon"><b>-알라딘 신촌점</b></a>&nbsp;&nbsp;&nbsp;(영업시간 : 9:30 ~ 22:00)</p>
		  <div id="map_view2" style="width:500px; height:300px;"></div>
		  </div>
		   <br/>
		  <div align="left" style="display:inline-block; margin-bottom: 20px; padding: 5px;">
		  <p style="font-size: 15pt;"><a href="https://www.aladin.co.kr/usedstore/wstoremain.aspx?offcode=Suwon"><b>-알라딘 수원점</b></a>&nbsp;&nbsp;&nbsp;(영업시간 : 9:30 ~ 22:00)</p>
		   <div id="map_view3" style="width:500px; height:300px;"></div>
		   </div>
   </div>
   </main>
   <div class="ps-footer__content">
          <div class="ps-container">
            <div class="row">
                  
            </div>
          </div>
        </div>
        <div class="ps-footer__copyright" style="background-color: rgba(0,0,0,0.85);">
          <div class="ps-container">
            <div class="row">
                  <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 ">
                    <p>&copy; <a href="#">IT WIll Books</a>, Inc. All rights Resevered. Design by <a href="#"> Alena Studio</a></p>
                  </div>
                  <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 ">
                    <ul class="ps-social">
                      <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                      <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                      <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                      <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                    </ul>
                  </div>
            </div>
          </div>
        </div>
   
    <!-- JS Library-->
    <script type="text/javascript" src="<%=cp%>/book/plugins/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript" src="<%=cp%>/book/plugins/bootstrap/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=cp%>/book/plugins/jquery-bar-rating/dist/jquery.barrating.min.js"></script>
    <script type="text/javascript" src="<%=cp%>/book/plugins/owl-carousel/owl.carousel.min.js"></script>
    <script type="text/javascript" src="<%=cp%>/book/plugins/gmap3.min.js"></script>
    <script type="text/javascript" src="<%=cp%>/book/plugins/imagesloaded.pkgd.js"></script>
    <script type="text/javascript" src="<%=cp%>/book/plugins/isotope.pkgd.min.js"></script>
    <script type="text/javascript" src="<%=cp%>/book/plugins/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
    <script type="text/javascript" src="<%=cp%>/book/plugins/jquery.matchHeight-min.js"></script>
    <script type="text/javascript" src="<%=cp%>/book/plugins/slick/slick/slick.min.js"></script>
    <script type="text/javascript" src="<%=cp%>/book/plugins/elevatezoom/jquery.elevatezoom.js"></script>
    <script type="text/javascript" src="<%=cp%>/book/plugins/Magnific-Popup/dist/jquery.magnific-popup.min.js"></script>
    <script type="text/javascript" src="<%=cp%>/book/plugins/jquery-ui/jquery-ui.min.js"></script>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA0MAdHSDLjeFQKdtwy1DyW7SrDOv8lDqg"></script><script type="text/javascript" src="<%=cp%>/book/plugins/revolution/js/jquery.themepunch.tools.min.js"></script>
<script type="text/javascript" src="<%=cp%>/book/plugins/revolution/js/jquery.themepunch.revolution.min.js"></script>
<script type="text/javascript" src="<%=cp%>/book/plugins/revolution/js/extensions/revolution.extension.video.min.js"></script>
<script type="text/javascript" src="<%=cp%>/book/plugins/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
<script type="text/javascript" src="<%=cp%>/book/plugins/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
<script type="text/javascript" src="<%=cp%>/book/plugins/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
<script type="text/javascript" src="<%=cp%>/book/plugins/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
<script type="text/javascript" src="<%=cp%>/book/plugins/revolution/js/extensions/revolution.extension.actions.min.js"></script>
    <!-- Custom scripts-->
    <script type="text/javascript" src="<%=cp%>/book/js/main.js"></script>
</body>
</html>