<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %> <!-- to write javascript sentence -->
<% request.setCharacterEncoding("UTF-8"); %> <!-- receive all data UTF-8 -->
<jsp:useBean id="currentuserdao" class="OtherUser.OtherUserDAO" scope="page"/> <!-- use java bean to use otheruserdao object -->
<!-- get property from previous page -->
<jsp:setProperty name="currentuserdao" property="userPhoneNumber" />

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	//With user's phonenumber, do "return locker" of current user
		Boolean i = currentuserdao.returnLocker(currentuserdao.getUserPhoneNumber());
		if(i==true){//success
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Successfully return your locker.')");
			script.println("history.back()");	
			script.println("</script>");
			session.setAttribute("is_user_reserve_locker",false);
		}else{//database error
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Database Error')");
			script.println("history.back()");	
			script.println("</script>");
		}
	%>

</body>
</html>