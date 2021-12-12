<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %> <!-- to write javascript sentence -->
<% request.setCharacterEncoding("UTF-8"); %> <!-- receive all data UTF-8 -->
<jsp:useBean id="currentuserdao" class="OtherUser.OtherUserDAO" scope="page"/> <!-- use java bean to use otheruserdao object -->
<!-- get property from previous page -->
<jsp:setProperty name="currentuserdao" property="userPhoneNumber" />
<jsp:setProperty name="currentuserdao" property="userChargedFee" />
<jsp:setProperty name="currentuserdao" property="input1" />
<jsp:setProperty name="currentuserdao" property="input2" />

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>chargeFeeAction</title>
</head>
<body>
	<% 
	System.out.println(currentuserdao.getInput1());
	
		if(currentuserdao.getInput1()==null || currentuserdao.getInput1()=="" 
		|| currentuserdao.getInput2()==null || currentuserdao.getInput2()==""){
			//input is blank -> error
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("history.back()");
			script.println("</script>");
		}
		else{
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
		}
	%>

</body>
</html>