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



	function closing(){	
		opener.document.location.reload();
		self.close();
	}
</script>
</head>
<body>

	<center>
	<br/><br/><br/>
	<b>요청하신 게시물은은 </b><br/>
	<b>삭제가 완료되었습니다! </b><br/><br/>
	<input type= "button" value="돌아가기" onclick="closing();">
	</center>


</body>
</html>