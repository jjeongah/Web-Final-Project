<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>  <!-- to write javascript sentence -->
<% request.setCharacterEncoding("UTF-8"); %> <!-- receive all data UTF-8 -->
<jsp:useBean id="reservedao" class="reserve.ReserveDAO" scope="page"/>
<!-- get property from previous page -->
<jsp:setProperty name="reservedao" property="reserveSeatId" />
<jsp:setProperty name="reservedao" property="reserveSeatTimeNumber" />
<jsp:setProperty name="reservedao" property="userPhoneNumber" />
<jsp:setProperty name="reservedao" property="userChargedFee" />
<jsp:setProperty name="reservedao" property="neededFee" />
<jsp:setProperty name="reservedao" property="seatEndTime" />

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>extendSeatAction</title>
</head>
<body>
	<% 
	//With user's information, do "extend seat" for current user
		int i= reservedao.extendSeat(reservedao.getUserPhoneNumber(),reservedao.getUserChargedFee(),reservedao.getNeededFee(),
				reservedao.getReserveSeatId(), reservedao.getReserveSeatTimeNumber(), reservedao.getSeatEndTime());
		if(i==-1){//insufficient fee
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Your charged fee is insufficient.')");
			script.println("history.back()");	
			script.println("</script>");
		}
		else if(i==-2){//database error
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Database Error')");
			script.println("history.back()");
			script.println("</script>");
		}else{//success
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Successfully extend your seat.')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>

</body>
</html>