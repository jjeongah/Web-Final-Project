<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="user.UserDAO" %> <!-- login �Լ��� ����Ͽ� �α��� ó���� �ϱ� ���� user��Ű���� UserDAO�� �ҷ��´� -->
<%@ page import="java.io.PrintWriter" %> <!-- �ڹ� ��ũ��Ʈ ������ �ۼ��ϱ� ���� ���-->
<% request.setCharacterEncoding("UTF-8"); %> <!-- �ǳʿ��� ��� �����͸� UTF-8���� ���� �� �ֵ��� �� -->
<jsp:useBean id="user" class="user.User" scope="page"/> <!-- �Ѹ��� ȸ�� ������ ��� UserŬ������ �ڹ� ����� ����ϸ� ���� page�ȿ����� ��� ��� -->
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
		script.println("history.back()"); // ���� �������� ����ڸ� ���� ����.	
		script.println("</script>");
	}
	/*
	else if(userDAO.registerCheck(user.getUserName()) == -2 && userDAO.registerCheck(user.getUserPassword()) != -2 && userDAO.registerCheck(user.getPhoneNumber())!=2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Please enter user name!')");	
		script.println("history.back()"); // ���� �������� ����ڸ� ���� ����.	
		script.println("</script>");
	}
	
	else if(userDAO.registerCheck(user.getUserName()) == -2 && userDAO.registerCheck(user.getUserPassword()) == -2 && userDAO.registerCheck(user.getPhoneNumber())!=2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Please enter user name and password!')");	
		script.println("history.back()"); // ���� �������� ����ڸ� ���� ����.	
		script.println("</script>");
	}
	
	else if(userDAO.registerCheck(user.getUserName()) == -2 && userDAO.registerCheck(user.getUserPassword()) != -2 && userDAO.registerCheck(user.getPhoneNumber())==2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Please enter user name and phone number!')");	
		script.println("history.back()"); // ���� �������� ����ڸ� ���� ����.	
		script.println("</script>");
	}
	else if(userDAO.registerCheck(user.getUserName()) != -2 && userDAO.registerCheck(user.getUserPassword()) == -2 && userDAO.registerCheck(user.getPhoneNumber())==2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Please enter phone number and password!')");	
		script.println("history.back()"); // ���� �������� ����ڸ� ���� ����.	
		script.println("</script>");
	}
	else if(userDAO.registerCheck(user.getUserName()) == -2 && userDAO.registerCheck(user.getUserPassword()) == -2 && userDAO.registerCheck(user.getPhoneNumber())==2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Please enter user name, phone number, password!')");	
		script.println("history.back()"); // ���� �������� ����ڸ� ���� ����.	
		script.println("</script>");
	}*/
	
	int result = userDAO.registerCheck(user.getPhoneNumber());
	if(result == -2 && userDAO.registerCheck(user.getUserPassword()) != -2 && userDAO.registerCheck(user.getUserName()) != -2 ){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Please enter phone number!')");	
		script.println("history.back()"); // ���� �������� ����ڸ� ���� ����.	
		script.println("</script>");
	}
	else if (result == 0){ //�̹������ϴ� ȸ��
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('�̹������ϴ� ȸ��')");	
		script.println("history.back()"); // ���� �������� ����ڸ� ���� ����.	
		script.println("</script>");
	}
	else if (result == -1){ 
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('DB����')");	
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
			script.println("location.href = 'main.html'"); // main �������� ����ڸ� ���� 
			script.println("</script>");
	   }
	   catch(Exception e){       
		   e.printStackTrace();       
	   }   	
	}
%>
</html>