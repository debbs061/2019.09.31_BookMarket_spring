<%@page import="java.awt.print.Printable"%>
<%@ page contentType="text/html; charset=UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	String cp= request.getContextPath();
	
	String r_seq = request.getParameter("r_seq");
	String userPwd = request.getParameter("userPwd");
	String userName = request.getParameter("userName");
	
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비회원 리뷰 삭제</title>

<script type="text/javascript">

	function checkPWd(){
		
		var f = document.myForm;
		
		
		if(!f.userPwd.value){
			alert("비밀번호를 입력하세요");
			f.userPwd.focus();
			return;
		}
		
		if(f.userPwd.value!=<%=userPwd%>){
			alert("비밀번호가 일치하지 않습니다");
			return;
		}
		
		alert("비밀번호가 일치합니다!");
		f.submit();	
	}

	function closing(){	
		self.close();
	}
</script>
</head>
<body>

	<center>
	<form action="<%=cp %>/itwillbook/reviewDeletion_ok.do;" name="myForm" method="post">
	<input type="hidden" name="userName" value="userName">
	<input type="hidden" name="r_seq" value="${r_seq }">
	<input type="hidden" name="num" value="${num }">
	
	<br/><br/><br/>
	<b><font color="red"><%=userName %>님! 비밀번호를 입력하세요.</font></b><br/><br/>
	<input type="text" name="userPwd" value=""><br/>
	<input type= "button" value="리뷰 삭제" onclick="checkPWd();">
	<input type= "button" value="돌아가기" onclick="closing();">
	</form>
	</center>
	

</body>
</html>