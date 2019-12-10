<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

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
    <link href="<%=cp%>/book/apple-touch-icon.png" rel="apple-touch-icon">
    <link href="<%=cp%>/book/favicon.png" rel="icon">
    <meta name="author" content="Nghia Minh Luong">
    <meta name="keywords" content="Default Description">
    <meta name="description" content="Default keyword">
    <title>IT WILL BOOKS</title>
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
    <!--HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries-->
    <!--WARNING: Respond.js doesn't work if you view the page via file://-->
    <!--[if lt IE 9]><script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script><script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script><![endif]-->
  </head>
  <!--[if IE 7]><body class="ie7 lt-ie8 lt-ie9 lt-ie10"><![endif]-->
  <!--[if IE 8]><body class="ie8 lt-ie9 lt-ie10"><![endif]-->
  <!--[if IE 9]><body class="ie9 lt-ie10"><![endif]-->
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
   
    <main class="ps-main">
    
    
    <div style="font-family: 맑은 고딕; position: relative; ">
    	<img id="slide" src="<%=cp%>/book/images/slider/1.jpg" style="opacity:0.8;"/>
    	<div style="left: 100px; width: 450px; bottom: 140px; font-size: 3vw; font-weight: bold; position: absolute; color: #fffafa;">
			<font color="#2ac37d "><b>독서</b></font>의 시작은<br/> <font color="#2ac37d "><b>I</b></font>T WILL B<font color="#2ac37d "><b>OO</b></font>KS
		
		</div>
	</div>
    <script>
  	var myImage =  document.getElementById("slide");
	var arr = ["1.jpg","2.jpg","3.jpg"];
	var i = 0;
  	function slideShow(){
		  
			myImage.setAttribute("src","<%=cp%>/book/images/slider/"+arr[i]);
			i++;
			
			if(i>=arr.length){
				i=0;
			}
		  
	  }
  	setInterval(slideShow,5000);
  	</script>
    
    
    <%-- 
      <div class="ps-banner">
        <div class="rev_slider fullscreenbanner" id="home-banner">
          <ul>
            <li class="ps-banner" data-index="rs-2972" data-transition="random" data-slotamount="default" data-hideafterloop="0" data-hideslideonmobile="off" data-rotate="0"><img class="rev-slidebg" src="<%=cp %>/book/images/slider/3.jpg" alt="" data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="5" data-no-retina>
              <div class="tp-caption ps-banner__header" id="layer-1" data-x="left" data-hoffset="['-60','15','15','15']" data-y="['middle','middle','middle','middle']" data-voffset="['-150','-120','-150','-170']" data-width="['none','none','none','400']" data-type="text" data-responsive_offset="on" data-frames="[{&quot;delay&quot;:1000,&quot;speed&quot;:1500,&quot;frame&quot;:&quot;0&quot;,&quot;from&quot;:&quot;x:50px;opacity:0;&quot;,&quot;to&quot;:&quot;o:1;&quot;,&quot;ease&quot;:&quot;Power3.easeInOut&quot;},{&quot;delay&quot;:&quot;wait&quot;,&quot;speed&quot;:300,&quot;frame&quot;:&quot;999&quot;,&quot;to&quot;:&quot;x:50px;opacity:0;&quot;,&quot;ease&quot;:&quot;Power3.easeInOut&quot;}]">
                <p>March 2002 <br> Nike SB Dunk Low Pro</p>
              </div>
              <div class="tp-caption ps-banner__title" id="layer21" data-x="['left','left','left','left']" data-hoffset="['-60','15','15','15']" data-y="['middle','middle','middle','middle']" data-voffset="['-60','-40','-50','-70']" data-type="text" data-responsive_offset="on" data-textAlign="['center','center','center','center']" data-frames="[{&quot;delay&quot;:1200,&quot;speed&quot;:1500,&quot;frame&quot;:&quot;0&quot;,&quot;from&quot;:&quot;x:50px;opacity:0;&quot;,&quot;to&quot;:&quot;o:1;&quot;,&quot;ease&quot;:&quot;Power3.easeInOut&quot;},{&quot;delay&quot;:&quot;wait&quot;,&quot;speed&quot;:300,&quot;frame&quot;:&quot;999&quot;,&quot;to&quot;:&quot;x:50px;opacity:0;&quot;,&quot;ease&quot;:&quot;Power3.easeInOut&quot;}]">
                <p class="text-uppercase">SUBA</p>
              </div>
              <div class="tp-caption ps-banner__description" id="layer211" data-x="['left','left','left','left']" data-hoffset="['-60','15','15','15']" data-y="['middle','middle','middle','middle']" data-voffset="['30','50','50','50']" data-type="text" data-responsive_offset="on" data-textAlign="['center','center','center','center']" data-frames="[{&quot;delay&quot;:1200,&quot;speed&quot;:1500,&quot;frame&quot;:&quot;0&quot;,&quot;from&quot;:&quot;x:50px;opacity:0;&quot;,&quot;to&quot;:&quot;o:1;&quot;,&quot;ease&quot;:&quot;Power3.easeInOut&quot;},{&quot;delay&quot;:&quot;wait&quot;,&quot;speed&quot;:300,&quot;frame&quot;:&quot;999&quot;,&quot;to&quot;:&quot;x:50px;opacity:0;&quot;,&quot;ease&quot;:&quot;Power3.easeInOut&quot;}]">
                <p>Supa wanted something that was going to rep his East Coast <br> roots and, more specifically, his hometown of <br/> New York City in  a big way.</p>
              </div><a class="tp-caption ps-btn" id="layer31" href="#" data-x="['left','left','left','left']" data-hoffset="['-60','15','15','15']" data-y="['middle','middle','middle','middle']" data-voffset="['120','140','200','200']" data-type="text" data-responsive_offset="on" data-textAlign="['center','center','center','center']" data-frames="[{&quot;delay&quot;:1500,&quot;speed&quot;:1500,&quot;frame&quot;:&quot;0&quot;,&quot;from&quot;:&quot;x:50px;opacity:0;&quot;,&quot;to&quot;:&quot;o:1;&quot;,&quot;ease&quot;:&quot;Power3.easeInOut&quot;},{&quot;delay&quot;:&quot;wait&quot;,&quot;speed&quot;:300,&quot;frame&quot;:&quot;999&quot;,&quot;to&quot;:&quot;x:50px;opacity:0;&quot;,&quot;ease&quot;:&quot;Power3.easeInOut&quot;}]">Purchase Now<i class="ps-icon-next"></i></a>
            </li>
            <li class="ps-banner ps-banner--white" data-index="rs-100" data-transition="random" data-slotamount="default" data-hideafterloop="0" data-hideslideonmobile="off" data-rotate="0"><img class="rev-slidebg" src="<%=cp %>/book/images/slider/2.jpg" alt="" data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="5" data-no-retina>
              <div class="tp-caption ps-banner__header" id="layer20" data-x="left" data-hoffset="['-60','15','15','15']" data-y="['middle','middle','middle','middle']" data-voffset="['-150','-120','-150','-170']" data-width="['none','none','none','400']" data-type="text" data-responsive_offset="on" data-frames="[{&quot;delay&quot;:1000,&quot;speed&quot;:1500,&quot;frame&quot;:&quot;0&quot;,&quot;from&quot;:&quot;x:50px;opacity:0;&quot;,&quot;to&quot;:&quot;o:1;&quot;,&quot;ease&quot;:&quot;Power3.easeInOut&quot;},{&quot;delay&quot;:&quot;wait&quot;,&quot;speed&quot;:300,&quot;frame&quot;:&quot;999&quot;,&quot;to&quot;:&quot;x:50px;opacity:0;&quot;,&quot;ease&quot;:&quot;Power3.easeInOut&quot;}]">
                <p>BEST ITEM <br> THIS SUMMER</p>
              </div>
              <div class="tp-caption ps-banner__title" id="layer339" data-x="['left','left','left','left']" data-hoffset="['-60','15','15','15']" data-y="['middle','middle','middle','middle']" data-voffset="['-60','-40','-50','-70']" data-type="text" data-responsive_offset="on" data-textAlign="['center','center','center','center']" data-frames="[{&quot;delay&quot;:1200,&quot;speed&quot;:1500,&quot;frame&quot;:&quot;0&quot;,&quot;from&quot;:&quot;x:50px;opacity:0;&quot;,&quot;to&quot;:&quot;o:1;&quot;,&quot;ease&quot;:&quot;Power3.easeInOut&quot;},{&quot;delay&quot;:&quot;wait&quot;,&quot;speed&quot;:300,&quot;frame&quot;:&quot;999&quot;,&quot;to&quot;:&quot;x:50px;opacity:0;&quot;,&quot;ease&quot;:&quot;Power3.easeInOut&quot;}]">
                <p class="text-uppercase">Recovery</p>
              </div>
              <div class="tp-caption ps-banner__description" id="layer2-14" data-x="['left','left','left','left']" data-hoffset="['-60','15','15','15']" data-y="['middle','middle','middle','middle']" data-voffset="['30','50','50','50']" data-type="text" data-responsive_offset="on" data-textAlign="['center','center','center','center']" data-frames="[{&quot;delay&quot;:1200,&quot;speed&quot;:1500,&quot;frame&quot;:&quot;0&quot;,&quot;from&quot;:&quot;x:50px;opacity:0;&quot;,&quot;to&quot;:&quot;o:1;&quot;,&quot;ease&quot;:&quot;Power3.easeInOut&quot;},{&quot;delay&quot;:&quot;wait&quot;,&quot;speed&quot;:300,&quot;frame&quot;:&quot;999&quot;,&quot;to&quot;:&quot;x:50px;opacity:0;&quot;,&quot;ease&quot;:&quot;Power3.easeInOut&quot;}]">
                <p>Supa wanted something that was going to rep his East Coast <br> roots and, more specifically, his hometown of <br/> New York City in  a big way.</p>
              </div><a class="tp-caption ps-btn" id="layer364" href="#" data-x="['left','left','left','left']" data-hoffset="['-60','15','15','15']" data-y="['middle','middle','middle','middle']" data-voffset="['120','140','200','200']" data-type="text" data-responsive_offset="on" data-textAlign="['center','center','center','center']" data-frames="[{&quot;delay&quot;:1500,&quot;speed&quot;:1500,&quot;frame&quot;:&quot;0&quot;,&quot;from&quot;:&quot;x:50px;opacity:0;&quot;,&quot;to&quot;:&quot;o:1;&quot;,&quot;ease&quot;:&quot;Power3.easeInOut&quot;},{&quot;delay&quot;:&quot;wait&quot;,&quot;speed&quot;:300,&quot;frame&quot;:&quot;999&quot;,&quot;to&quot;:&quot;x:50px;opacity:0;&quot;,&quot;ease&quot;:&quot;Power3.easeInOut&quot;}]">Purchase Now<i class="ps-icon-next"></i></a>
            </li>
          </ul>
        </div>
      </div>
       --%>
       
       
       
      <div class="ps-section ps-section--top-sales ps-owl-root pt-80 pb-80">
        <div class="ps-container">
          <div class="ps-section__header mb-50">
            <div class="row">
                  <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12 ">
                    <h3 class="ps-section__title" data-mask="New"> - 신간 소개</h3>
                  </div>
                  <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 ">
                    <div class="ps-owl-actions" style="width: 285px;"><a class="ps-prev" href="#">
	                    <i class="ps-icon-arrow-right"></i>Prev</a>
	                    <a class="ps-next" href="#">Next<i class="ps-icon-arrow-left"></i></a>
                    </div>
                  </div>
            </div>
          </div>
          
          <div class="ps-section__content">
            <div class="ps-owl--colection owl-slider" data-owl-auto="true" data-owl-loop="true" data-owl-speed="5000" data-owl-gap="30" data-owl-nav="false" data-owl-dots="false" data-owl-item="4" data-owl-item-xs="1" data-owl-item-sm="2" data-owl-item-md="3" data-owl-item-lg="4" data-owl-duration="1000" data-owl-mousedrag="on">
            
              <c:forEach var="dto" items="${lists }">
              <div class="ps-shoes--carousel">
                <div class="ps-shoe">
                
                  <div class="ps-shoe__thumbnail">
                    <!-- <a class="ps-shoe__favorite" href="#"><i class="ps-icon-heart"></i></a> -->
                    <img src="${imagePath }/${dto.saveFileName }" alt=""  width="393" height="400">
                    <a class="ps-shoe__overlay" href="<%=cp %>/itwillbook/product-detail.do?num=${dto.num}"></a>
                  </div>
                  
                  <div class="ps-shoe__content">
                    <div class="ps-shoe__variants">
                      <div class="ps-shoe__variant normal">
	                      <img src="${imagePath }/${dto.saveFileName }" alt="">
	                      <img src="${imagePath }/${dto.saveFileName }" alt="">
	                      <img src="${imagePath }/${dto.saveFileName }" alt="">
	                      <img src="${imagePath }/${dto.saveFileName }" alt="">
                      </div>
                    </div>
                    <div class="ps-shoe__detail">
                      <a class="ps-shoe__name" href="<%=cp %>/itwillbook/product-detail.do?num=${dto.num}">${dto.name }</a>
                      <p class="ps-shoe__categories"><a href="#">${dto.category } . ${dto.writer } . </a></p>
                      <span class="ps-shoe__price" style="margin-top: 15px;"> ${dto.price } 원</span>
                    </div>
                  </div>
                </div>
              </div>
              </c:forEach>
            </div>
          </div>
          <div align="right">
          <a class="tp-caption ps-btn" id="layer31" href="<%=cp %>/itwillbook/book-list.do" data-type="text" data-responsive_offset="on" data-textAlign="['center','center','center','center']" data-frames="[{&quot;delay&quot;:1500,&quot;speed&quot;:1500,&quot;frame&quot;:&quot;0&quot;,&quot;from&quot;:&quot;x:50px;opacity:0;&quot;,&quot;to&quot;:&quot;o:1;&quot;,&quot;ease&quot;:&quot;Power3.easeInOut&quot;},{&quot;delay&quot;:&quot;wait&quot;,&quot;speed&quot;:300,&quot;frame&quot;:&quot;999&quot;,&quot;to&quot;:&quot;x:50px;opacity:0;&quot;,&quot;ease&quot;:&quot;Power3.easeInOut&quot;}]">모든 제품<i class="ps-icon-next"></i></a>
          </div>
        </div>
      </div>
       
       
      <div class="ps-section--features-product ps-section masonry-root pt-100 pb-100">
        <div class="ps-container">
          <div class="ps-section__header mb-50">
            <h3 class="ps-section__title" data-mask="Books">- 분야별 책</h3>
            <ul class="ps-masonry__filter">
	              <li class="current"><a href="<%=cp %>/itwillbook/index.do" data-filter=".all">All</a></li>
	              <li><a href="#" data-filter=".literature">문학</a></li>
	              <li><a href="#" data-filter=".essay">에세이</a></li>
	              <li><a href="#" data-filter=".history">역사</a></li>
	              <li><a href="#" data-filter=".science">과학</a></li>
	              <li><a href="#" data-filter=".computer">컴퓨터</a></li>
            </ul>
          </div>
          
          <div class="ps-section__content pb-50">
            <div class="masonry-wrapper" data-col-md="4" data-col-sm="2" data-col-xs="1" data-gap="30" data-radio="100%">
              <div class="ps-masonry">
                <div class="grid-sizer"></div>
                
                  <c:forEach var="dto" items="${lists }">
	                <div class="grid-item all">
	                  <div class="grid-item__content-wrapper">
	                    <div class="ps-shoe mb-30">
	                      <div class="ps-shoe__thumbnail">
		                      <!-- <a class="ps-shoe__favorite" href="#">
		                      <i class="ps-icon-heart"></i></a> -->
		                      <img src="${imagePath }/${dto.saveFileName }" alt="" width="393" height="400">
		                      <a class="ps-shoe__overlay" href="<%=cp %>/itwillbook/product-detail.do?num=${dto.num}"></a>
	                      </div>
	                      <div class="ps-shoe__content">
	                        <div class="ps-shoe__variants">
	                          <div class="ps-shoe__variant normal">
	                          <img src="${imagePath }/${dto.saveFileName }" alt="">
	                          <img src="${imagePath }/${dto.saveFileName }" alt="">
	                          <img src="${imagePath }/${dto.saveFileName }" alt="">
	                          <img src="${imagePath }/${dto.saveFileName }" alt="">
	                          </div>
	                        </div>
	                        <div class="ps-shoe__detail"><a class="ps-shoe__name" href="#">${dto.name}</a>
	                          <p class="ps-shoe__categories"><a href="#">${dto.writer}</a></p><span class="ps-shoe__price" style="margin-top: 15px;"> ${dto.price} 원</span>
	                        </div>
	                      </div>
	                    </div>
	                  </div>
	                </div>
	              </c:forEach>
                
	              <c:forEach var="dto" items="${litlists }">
	                <div class="grid-item literature">
	                  <div class="grid-item__content-wrapper">
	                    <div class="ps-shoe mb-30">
	                      <div class="ps-shoe__thumbnail">
		                      <!-- <a class="ps-shoe__favorite" href="#">
		                      <i class="ps-icon-heart"></i></a> -->
		                      <img src="${imagePath }/${dto.saveFileName }" alt="" width="393" height="400">
		                      <a class="ps-shoe__overlay" href="<%=cp %>/itwillbook/product-detail.do?num=${dto.num}"></a>
	                      </div>
	                      <div class="ps-shoe__content">
	                        <div class="ps-shoe__variants">
	                          <div class="ps-shoe__variant normal">
	                          <img src="${imagePath }/${dto.saveFileName }" alt="">
	                          <img src="${imagePath }/${dto.saveFileName }" alt="">
	                          <img src="${imagePath }/${dto.saveFileName }" alt="">
	                          <img src="${imagePath }/${dto.saveFileName }" alt="">
	                          </div>
	                        </div>
	                        <div class="ps-shoe__detail"><a class="ps-shoe__name" href="#">${dto.name}</a>
	                          <p class="ps-shoe__categories"><a href="#">${dto.writer}</a></p><span class="ps-shoe__price" style="margin-top: 15px;"> ${dto.price} 원</span>
	                        </div>
	                      </div>
	                    </div>
	                  </div>
	                </div>
	              </c:forEach>
	              
	              <c:forEach var="dto" items="${esslists }">
	                <div class="grid-item essay">
	                  <div class="grid-item__content-wrapper">
	                    <div class="ps-shoe mb-30">
	                      <div class="ps-shoe__thumbnail">
		                      <!-- <a class="ps-shoe__favorite" href="#">
		                      <i class="ps-icon-heart"></i></a> -->
		                      <img src="${imagePath }/${dto.saveFileName }" alt="" width="393" height="400">
		                      <a class="ps-shoe__overlay" href="<%=cp %>/itwillbook/product-detail.do?num=${dto.num}"></a>
	                      </div>
	                      <div class="ps-shoe__content">
	                        <div class="ps-shoe__variants">
	                          <div class="ps-shoe__variant normal">
	                          <img src="${imagePath }/${dto.saveFileName }" alt="">
	                          <img src="${imagePath }/${dto.saveFileName }" alt="">
	                          <img src="${imagePath }/${dto.saveFileName }" alt="">
	                          <img src="${imagePath }/${dto.saveFileName }" alt="">
	                          </div>
	                        </div>
	                        <div class="ps-shoe__detail"><a class="ps-shoe__name" href="#">${dto.name}</a>
	                          <p class="ps-shoe__categories"><a href="#">${dto.writer}</a></p><span class="ps-shoe__price" style="margin-top: 15px;"> ${dto.price} 원</span>
	                        </div>
	                      </div>
	                    </div>
	                  </div>
	                </div>
	              </c:forEach>
	              
	              <c:forEach var="dto" items="${hislists }">
	                <div class="grid-item history">
	                  <div class="grid-item__content-wrapper">
	                    <div class="ps-shoe mb-30">
	                      <div class="ps-shoe__thumbnail">
		                     <!--  <a class="ps-shoe__favorite" href="#">
		                      <i class="ps-icon-heart"></i></a> -->
		                      <img src="${imagePath }/${dto.saveFileName }" alt="" width="393" height="400">
		                      <a class="ps-shoe__overlay" href="<%=cp %>/itwillbook/product-detail.do?num=${dto.num}"></a>
	                      </div>
	                      <div class="ps-shoe__content">
	                        <div class="ps-shoe__variants">
	                          <div class="ps-shoe__variant normal">
	                          <img src="${imagePath }/${dto.saveFileName }" alt="">
	                          <img src="${imagePath }/${dto.saveFileName }" alt="">
	                          <img src="${imagePath }/${dto.saveFileName }" alt="">
	                          <img src="${imagePath }/${dto.saveFileName }" alt="">
	                          </div>
	                        </div>
	                        <div class="ps-shoe__detail"><a class="ps-shoe__name" href="#">${dto.name}</a>
	                          <p class="ps-shoe__categories"><a href="#">${dto.writer}</a></p><span class="ps-shoe__price" style="margin-top: 15px;"> ${dto.price} 원</span>
	                        </div>
	                      </div>
	                    </div>
	                  </div>
	                </div>
	              </c:forEach>
	              
	              <c:forEach var="dto" items="${scilists }">
	                <div class="grid-item science">
	                  <div class="grid-item__content-wrapper">
	                    <div class="ps-shoe mb-30">
	                      <div class="ps-shoe__thumbnail">
		                      <!-- <a class="ps-shoe__favorite" href="#">
		                      <i class="ps-icon-heart"></i></a> -->
		                      <img src="${imagePath }/${dto.saveFileName }" alt="" width="393" height="400">
		                      <a class="ps-shoe__overlay" href="<%=cp %>/itwillbook/product-detail.do?num=${dto.num}"></a>
	                      </div>
	                      <div class="ps-shoe__content">
	                        <div class="ps-shoe__variants">
	                          <div class="ps-shoe__variant normal">
	                          <img src="${imagePath }/${dto.saveFileName }" alt="">
	                          <img src="${imagePath }/${dto.saveFileName }" alt="">
	                          <img src="${imagePath }/${dto.saveFileName }" alt="">
	                          <img src="${imagePath }/${dto.saveFileName }" alt="">
	                          </div>
	                        </div>
	                        <div class="ps-shoe__detail"><a class="ps-shoe__name" href="#">${dto.name}</a>
	                          <p class="ps-shoe__categories"><a href="#">${dto.writer}</a></p><span class="ps-shoe__price" style="margin-top: 15px;"> ${dto.price} 원</span>
	                        </div>
	                      </div>
	                    </div>
	                  </div>
	                </div>
	              </c:forEach>
	              
	              <c:forEach var="dto" items="${comlists }">
	                <div class="grid-item computer">
	                  <div class="grid-item__content-wrapper">
	                    <div class="ps-shoe mb-30">
	                      <div class="ps-shoe__thumbnail">
		                      <!-- <a class="ps-shoe__favorite" href="#">
		                      <i class="ps-icon-heart"></i></a> -->
		                      <img src="${imagePath }/${dto.saveFileName }" alt="" width="393" height="400">
		                      <a class="ps-shoe__overlay" href="<%=cp %>/itwillbook/product-detail.do?num=${dto.num}"></a>
	                      </div>
	                      <div class="ps-shoe__content">
	                        <div class="ps-shoe__variants">
	                          <div class="ps-shoe__variant normal">
	                          <img src="${imagePath }/${dto.saveFileName }" alt="">
	                          <img src="${imagePath }/${dto.saveFileName }" alt="">
	                          <img src="${imagePath }/${dto.saveFileName }" alt="">
	                          <img src="${imagePath }/${dto.saveFileName }" alt="">
	                          </div>
	                        </div>
	                        <div class="ps-shoe__detail"><a class="ps-shoe__name" href="#">${dto.name}</a>
	                          <p class="ps-shoe__categories"><a href="#">${dto.writer}</a></p><span class="ps-shoe__price" style="margin-top: 15px;"> ${dto.price} 원</span>
	                        </div>
	                      </div>
	                    </div>
	                  </div>
	                </div>
	              </c:forEach>
	              
	              <%-- 
	              
	              <c:forEach var="dto" items="${lists }">
	              <c:if test="${dto.category eq '문학' }">
	                <div class="grid-item all">
	                  <div class="grid-item__content-wrapper">
	                    <div class="ps-shoe mb-30">
	                      <div class="ps-shoe__thumbnail">
		                      <a class="ps-shoe__favorite" href="#">
		                      <i class="ps-icon-heart"></i></a>
		                      <img src="${imagePath }/${dto.saveFileName }" alt="" width="393" height="400">
		                      <a class="ps-shoe__overlay" href="<%=cp %>/itwillbook/product-detail.do?num=${dto.num}"></a>
	                      </div>
	                      <div class="ps-shoe__content">
	                        <div class="ps-shoe__variants">
	                          <div class="ps-shoe__variant normal">
	                          <img src="${imagePath }/${dto.saveFileName }" alt="">
	                          <img src="${imagePath }/${dto.saveFileName }" alt="">
	                          <img src="${imagePath }/${dto.saveFileName }" alt="">
	                          <img src="${imagePath }/${dto.saveFileName }" alt="">
	                          </div>
	                        </div>
	                        <div class="ps-shoe__detail"><a class="ps-shoe__name" href="#">${dto.name}</a>
	                          <p class="ps-shoe__categories"><a href="#">${dto.writer}</a></p><span class="ps-shoe__price"> ${dto.price} WON</span>
	                        </div>
	                      </div>
	                    </div>
	                  </div>
	                </div>
	              </c:if>
	              </c:forEach>
	              
	              <c:forEach var="dto" items="${lists }">
	              <c:if test="${dto.category eq '에세이' }">
	                <div class="grid-item essay">
	                  <div class="grid-item__content-wrapper">
	                    <div class="ps-shoe mb-30">
	                      <div class="ps-shoe__thumbnail">
		                      <a class="ps-shoe__favorite" href="#">
		                      <i class="ps-icon-heart"></i></a>
		                      <img src="${imagePath }/${dto.saveFileName }" alt="" width="393" height="400">
		                      <a class="ps-shoe__overlay" href="<%=cp %>/itwillbook/product-detail.do?num=${dto.num}"></a>
	                      </div>
	                      <div class="ps-shoe__content">
	                        <div class="ps-shoe__variants">
	                          <div class="ps-shoe__variant normal">
	                          <img src="${imagePath }/${dto.saveFileName }" alt="">
	                          <img src="${imagePath }/${dto.saveFileName }" alt="">
	                          <img src="${imagePath }/${dto.saveFileName }" alt="">
	                          <img src="${imagePath }/${dto.saveFileName }" alt="">
	                          </div>
	                        </div>
	                        <div class="ps-shoe__detail"><a class="ps-shoe__name" href="#">${dto.name}</a>
	                          <p class="ps-shoe__categories"><a href="#">${dto.writer}</a></p><span class="ps-shoe__price"> ${dto.price} WON</span>
	                        </div>
	                      </div>
	                    </div>
	                  </div>
	                </div>
	              </c:if>
	              </c:forEach>
	              
	              <c:forEach var="dto" items="${lists }">
	              <c:if test="${dto.category eq '역사' }">
	                <div class="grid-item history">
	                  <div class="grid-item__content-wrapper">
	                    <div class="ps-shoe mb-30">
	                      <div class="ps-shoe__thumbnail">
		                      <a class="ps-shoe__favorite" href="#">
		                      <i class="ps-icon-heart"></i></a>
		                      <img src="${imagePath }/${dto.saveFileName }" alt="" width="393" height="400">
		                      <a class="ps-shoe__overlay" href="<%=cp %>/itwillbook/product-detail.do?num=${dto.num}"></a>
	                      </div>
	                      <div class="ps-shoe__content">
	                        <div class="ps-shoe__variants">
	                          <div class="ps-shoe__variant normal">
	                          <img src="${imagePath }/${dto.saveFileName }" alt="">
	                          <img src="${imagePath }/${dto.saveFileName }" alt="">
	                          <img src="${imagePath }/${dto.saveFileName }" alt="">
	                          <img src="${imagePath }/${dto.saveFileName }" alt="">
	                          </div>
	                        </div>
	                        <div class="ps-shoe__detail"><a class="ps-shoe__name" href="#">${dto.name}</a>
	                          <p class="ps-shoe__categories"><a href="#">${dto.writer}</a></p><span class="ps-shoe__price"> ${dto.price} WON</span>
	                        </div>
	                      </div>
	                    </div>
	                  </div>
	                </div>
	              </c:if>
	              </c:forEach>
	              
	              <c:forEach var="dto" items="${lists }">
	              <c:if test="${dto.category eq '과학' }">
	                <div class="grid-item science">
	                  <div class="grid-item__content-wrapper">
	                    <div class="ps-shoe mb-30">
	                      <div class="ps-shoe__thumbnail">
		                      <a class="ps-shoe__favorite" href="#">
		                      <i class="ps-icon-heart"></i></a>
		                      <img src="${imagePath }/${dto.saveFileName }" alt="" width="393" height="400">
		                      <a class="ps-shoe__overlay" href="<%=cp %>/itwillbook/product-detail.do?num=${dto.num}"></a>
	                      </div>
	                      <div class="ps-shoe__content">
	                        <div class="ps-shoe__variants">
	                          <div class="ps-shoe__variant normal">
	                          <img src="${imagePath }/${dto.saveFileName }" alt="">
	                          <img src="${imagePath }/${dto.saveFileName }" alt="">
	                          <img src="${imagePath }/${dto.saveFileName }" alt="">
	                          <img src="${imagePath }/${dto.saveFileName }" alt="">
	                          </div>
	                        </div>
	                        <div class="ps-shoe__detail"><a class="ps-shoe__name" href="#">${dto.name}</a>
	                          <p class="ps-shoe__categories"><a href="#">${dto.writer}</a></p><span class="ps-shoe__price"> ${dto.price} WON</span>
	                        </div>
	                      </div>
	                    </div>
	                  </div>
	                </div>
	              </c:if>
	              </c:forEach>
	              
	              <c:forEach var="dto" items="${lists }">
	              <c:if test="${dto.category eq '컴퓨터' }">
	                <div class="grid-item computer">
	                  <div class="grid-item__content-wrapper">
	                    <div class="ps-shoe mb-30">
	                      <div class="ps-shoe__thumbnail">
		                      <a class="ps-shoe__favorite" href="#">
		                      <i class="ps-icon-heart"></i></a>
		                      <img src="${imagePath }/${dto.saveFileName }" alt="" width="393" height="400">
		                      <a class="ps-shoe__overlay" href="<%=cp %>/itwillbook/product-detail.do?num=${dto.num}"></a>
	                      </div>
	                      <div class="ps-shoe__content">
	                        <div class="ps-shoe__variants">
	                          <div class="ps-shoe__variant normal">
	                          <img src="${imagePath }/${dto.saveFileName }" alt="">
	                          <img src="${imagePath }/${dto.saveFileName }" alt="">
	                          <img src="${imagePath }/${dto.saveFileName }" alt="">
	                          <img src="${imagePath }/${dto.saveFileName }" alt="">
	                          </div>
	                        </div>
	                        <div class="ps-shoe__detail"><a class="ps-shoe__name" href="#">${dto.name}</a>
	                          <p class="ps-shoe__categories"><a href="#">${dto.writer}</a></p><span class="ps-shoe__price"> ${dto.price} WON</span>
	                        </div>
	                      </div>
	                    </div>
	                  </div>
	                </div>
	              </c:if>
	              </c:forEach>
	               --%>
	           
	          </div>
            </div>
          </div>
        </div>
      </div>
      
      <!-- 등록하기 버튼 -->
      <%-- 
     <a class="tp-caption ps-btn" id="layer31" href="<%=cp %>/itwillbook/created.do" data-type="text" data-responsive_offset="on" data-textAlign="['center','center','center','center']" data-frames="[{&quot;delay&quot;:1500,&quot;speed&quot;:1500,&quot;frame&quot;:&quot;0&quot;,&quot;from&quot;:&quot;x:50px;opacity:0;&quot;,&quot;to&quot;:&quot;o:1;&quot;,&quot;ease&quot;:&quot;Power3.easeInOut&quot;},{&quot;delay&quot;:&quot;wait&quot;,&quot;speed&quot;:300,&quot;frame&quot;:&quot;999&quot;,&quot;to&quot;:&quot;x:50px;opacity:0;&quot;,&quot;ease&quot;:&quot;Power3.easeInOut&quot;}]">등록하기<i class="ps-icon-next"></i></a>
     <a class="tp-caption ps-btn" id="layer31" href="<%=cp %>/itwillbook/delete.do" data-type="text" data-responsive_offset="on" data-textAlign="['center','center','center','center']" data-frames="[{&quot;delay&quot;:1500,&quot;speed&quot;:1500,&quot;frame&quot;:&quot;0&quot;,&quot;from&quot;:&quot;x:50px;opacity:0;&quot;,&quot;to&quot;:&quot;o:1;&quot;,&quot;ease&quot;:&quot;Power3.easeInOut&quot;},{&quot;delay&quot;:&quot;wait&quot;,&quot;speed&quot;:300,&quot;frame&quot;:&quot;999&quot;,&quot;to&quot;:&quot;x:50px;opacity:0;&quot;,&quot;ease&quot;:&quot;Power3.easeInOut&quot;}]">삭제하기<i class="ps-icon-next"></i></a>
       --%>
       
       <c:choose>
            <c:when test="${empty sessionScope.customInfo.userId }"></c:when>
            <c:otherwise>
           <c:if test="${sessionScope.customInfo.userId eq 'admin' }">
			<a class="tp-caption ps-btn" id="layer31" href="<%=cp %>/itwillbook/created.do" data-type="text" data-responsive_offset="on" data-textAlign="['center','center','center','center']" data-frames="[{&quot;delay&quot;:1500,&quot;speed&quot;:1500,&quot;frame&quot;:&quot;0&quot;,&quot;from&quot;:&quot;x:50px;opacity:0;&quot;,&quot;to&quot;:&quot;o:1;&quot;,&quot;ease&quot;:&quot;Power3.easeInOut&quot;},{&quot;delay&quot;:&quot;wait&quot;,&quot;speed&quot;:300,&quot;frame&quot;:&quot;999&quot;,&quot;to&quot;:&quot;x:50px;opacity:0;&quot;,&quot;ease&quot;:&quot;Power3.easeInOut&quot;}]">등록하기<i class="ps-icon-next"></i></a>
			<a class="tp-caption ps-btn" id="layer31" href="<%=cp %>/itwillbook/book_delete.do" data-type="text" data-responsive_offset="on" data-textAlign="['center','center','center','center']" data-frames="[{&quot;delay&quot;:1500,&quot;speed&quot;:1500,&quot;frame&quot;:&quot;0&quot;,&quot;from&quot;:&quot;x:50px;opacity:0;&quot;,&quot;to&quot;:&quot;o:1;&quot;,&quot;ease&quot;:&quot;Power3.easeInOut&quot;},{&quot;delay&quot;:&quot;wait&quot;,&quot;speed&quot;:300,&quot;frame&quot;:&quot;999&quot;,&quot;to&quot;:&quot;x:50px;opacity:0;&quot;,&quot;ease&quot;:&quot;Power3.easeInOut&quot;}]">삭제하기<i class="ps-icon-next"></i></a>
           </c:if>
      </c:otherwise>
            
      </c:choose>
       
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

    </main>
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
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAx39JFH5nhxze1ZydH-Kl8xXM3OK4fvcg&amp;region=GB"></script><script type="text/javascript" src="<%=cp%>/book/plugins/revolution/js/jquery.themepunch.tools.min.js"></script>
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