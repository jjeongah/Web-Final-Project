<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %> <!-- 자바 스크립트 문장을 작성하기 위해 사용-->
<% request.setCharacterEncoding("UTF-8"); %> <!-- 건너오는 모든 데이터를 UTF-8으로 받을 수 있도록 함 -->
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