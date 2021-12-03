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
    <title></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"/>
    <link rel="stylesheet" href="CSS/style_manage.css">
  </head>
  <body>
  <% 
  if(otheruser.getPhoneNumber()==""){
	  System.out.println("null");
  }
  OtherUserDAO otherUserDAO = new OtherUserDAO(); 
  otheruser = otherUserDAO.getOneUser(otheruser.getPhoneNumber());
  System.out.println("kiki"+otheruser.getPhoneNumber());%>
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Merriweather&display=swap');
    </style>
    <div>
      <div class="card">
      	<%-- <form method="post" action="mypage.jsp">
      		<input type="text" name="phoneNumber"  value="<%= otheruser.getPhoneNumber() %>" style="display:none;">
      		<button type="submit" name="button" class="button_noback" onclick="tomypage()"><img src=".\img\arrow.png" alt="no_img" onclick="tomypage()"></button>
      		<button type="submit" name="button" class="button_noback" onclick="tomypage()"><img class="img-top" src=".\img\arrow_hover.png" alt="no_img" onclick="tomypage()"></button>
     	</form> --%>
        <img src=".\img\arrow.png" alt="no_img" onclick="tomypage()">
        <img class="img-top" src=".\img\arrow_hover.png" alt="no_img" onclick="tomypage()">
      </div>
      <center>
      <div class="container">
        <h4>Reservation Information</h4><br><br>
        <div>
          <h5>Seat</h5>
          <%if(otheruser.checkValidSeat()==true){ %>
          <div class="tb_container">
            <div class="table_container">
              <table class="personal">
                <tr>
                  <td style="background-color:#dff7cd;">Seat Number</td>
                  <td style="background-color:#dff7cd;">Date</td>
                  <td style="background-color:#dff7cd;">Start time</td>
                  <td style="background-color:#dff7cd;">End time</td>
                </tr>
                <tr>
                  <td><%= otheruser.getSeatId() %></td>
                  <td><%= otheruser.getSeatStartTime().getMonth() %>/<%= otheruser.getSeatStartTime().getDate() %></td>
                  <td><%= otheruser.getSeatStartTime().getHours() %>:<%= otheruser.getSeatStartTime().getMinutes() %></td>
                  <td><%= otheruser.getSeatEndTime().getHours() %>:<%= otheruser.getSeatEndTime().getMinutes() %></td>
                  <td class="nocolor">
                  	<form action="./functions/returnSeatAction.jsp" method="post">
                  		<input type="text" name="userPhoneNumber"  value="<%= otheruser.getPhoneNumber() %>" style="display:none;">
                  		<button type="submit" name="button">Return Seat</button>
                  	</form>
                  	<button type="button" name="button">Extend</button>
                  </td>
                </tr>
              </table>
            </div>
          </div>
          <%} else{%>
          <h6>You don't reserve seat.</h6>
          <% }%>
        </div><!--first table!-->
        <div>
          <br><h5>Locker</h5>
          <%
          if(otheruser.checkValidLocker()==true){ %>
          <div class="tb_container">
            <div class="table_container">
              <table class="personal">
                <tr>
                  <td style="background-color:#dff7cd;">Locker Number</td>
                </tr>
                <tr>
                  <td><%= otheruser.getLockerId() %></td>
                  <td class="nocolor">
                  	<form action="./functions/returnLockerAction.jsp" method="post">
                  		<input type="text" name="userPhoneNumber"  value="<%= otheruser.getPhoneNumber() %>" style="display:none;">
                  		<button type="submit" name="button">Return Locker</button>
                  	</form>
                  </td>
                </tr>
              </table>
            </div>
          </div>
          <%} else{%>
          <h6>You don't reserve locker.</h6>
          <% }%>
        </div><!--second table!-->
      </div>
      </center>
    </div>
  </body>
   <script src="JS/index_manage.js" type="text/javascript"></script>
</html>