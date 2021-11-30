<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<% String firstName="";
    try{
        String userName = request.getParameter("userName");   
        String password = request.getParameter("password");
        String phoneNumber = request.getParameter("phoneNumber");   
       
        Class.forName("com.mysql.cj.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/studycafe?" + "user=root&password=leeja813");
        
        String sql = "insert into users(user_name,password,phone_number)values(	?,?,?)";
        PreparedStatement ps = null;
        ps = conn.prepareStatement(sql);
        ps.setString(1, userName);
        ps.setString(2, password);
        ps.setString(3, phoneNumber);
        
        int i=ps.executeUpdate();
                                   
        if(i==0)  {         
           firstName = "";   
           }         
   }
   catch(Exception e){       
       out.println("Something went wrong !! Please try again");       
   }      
%>

<jsp:include page="fee.html"></jsp:include>
</body>
</html>