<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %> <!-- to write javascript sentence -->
<% request.setCharacterEncoding("UTF-8"); %> <!-- receive all data UTF-8 -->
<jsp:useBean id="reservedao" class="reserve.ReserveDAO" scope="page"/>
<!-- get property from previous page -->
<jsp:setProperty name="reservedao" property="userPhoneNumber" />
<jsp:setProperty name="reservedao" property="reserveLockerId" />

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>reserveLockerAction</title>
</head>
<body>
	<% 
	//With user's phonenumber, do "reserve locker" for current user and proposed lockerid
		Boolean i = reservedao.reserveLocker(reservedao.getUserPhoneNumber(),reservedao.getReserveLockerId());
		if(i==true){//success
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Successfully reserve your locker.')");
			script.println("history.back()");	
			script.println("</script>");
			session.setAttribute("is_user_reserve_locker",true);
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