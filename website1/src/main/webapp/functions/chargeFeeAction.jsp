<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %> <!-- to write javascript sentence -->
<% request.setCharacterEncoding("UTF-8"); %> <!-- receive all data UTF-8 -->
<jsp:useBean id="currentuserdao" class="OtherUser.OtherUserDAO" scope="page"/> <!-- use java bean to use otheruserdao object -->
<!-- get property from previous page -->
<jsp:setProperty name="currentuserdao" property="userPhoneNumber" />
<jsp:setProperty name="currentuserdao" property="userChargedFee" />

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>chargeFeeAction</title>
</head>
<body>
	<% 
	//With phonenumber and chargedfee, do "charge fee" for current user
		Boolean i = currentuserdao.chargeFee(currentuserdao.getUserPhoneNumber(), currentuserdao.getUserChargedFee());
		if(i==true){//success
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Successfully charge fee.')");
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