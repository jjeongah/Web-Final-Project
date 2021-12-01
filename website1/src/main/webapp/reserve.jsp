<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="reserve.*" %>
<%@ page import="OtherUser.*" %> <!-- login 함수를 사용하여 로그인 처리를 하기 위해 user패키지의 UserDAO를 불러온다 -->
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%  // 로그인 페이지에서 넘겨준 userID와 userPassword를 받아서 로그인 판별
		OtherUserDAO otherUserDAO = new OtherUserDAO();
		List<OtherUser> list = otherUserDAO.getAllUsers();
		Reserve reserve = new Reserve(list, "010-6217-9873");//dummy data
	%>

<jsp:include page="reserve.html"></jsp:include>

</body>
</html>