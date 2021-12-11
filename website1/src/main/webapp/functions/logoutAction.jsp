<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %> <!-- 자바 스크립트 문장을 작성하기 위해 사용-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logoutAction</title>
</head>
<body>
	<%
		session.setAttribute("phone_number",null);
		session.setAttribute("is_user_reserve_locker",null);
		session.setAttribute("is_user_reserve_seat",null);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = '../main.jsp'");
		script.println("</script>");
	%>
</body>
</html>