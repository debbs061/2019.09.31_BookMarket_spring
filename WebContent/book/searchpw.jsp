<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8"); 
String cp = request.getContextPath(); 
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
    <link href="<%=cp %>/book/apple-touch-icon.png" rel="apple-touch-icon">
    <link href="<%=cp %>/book/favicon.png" rel="icon">
    <meta name="author" content="Nghia Minh Luong">
    <meta name="keywords" content="Default Description">
    <meta name="description" content="Default keyword">
    <title>비밀번호 찾기</title>
    <!-- Fonts-->
    <link href="https://fonts.googleapis.com/css?family=Archivo+Narrow:300,400,700%7CMontserrat:300,400,500,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" href="<%=cp %>/book/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=cp %>/book/plugins/ps-icon/style.css">
    <!-- CSS Library-->
    <link rel="stylesheet" href="<%=cp %>/book/plugins/bootstrap/dist/css/bootstrap.min.css">
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
    <link rel="stylesheet" href="<%=cp %>/book/css/style.css">
    <!--HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries-->
    <!--WARNING: Respond.js doesn't work if you view the page via file://-->
    <!--[if lt IE 9]><script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script><script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script><![endif]-->

<script type="text/javascript">

	function searchpw() {
	
		var f = document.myForm;
	
		if(!f.userId.value) {
			
			alert("아이디 입력하세요");
			f.userId.focus();
			return;
		}
		
		if(!f.userTel.value) {
			
			alert("전화번호 입력하세요");
			f.userTel.focus();
			return;
		}
		
		f.action = "<%=cp%>/itwillbook/searchpw_ok.do";
		f.submit();
		
	}

</script>

</head>
<body>
 <body class="ps-loading">

    <div class="header--sidebar"></div>
    <header class="header">
      <div class="header__top">
        <div class="container-fluid">
          <div class="row">
                <div class="col-lg-6 col-md-8 col-sm-6 col-xs-12 ">
                </div>
                <div class="col-lg-6 col-md-4 col-sm-6 col-xs-12 ">
                  <div class="header__actions"><a href="<%=cp %>/itwillbook/login.do">로그인 / 회원가입</a>
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
        </div>
      </nav>
     </header>
     <div class="header-services"></div>
    <main class="ps-main">
      <div class="ps-home-contact">
        <div id="contact-map" data-address="New York, NY" data-title="BAKERY LOCATION!" data-zoom="15"></div>
        <div class="ps-home-contact__form">
          <header>
            <h3>비밀번호 찾기</h3>
          </header>
          <footer>
          
             <form action="" method="post" name="myForm">
              <div class="form-group">
                <label>아이디<span>*</span></label>
                <input class="form-control" type="text" name="userId">
              </div>
              <div class="form-group">
                <label>전화번호<span>*</span></label>
                <input class="form-control" type="text" name="userTel">
              </div>
            	
              <div class="form-group text-center">
                <button type="button" class="ps-btn" onclick="searchpw();">확인<i class="fa fa-angle-right"></i></button>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <button type="button" class="ps-btn" 
                onclick="javascript:location.href='<%=cp%>/itwillbook/login.do';">취소<i class="fa fa-angle-right"></i></button>
              </div>
            </form>
            
          </footer>
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


<%-- 
<tr height="30">
	<td colspan="2" align="center">
	
	<input type="button" value="확인" class="btn2"
	onclick="searchpw();"/>
	
	<input type="button" value="취소" class="btn2"
	onclick="javascript:location.href='<%=cp%>/itwillbook/login.do';"/>
	
	</td>
</tr>
 --%>

</table>

</form>

</body>
</html>