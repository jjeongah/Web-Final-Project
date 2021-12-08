<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %> <!-- 자바 스크립트 문장을 작성하기 위해 사용-->
<% request.setCharacterEncoding("UTF-8"); %> <!-- 건너오는 모든 데이터를 UTF-8으로 받을 수 있도록 함 -->
<jsp:useBean id="reservedao" class="reserve.ReserveDAO" scope="page"/> <!-- 한명의 회원 정보를 담는 User클래스를 자바 빈즈로 사용하며 현재 page안에서만 빈즈를 사용 -->
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
		System.out.println("in reserveLockerAction.jsp");
		System.out.println(reservedao.getUserPhoneNumber());
		System.out.println(reservedao.getReserveLockerId());
		reservedao.reserveLocker(reservedao.getUserPhoneNumber(),reservedao.getReserveLockerId());
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Successfully reserve your locker.')");
		script.println("history.back()");	
		script.println("</script>");
	%>

</body>
</html>