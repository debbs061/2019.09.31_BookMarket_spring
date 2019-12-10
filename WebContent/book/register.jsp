<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
%>
<!DOCTYPE html>
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
    <title>회원가입 페이지</title>
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

<script type="text/javascript">

	function sendIt(){
		
		var f = document.myForm;
		
		str = f.userId.value;
		str = str.trim();
		
		if(!str){
			alert("아이디를 입력하세요");
			f.userId.focus();
			return;
		}
		f.userId.value = str;
		
		
		if(f.idDuplication.value != "idCheck") {
			alert("아이디 중복체크 해주세요.");
			return;
		}
		
		str = f.userPwd.value;
		str = str.trim();
		
		if(!str){
			alert("패스워드를 입력하세요");
			f.userPwd.focus();
			return;
		}
		if(str != f.okPwd.value){
			alert("패스워드가 일치하지 않습니다");
			f.okPwd.focus();
			return;
		}
		f.userPwd.value = str;
		
		str = f.userName.value;
		str = str.trim();
		
		if(!str){
			alert("이름을 입력하세요");
			f.userName.focus();
			return;
		}
		f.userName.value = str;
		
		str = f.userBirth.value;
		str = str.trim();
		
		if(!str){
			alert("생일을 입력하세요");
			f.userBirth.focus();
			return;
		}
		f.userBirth.value = str;
		
		str = f.userTel.value;
		str = str.trim();
		
		if(!str){
			alert("전화번호를 입력하세요");
			f.userTel.focus();
			return;
		}
		f.userTel.value = str;
		
		str = f.email.value;
		str = str.trim();
	    if(!str) {
	        alert("\nE-Mail을 입력하세요. ");
	        f.email.focus();
	        return;
	    }
		f.email.value = str;
		
		f.action = "<%=cp %>/itwillbook/register_ok.do";
		f.submit();
	}

	// 아이디 중복체크 화면 open
	function openIdChk() {
		var f = document.myForm;
		
		if(!f.userId.value){
			alert("아이디를 입력하세요");
			f.userId.focus();
			return;
		}
		
		var id = f.userId.value;	
		url = "<%=cp %>/itwillbook/id_check.do?id="+id;
		open(url,"chkForm","width=500, height=300, resizable=no, scrollbars=no");
	}
	
	
	function inputIdChk() {
		document.myForm.idDuplication.value ="idUncheck";
		// 아이디 value에 값 입력 시 idDuplication.value가 바로 idUnchek로 바뀜
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
            <h3>회원가입</h3>
            <p>정보를 입력해주세요</p>
          </header>
          <footer>
            <form action="javascript:sendIt();" method="post" name="myForm">
              <div class="form-group">
                <label>아이디<span>*</span></label>
                <input class="form-control" type="text" name="userId"><br/>
                  <div class="form-group text-center">
                	 <button type="button" class="ps-btn" onclick="openIdChk();">중복확인<i class="fa fa-angle-right"></i></button>
                  </div>
                <input type="hidden" name="idDuplication" value="idUncheck">
              </div>
              <div class="form-group">
                <label>비밀번호<span>*</span></label>
                <input class="form-control" type="password" name="userPwd">
              </div>
              <div class="form-group">
                <label>비밀번호 재확인<span>*</span></label>
                <input class="form-control" type="password" name="okPwd">
              </div>
              <div class="form-group">
                <label>이름<span>*</span></label>
                <input class="form-control" type="text" name="userName">
              </div>
              <div class="form-group">
                <label>생년월일(YYYY-MM-DD)<span>*</span></label>
                <input class="form-control" type="text" name="userBirth">
              </div>
              <div class="form-group">
                <label>전화번호<span>*</span></label>
                <input class="form-control" type="text" name="userTel">
              </div>
              <div class="form-group">
                <label>이메일<span>*</span></label>
                <input class="form-control" type="email" name="email">
              </div>
              <div class="form-group text-center">
                <button class="ps-btn">회원가입<i class="fa fa-angle-right"></i></button>
           
              </div>
            </form>
          </footer>
        </div>
      </div>
    </main>
    
    <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
    
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
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAx39JFH5nhxze1ZydH-Kl8xXM3OK4fvcg&amp;region=GB"></script><script type="text/javascript" src="<%=cp%>/book/plugins/revolution/js/jquery.themepunch.tools.min.js"></script>
<script type="text/javascript" src="<%=cp%>/book/plugins/revolution/js/jquery.themepunch.revolution.min.js"></script>
<script type="text/javascript" src="<%=cp%>/book/plugins/revolution/js/extensions/revolution.extension.video.min.js"></script>
<script type="text/javascript" src="<%=cp%>/book/plugins/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
<script type="text/javascript" src="<%=cp%>/book/plugins/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
<script type="text/javascript" src="<%=cp%>/book/plugins/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
<script type="text/javascript" src="<%=cp%>/book/plugins/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
<script type="text/javascript" src="<%=cp%>/book/plugins/revolution/js/extensions/revolution.extension.actions.min.js"></script>
    <!-- Custom scripts-->
    <script type="text/javascript" src="<%=cp %>/book/js/main.js"></script>
  </body>
</html>