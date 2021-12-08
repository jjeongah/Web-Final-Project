<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="user.UserDAO" %> <!-- login 함수를 사용하여 로그인 처리를 하기 위해 user패키지의 UserDAO를 불러온다 -->
<%@ page import="java.io.PrintWriter" %> <!-- 자바 스크립트 문장을 작성하기 위해 사용-->
<% request.setCharacterEncoding("UTF-8"); %> <!-- 건너오는 모든 데이터를 UTF-8으로 받을 수 있도록 함 -->
<jsp:useBean id="user" class="user.User" scope="page"/> <!-- 한명의 회원 정보를 담는 User클래스를 자바 빈즈로 사용하며 현재 page안에서만 빈즈를 사용 -->
<jsp:setProperty name="user" property="phoneNumber" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>joinAction</title>
</head>
<body>

</body>
<%@ page import ="java.sql.*" %>
<% 
	UserDAO userDAO = new UserDAO();
	if(userDAO.registerCheck(user.getUserPassword()) == -2 /*&& userDAO.registerCheck(user.getUserName()) != -2 && userDAO.registerCheck(user.getPhoneNumber())!=2*/){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Please enter user password!')");	
		script.println("history.back()"); // 이전 페이지로 사용자를 돌려 보냄.	
		script.println("</script>");
	}
	/*
	else if(userDAO.registerCheck(user.getUserName()) == -2 && userDAO.registerCheck(user.getUserPassword()) != -2 && userDAO.registerCheck(user.getPhoneNumber())!=2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Please enter user name!')");	
		script.println("history.back()"); // 이전 페이지로 사용자를 돌려 보냄.	
		script.println("</script>");
	}
	
	else if(userDAO.registerCheck(user.getUserName()) == -2 && userDAO.registerCheck(user.getUserPassword()) == -2 && userDAO.registerCheck(user.getPhoneNumber())!=2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Please enter user name and password!')");	
		script.println("history.back()"); // 이전 페이지로 사용자를 돌려 보냄.	
		script.println("</script>");
	}
	
	else if(userDAO.registerCheck(user.getUserName()) == -2 && userDAO.registerCheck(user.getUserPassword()) != -2 && userDAO.registerCheck(user.getPhoneNumber())==2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Please enter user name and phone number!')");	
		script.println("history.back()"); // 이전 페이지로 사용자를 돌려 보냄.	
		script.println("</script>");
	}
	else if(userDAO.registerCheck(user.getUserName()) != -2 && userDAO.registerCheck(user.getUserPassword()) == -2 && userDAO.registerCheck(user.getPhoneNumber())==2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Please enter phone number and password!')");	
		script.println("history.back()"); // 이전 페이지로 사용자를 돌려 보냄.	
		script.println("</script>");
	}
	else if(userDAO.registerCheck(user.getUserName()) == -2 && userDAO.registerCheck(user.getUserPassword()) == -2 && userDAO.registerCheck(user.getPhoneNumber())==2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Please enter user name, phone number, password!')");	
		script.println("history.back()"); // 이전 페이지로 사용자를 돌려 보냄.	
		script.println("</script>");
	}*/
	
	int result = userDAO.registerCheck(user.getPhoneNumber());
	if(result == -2 && userDAO.registerCheck(user.getUserPassword()) != -2 && userDAO.registerCheck(user.getUserName()) != -2 ){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Please enter phone number!')");	
		script.println("history.back()"); // 이전 페이지로 사용자를 돌려 보냄.	
		script.println("</script>");
	}
	else if (result == 0){ //이미존재하는 회원
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미존재하는 회원')");	
		script.println("history.back()"); // 이전 페이지로 사용자를 돌려 보냄.	
		script.println("</script>");
	}
	else if (result == -1){ 
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('DB오류')");	
		script.println("history.back()");	
		script.println("</script>");
	}
	else if (result == 1){
	    try{
	        String userName = request.getParameter("userName");   
	        String userPassword = request.getParameter("userPassword");
	        String phoneNumber = request.getParameter("phoneNumber");
	        Class.forName("com.mysql.cj.jdbc.Driver");  // MySQL database connection
	        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/studycafe?" + "user=root&password=leeja813");
	        
	        String sql = "insert into user(userName, userPassword, phoneNumber)values(	?,?,?)";
	        PreparedStatement ps = null;
	        ps = conn.prepareStatement(sql);
	        ps.setString(1, userName);
	        ps.setString(2, userPassword);
	        ps.setString(3, phoneNumber);
	        
	        int i=ps.executeUpdate();
	        PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'main.html'"); // main 페이지로 사용자를 보냄 
			script.println("</script>");
	   }
	   catch(Exception e){       
		   e.printStackTrace();       
	   }   	
	}
%>
</html>