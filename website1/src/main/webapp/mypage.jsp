<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="OtherUser.OtherUserDAO" %>
<%@ page import="java.io.PrintWriter" %> <!-- 자바 스크립트 문장을 작성하기 위해 사용-->
<% request.setCharacterEncoding("UTF-8"); %> <!-- 건너오는 모든 데이터를 UTF-8으로 받을 수 있도록 함 -->
<jsp:useBean id="otheruser" class="OtherUser.OtherUser" scope="page"/> <!-- 한명의 회원 정보를 담는 otheruser클래스를 자바 빈즈로 사용-->
<jsp:setProperty name="otheruser" property="phoneNumber"/>

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>My page</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"/>
    <link rel="stylesheet" href="CSS/style_mypage.css">
  </head>
  <body>
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Merriweather&display=swap');
    </style>
    <div>
      <div class="card">
        <img src=".\img\arrow.png" alt="no_img" onclick="toreservepage()">
        <img class="img-top" src=".\img\arrow_hover.png" alt="no_img" onclick="toreservepage()">
      </div>
      <Center><h1 class="mp">My Page</h1></Center>
      <div class="buttons">
        <Center><form method="post" action="manage.jsp">
        	<input type="text" name="phoneNumber" value="<%= otheruser.getPhoneNumber() %>" style="display:none;">
        	<button class="btn-1" type="submit" name="button" onclick="tomanagepage()"><h4>Manage reservation</h4></button>
        </form>
        <Center><button class="btn-1" type="button" name="button" onclick="tofeepage()"><h4>Charge fee</h4></button>
      </div>
  </div>
  </body>
   <script src="JS/index_mypage.js" type="text/javascript"></script>
</html>