<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Message.RecipientType"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String senderName = request.getParameter("senderName");
	String senderEmail = request.getParameter("senderEmail");
	String receiverEmail = request.getParameter("receiverEmail");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String url;
	String host = "localhost";
	
	Properties prop = System.getProperties();
	Session ssn = Session.getInstance(prop,null);
	
	try{
		
		MimeMessage message = new MimeMessage(ssn);
		
		message.addRecipient(Message.RecipientType.TO,
				new InternetAddress(receiverEmail));//받는사람이메일
		
		message.setFrom(			
				new InternetAddress(senderEmail,senderName,"UTF-8"));
							
		message.setSubject(subject , "UTF-8");
							
		message.setContent(content,"text/plain;charset=UTF-8");
						
		Transport tp = ssn.getTransport("smtp"); 
		tp.connect(host, "", ""); 
		tp.sendMessage(message, message.getAllRecipients());
		
		tp.close();
		
		url = cp + "/itwillbook/index.do";
		response.sendRedirect(url);
		
	}catch(Exception e){
	System.out.print(e.toString());
}
		
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>