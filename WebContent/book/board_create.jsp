<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8"); 
String cp = request.getContextPath(); 

Calendar cal = Calendar.getInstance();
int nowYear = cal.get(Calendar.YEAR);
int nowMonth = cal.get(Calendar.MONTH) + 1;
int nowDay = cal.get(Calendar.DAY_OF_MONTH);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--[if IE 7]><html class="ie ie7"><![endif]-->
<!--[if IE 8]><html class="ie ie8"><![endif]-->
<!--[if IE 9]><html class="ie ie9"><![endif]-->
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <link href="<%=cp %>/book/apple-touch-icon.png" rel="apple-touch-icon" >
    <link href="<%=cp %>/book/favicon.png" rel="icon">
    <meta name="author" content="Nghia Minh Luong">
    <meta name="keywords" content="Default Description">
    <meta name="description" content="Default keyword">
    <title>모임 개설 신청 페이지</title>
    <!-- Fonts-->
    <link href="https://fonts.googleapis.com/css?family=Archivo+Narrow:300,400,700%7CMontserrat:300,400,500,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" href="<%=cp %>/book/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=cp %>/book/plugins/ps-icon/style.css">
    <!-- CSS Library-->
    <link rel="stylesheet" href= "<%=cp %>/book/plugins/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=cp %>/book/plugins/owl-carousel/assets/owl.carousel.css">
    <link rel="stylesheet" href="<%=cp %>/book/plugins/jquery-bar-rating/dist/themes/fontawesome-stars.css">
    <link rel="stylesheet" href="<%=cp %>/book/plugins/slick/slick/slick.css">
    <link rel="stylesheet" href="<%=cp %>/book/plugins/bootstrap-select/dist/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="<%=cp %>/book/plugins/Magnific-Popup/dist/magnific-popup.css">
    <link rel="stylesheet" href="<%=cp %>/book/plugins/jquery-ui/jquery-ui.min.css">
    <link rel="stylesheet" href="<%=cp %>/book/plugins/revolution/css/settings.css">
    <link rel="stylesheet" href="<%=cp %>/book/plugins/revolution/css/layers.css">
    <link rel="stylesheet" href="<%=cp %>/book/plugins/revolution/css/navigation.css">
    <!-- Custom-->
    <link rel="stylesheet" type="text/css" href="<%=cp %>/book/css/style.css">
    <!--HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries-->
    <!--WARNING: Respond.js doesn't work if you view the page via file://-->
    <!--[if lt IE 9]><script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script><script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script><![endif]-->


<!-- jQuery -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<!-- end -->

<script type="text/javascript">

function create() {
	
	var f = document.myForm;

	if(!f.bookName.value) {
		
		alert("책 이름을 입력하세요");
		f.bookName.focus();
		return;
	}
	
	if(!f.time.value) {
		
		alert("모임 시간을 입력하세요");
		f.time.focus();
		return;
	}
	

	if (!f.place.value) {

		alert("장소를 입력하세요");
		f.place.focus();
		return;
	}

	if (!f.totalMember.value) {

		alert("참가인원을 입력하세요");
		f.totalMember.focus();
		return;
	}

	f.action = "<%=cp%>/itwillbook/board_create_ok.do";
	f.submit();
	
}

</script>

</head>

 <body class="ps-loading">
    <div class="header--sidebar"></div>
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
                  	<a class="ps-cart-item__close" href="<%=cp %>/itwillbook/deleteItemIndex.do?name=${dto.name}"></a>
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
    
     <div class="header-services"></div>
    <main class="ps-main">
      <div class="ps-home-contact">
        <div id="contact-map" data-address="New York, NY" data-title="BAKERY LOCATION!" data-zoom="15"></div>
        <div class="ps-home-contact__form">
          <header>
            <h3>모임 개설하기</h3>
            <p>정보를 입력해주세요</p>
          </header>
          
          
          <footer>
             <form action="" method="post" name="myForm">
             
              <div class="form-group">
                <label>토론할 책 이름<span>*</span></label>
                <input class="form-control" type="text" name="bookName">
              </div>
              
               <div class="form-group">
                <label>날짜<span>*</span></label>
                 <input class="selector" name="bookDate"  placeholder="날짜를 선택하세요." />
				<a class="input-button" title="toggle" data-toggle><i class="icon-calendar"></i></a>
              </div>
              
              <div class="form-group">
                <label>시간<span>*</span></label>
               <input class="form-control" name="time" id="selector2" placeholder="시간을 선택하세요." />
				<a class="input-button" title="toggle" data-toggle><i class="icon-calendar"></i></a>
              </div>
              
              <script type="text/javascript">
              $(".selector").flatpickr({ 
     				altInput: true,
     			    altFormat: "F j, Y",
     			    
  				dateFormat: "Y-m-d",
  				minDate:"today",
  				maxDate: "2020.12.31"
  				});

   				 $("#selector2").flatpickr({
   				   enableTime: true,
     					 noCalendar: true,
    				  dateFormat: "H:i",
  					});
   				</script>
              
              <div class="form-group">
                <label>장소<span>*</span></label>
                <input class="form-control" type="text" name="place">
              </div>
              
              <div class="form-group">
                <label>참가 인원<span>*</span></label>
                <input class="form-control" type="text" name="totalMember">
              </div>
              
              
              <div class="form-group text-center">
                <button type="button" class="ps-btn" onclick="create();">개설 신청<i class="fa fa-angle-right"></i></button>
              </div>
              
              
            </form>
          </footer>
          
        </div>
      </div>
    </main>
    <br/><br/><br/><br/><br/><br/><br/>
    
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
    <script type="text/javascript" src="<%=cp %>/book/plugins/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript" src="<%=cp %>/book/plugins/bootstrap/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=cp %>/book/plugins/jquery-bar-rating/dist/jquery.barrating.min.js"></script>
    <script type="text/javascript" src="<%=cp %>/book/plugins/owl-carousel/owl.carousel.min.js"></script>
    <script type="text/javascript" src="<%=cp %>/book/plugins/gmap3.min.js"></script>
    <script type="text/javascript" src="<%=cp %>/book/plugins/imagesloaded.pkgd.js"></script>
    <script type="text/javascript" src="<%=cp %>/book/plugins/isotope.pkgd.min.js"></script>
    <script type="text/javascript" src="<%=cp %>/book/plugins/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
    <script type="text/javascript" src="<%=cp %>/book/plugins/jquery.matchHeight-min.js"></script>
    <script type="text/javascript" src="<%=cp %>/book/plugins/slick/slick/slick.min.js"></script>
    <script type="text/javascript" src="<%=cp %>/book/plugins/elevatezoom/jquery.elevatezoom.js"></script>
    <script type="text/javascript" src="<%=cp %>/book/plugins/Magnific-Popup/dist/jquery.magnific-popup.min.js"></script>
    <script type="text/javascript" src="<%=cp %>/book/plugins/jquery-ui/jquery-ui.min.js"></script>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAx39JFH5nhxze1ZydH-Kl8xXM3OK4fvcg&amp;region=GB"></script><script type="text/javascript" src="<%=cp %>/book/plugins/revolution/js/jquery.themepunch.tools.min.js"></script>
<script type="text/javascript" src="<%=cp %>/book/plugins/revolution/js/jquery.themepunch.revolution.min.js"></script>
<script type="text/javascript" src="<%=cp %>/book/plugins/revolution/js/extensions/revolution.extension.video.min.js"></script>
<script type="text/javascript" src="<%=cp %>/book/plugins/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
<script type="text/javascript" src="<%=cp %>/book/plugins/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
<script type="text/javascript" src="<%=cp %>/book/plugins/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
<script type="text/javascript" src="<%=cp %>/book/plugins/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
<script type="text/javascript" src="<%=cp %>/book/plugins/revolution/js/extensions/revolution.extension.actions.min.js"></script>
    <!-- Custom scripts-->
    <script type="text/javascript" src="<%=cp %>/book/js/main.js"></script>
    
  </body>

</html>
