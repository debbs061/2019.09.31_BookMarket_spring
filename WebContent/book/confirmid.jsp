<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8"); 
	String cp = request.getContextPath(); 
	
	int check = (int)request.getAttribute("result");
	String id = (String)request.getAttribute("id");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ID 중복확인</title>
<script type="text/javascript">

	function setid() {
		
		opener.document.myForm.userId.value = "<%=id%>";
		opener.document.myForm.idDuplication.value = "idCheck";
		self.close();
	}

</script>


</head>
<body>

<% if (check == 1) { %>
	<center>
	<b><font color="red"><%=id %>는 이미 사용중인 아이디입니다.</font></b>
	<form name="checkForm" method="post" action="<%=cp %>/itwillbook/id_check.do">
	<b>다른 아이디를 선택하세요</b><br/><br/>
	<input type="text" name="id"/>
	<input type="submit" value="Id중복확인"/>
	</form>
	</center>
<% } else {%>
	<center>
	<br/><br/><br/>
	<b>입력하신 <font color="red"><%=id %></font>는 <br/> 
	사용하실 수 있는 ID 입니다.</b><br/><br/>
	
	<input type= "button" value="닫기" onclick="setid()"></center>
<%} %>

</body>
</html>