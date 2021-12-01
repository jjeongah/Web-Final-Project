<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
<%@ page import ="java.sql.*" %>
<% 
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
     
   }
   catch(Exception e){       
	   e.printStackTrace();       
   }      
%>
</html>