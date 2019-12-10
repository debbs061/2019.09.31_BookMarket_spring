<%@page import="com.util.DBConn2"%>
<%@page import="com.book.ProductDTO"%>
<%@page import="com.book.ProductDAO"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	int num = Integer.parseInt(request.getParameter("num"));
	Connection conn = DBConn2.getConnection();
	
	ProductDAO dao = new ProductDAO(conn);
	String review = request.getParameter("review");
	
	ProductDTO dto = dao.getReadData(num);
	String rev = dto.getReview();
	String review2 =rev.replaceAll("\\.", ".<br/>");
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
    <title>IT WILL BOOKS - Product Detail</title>
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
    <link rel="stylesheet" href="<%=cp%>/book/css/style.css">
    <!--HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries-->
    <!--WARNING: Respond.js doesn't work if you view the page via file://-->
    <!--[if lt IE 9]><script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script><script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script><![endif]-->
  <script type="text/javascript">
  	function sendIt() {
		
  		var f = document.myForm;
  		
  		f.action = "<%=cp%>/itwillbook/cart_ok.do";
  		f.submit();
	}
  	
	function sendItDirect() {
		
  		var f = document.myForm;
  		
  		f.action = "<%=cp%>/itwillbook/checkoutDirect.do";
  		f.submit();
	}
	
	function openCheck(userPwd,r_seq,userName) {
		
		url= "<%=cp%>/itwillbook/visitorDeletion.do?userPwd="+userPwd+"&r_seq="+r_seq+"&userName="+userName;
		open(url,"chkForm","width=500, height=300, resizable=no, scrollbars=no");
	}
  </script>
  
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
                  	<a class="ps-cart-item__close" href="<%=cp %>/itwillbook/deleteItemProductDetail.do?name=${dto.name}"></a>
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
      <div class="test">
        <div class="container">
          <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 ">
                </div>
          </div>
        </div>
      </div>
      <div class="ps-product--detail pt-60">
        <div class="ps-container">
          <div class="row">
            <div class="col-lg-10 col-md-12 col-lg-offset-1">
              <div class="ps-product__thumbnail">
                <div class="ps-product__preview">
                  
                </div>
                <div class="ps-product__image">
                  <div class="item"><img class="zoom" src="${imagePath }/${dto.saveFileName }" alt="" data-zoom-image="images/shoe-detail/1.jpg"></div>
                  <div class="item"><img class="zoom" src="${imagePath }/${dto.saveFileName }" alt="" data-zoom-image="images/shoe-detail/2.jpg"></div>
                  <div class="item"><img class="zoom" src="${imagePath }/${dto.saveFileName }" alt="" data-zoom-image="images/shoe-detail/3.jpg"></div>
                </div>
              </div>
              
              <div class="ps-product__thumbnail--mobile">
                <div class="ps-product__main-img"><img src="${imagePath }/${dto.saveFileName }" alt=""></div>
                <div class="ps-product__preview owl-slider" data-owl-auto="true" data-owl-loop="true" data-owl-speed="5000" data-owl-gap="20" data-owl-nav="true" data-owl-dots="false" data-owl-item="3" data-owl-item-xs="3" data-owl-item-sm="3" data-owl-item-md="3" data-owl-item-lg="3" data-owl-duration="1000" data-owl-mousedrag="on"><img src="${imagePath }/${dto.saveFileName }" alt=""><img src="${imagePath }/${dto.saveFileName }" alt=""><img src="${imagePath }/${dto.saveFileName }" alt=""></div>
              </div>
              <div class="ps-product__info">
                <div class="ps-product__rating">
                  
                </div>
                <h1>${dto.name}</h1>
                <p class="ps-product__category">${dto.writer}</p>
                <h3 class="ps-product__price">${dto.price} 원</h3>
                <div class="ps-product__block ps-product__quickview">
                  <h4>책 소개</h4>
                  <p>${dto.review }</p>
                </div>
                
                <form name="myForm" action="" method="post">
                <div class="ps-product__block ps-product__size">
                  <h4>수량</h4>
                  
                  <div class="form-group">
                    <input class="form-control" name="quantity" type="number" value="1">
                  </div>
                </div>
                <div class="ps-product__shopping">
                <a class="ps-btn mb-10" onclick="sendIt();">장바구니 담기<i class="ps-icon-next"></i></a>
                <a class="ps-btn mb-10" onclick="sendItDirect();" style="background-color:#2d8659 !important;">바로 구매<i class="ps-icon-next"></i></a>
                <input type="hidden" name="name" value="${dto.name }"/>
                <input type="hidden" name="price" value="${dto.price }"/>
                <input type="hidden" name="saveFileName" value="${dto.saveFileName }"/>
                <input type="hidden" name="num" value="${dto.num }"/>
                
                  <div class="ps-product__actions">
                  <!-- 
                  <a class="mr-10" href="whishlist.html"><i class="ps-icon-heart"></i></a><a href="compare.html"><i class="ps-icon-share"></i></a>
                   -->
                  </div>
                  
                </div>
                
                </form>
                
              </div>
              <div class="clearfix"></div>
              <div class="ps-product__content mt-50">
                <ul class="tab-list" role="tablist">
                  <li class="active"><a href="#tab_02" aria-controls="tab_02" role="tab" data-toggle="tab">리뷰</a></li>
                  <li><a href="#tab_01" aria-controls="tab_01" role="tab" data-toggle="tab">책 소개</a></li>
                
                </ul>
              </div>
              <div class="tab-content mb-60">
                <div class="tab-pane" role="tabpanel" id="tab_01">
                  <p><b><%=review2 %></b></p>
                  <p></p>
                </div>
                
                
                <!-- 리뷰  -->
                <div class="tab-pane active" role="tabpanel" id="tab_02">
                  <p class="mb-20"><strong>${dto.name }</strong>  (총&nbsp; ${reviewDataCount }건)</p>
                <c:choose>
                
                	<c:when test="${empty reviewLists  }">
                		<br/><br/>
                			<div class="ps-review">
                   		    <div class="ps-review__thumbnail"><img src="images/user/1.jpg" alt=""></div>
                            <div class="ps-review__content">
                 				<p>등록된 리뷰가 없습니다. 리뷰를 작성해 주세요</p>
                    		</div>
                 		 	</div>
                	</c:when>
                	
                	<c:otherwise>
                	
                	<!-- 리뷰 출력 -->
                	<c:forEach var="redto" items="${reviewLists }">
                	<div class="ps-review">
                    <div class="ps-review__thumbnail"><img src="images/user/1.jpg" alt=""></div>
                    <div class="ps-review__content">
                      
                      <header>
                         <select class="ps-rating">
                     	   <c:forEach begin="1" end="5" var="i">
                        	<c:if test="${redto.rating==i}">
                        		<c:forEach begin="1" end="${redto.rating}">
                        		 <option value="1"></option>
                        		 </c:forEach>
                        	</c:if>
                       	   </c:forEach>
						</select>
                    
                        <p>By<a href=""> ${redto.userName }</a> - ${redto.reviewDate}</p>
                      
                       <!-- 본인 로그인시에만 삭제버튼 생성 --> 
                      	<c:if test="${!empty sessionScope.customInfo.userId && sessionScope.customInfo.userId eq redto.userId}">
                      		  <a style="align-content:center;" href="<%=cp %>/itwillbook/review_delete.do?r_seq=${redto.r_seq}&num=${redto.num}&pageNum=${pageNum}">
                      		  <input align="right" type="button" name="" value="삭제">
                      		  </a>
                      	</c:if>
                      	
                      	<!-- 비회원 게시글 삭제버튼 -->
                      	<c:if test="${redto.userId eq 'visitor' }">
                      		<input type="button" value="비회원 삭제" onclick="openCheck('${redto.userPwd}','${redto.r_seq}','${redto.userName}');">
		                </c:if>
                      	
                     </header>
                      <p>${redto.reviewContent }</p>
                      
                    </div>
                    
                 
                  </div>
                  </c:forEach>
                  <div class="mt-30">
	                    <div class="ps-pagination">
	                      <ul class="pagination">
							<p>
								<c:if test="${dataCount!=0 }">
									${pageIndexList }
								</c:if>
								<c:if test="${dataCount==0 }">
									등록된 게시물이 없습니다
								</c:if>
							</p>
						  </ul>
	                    </div>
	                </div>
                  
                	</c:otherwise>
                 </c:choose>  
                  
                  <!-- 리뷰 작성 -->
        <!-- 비회원 리뷰 작성 -->
         <c:choose>
			<c:when test="${empty sessionScope.customInfo.userId }">
				 <form class="ps-product__review" action="<%=cp %>/itwillbook/review.do?num=${num}" method="post">
                  	<input type="hidden" name="num" value="${dto.num}">
            		<input type="hidden" name="userId" value="visitor">
                    <h4><b>비회원 리뷰 작성</b></h4>
                    <div class="row">
                          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 ">
                            <div class="form-group">
                              <label>작성자:<span>*</span></label>
                              <input class="form-control" type="text" placeholder="" name="userName" value="">
                            </div>
                            <div class="form-group">
                              <label>이메일:<span>*</span></label>
                              <input class="form-control" type="email" placeholder="" name="email" value="">
                            </div>
                            <div class="form-group">
                              <label>평점<span></span></label>
							<select class="ps-rating" name="rating">
                                <option value="1"></option>
                                <option value="2"></option>
                                <option value="3"></option>
                                <option value="4"></option>
                                <option value="5"></option>
                              </select>
                            </div>
                          </div>
                          <div class="col-lg-8 col-md-8 col-sm-6 col-xs-12 ">
                            <div class="form-group">
                              <label>마이 리뷰:</label>
                              <textarea class="form-control" rows="6" name="reviewContent"
                              placeholder="소중한 리뷰를 남겨주세요"></textarea>
                            </div>
                            <div class="form-group">
                              <label>비밀번호:<span>*</span></label>
                              <input style="width:250px;" class="form-control" maxlength="20" type="text" placeholder="" name="userPwd" value="">
                            </div> 
                            <div class="form-group">
                              <button class="ps-btn ps-btn--sm">등록<i class="ps-icon-next"></i></button>
                            </div>
                          </div>
                  	 </div>
                 	 </form>
                  </c:when>
						
			
				<c:otherwise>
				<!-- 회원 리뷰작성 -->
				<form class="ps-product__review" action="<%=cp %>/itwillbook/review.do?num=${dto.num}" method="post">
                  <input type="hidden" name="num" value="${dto.num}">
           		  <h4><b>리뷰 쓰기</b></h4>
                    <div class="row">
                          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 ">
                            <div class="form-group">
                              <label>작성자:<span>*</span></label>
                              <input class="form-control" type="text" placeholder="" name="userName" value="${mdto.userName }">
                            </div>
                            <div class="form-group">
                              <label>이메일:<span>*</span></label>
                              <input class="form-control" type="email" placeholder="" name="email" value="${mdto.email }">
                            </div>
                            <div class="form-group">
                              <label>평점<span></span></label>
							<select class="ps-rating" name="rating">
                                <option value="1"></option>
                                <option value="2"></option>
                                <option value="3"></option>
                                <option value="4"></option>
                                <option value="5"></option>
                              </select>
                            </div>
                          </div>
                          <div class="col-lg-8 col-md-8 col-sm-6 col-xs-12 ">
                            <div class="form-group">
                              <label>마이 리뷰:</label>
                              <textarea class="form-control" rows="6" name="reviewContent"
                              placeholder="소중한 리뷰를 남겨주세요"></textarea>
                            </div>
                            <div class="form-group">
                              <button class="ps-btn ps-btn--sm">등록<i class="ps-icon-next"></i></button>
                            </div>
                          </div>
                  	 </div>
                 	 </form>
                  
					</c:otherwise>
					</c:choose>      
            	</div>
                
                
                <div class="tab-pane" role="tabpanel" id="tab_04">
                  <div class="form-group">
                    <textarea class="form-control" rows="6" placeholder="Enter your addition here..."></textarea>
                  </div>
                  <div class="form-group">
                    <button class="ps-btn" type="button">Submit</button>
                  </div>
                </div>
              </div>
            </div>
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