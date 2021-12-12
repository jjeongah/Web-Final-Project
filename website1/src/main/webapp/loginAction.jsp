<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %> <!-- we call UserDAO of the user package to process the login.-->
<%@ page import="java.io.PrintWriter" %> <!-- Used to write JavaScript statements-->
<% request.setCharacterEncoding("UTF-8"); %> <!-- Allows all incoming data to be received in UTF-8 -->
<jsp:useBean id="user" class="user.User" scope="page"/> <!-- The User class that contains one member's information is used as a Java bean, and the bean is used only in the current page. -->
<jsp:setProperty name="user" property="phoneNumber" />
<jsp:setProperty name="user" property="userPassword" />

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%  // Determine the login by receiving the userID and userPassword passed on the login page
		session.setAttribute("phone_number",user.getPhoneNumber());
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getPhoneNumber(), user.getUserPassword());
		if (result == 1){ // If the login information is correct, the page is moved by executing JavaScript
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'reserve.jsp'"); // send user to main page
			script.println("</script>");
		}
		else if (result == 0){ 
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Wrong password!')");	
			script.println("history.back()"); //send user to previous page
			script.println("</script>");
		}
		else if (result == -2){ 
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('An error occurred in the database.')");	
			script.println("history.back()");	
			script.println("</script>");
		}
		else if (result == -1){ 
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Wrong phone number!')");	
			script.println("history.back()");	
			script.println("</script>");
		}
	%>

</body>
</html>