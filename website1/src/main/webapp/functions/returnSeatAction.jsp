<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %> <!-- 자바 스크립트 문장을 작성하기 위해 사용-->
<% request.setCharacterEncoding("UTF-8"); %> <!-- 건너오는 모든 데이터를 UTF-8으로 받을 수 있도록 함 -->
<jsp:useBean id="currentuserdao" class="OtherUser.OtherUserDAO" scope="page"/> <!-- 한명의 회원 정보를 담는 User클래스를 자바 빈즈로 사용하며 현재 page안에서만 빈즈를 사용 -->
<!-- get property from previous page -->
<jsp:setProperty name="currentuserdao" property="userPhoneNumber" />

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	//With user's phonenumber, do "return seat" of current user
		Boolean i = currentuserdao.returnSeat(currentuserdao.getUserPhoneNumber());
		if(i==true){//success
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Successfully return your seat.')");
			script.println("history.back()");	
			script.println("</script>");
			session.setAttribute("is_user_reserve_seat",false);
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