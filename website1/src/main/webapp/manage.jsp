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
    <link rel="stylesheet" href="CSS/style_manage2.css">
  </head>
  <body>
  <% 
  OtherUserDAO otherUserDAO = new OtherUserDAO(); 
  otheruser = otherUserDAO.getOneUser(otheruser.getPhoneNumber());
  %>
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Merriweather&display=swap');
    </style>
    <div>
    <div>
    	<div class="card">
      	<form method="post" action="mypage.jsp">
      		<input type="text" name="phoneNumber"  value="<%= otheruser.getPhoneNumber() %>" style="display:none;">
      		<button type="submit" name="button" class="button_noback" onclick="tomypage()"><img class="img-down" src=".\img\arrow.png" alt="no_img" onclick="tomypage()"></button>
      		<button type="submit" name="button" class="button_noback" onclick="tomypage()"><img class="img-top" src=".\img\arrow_hover.png" alt="no_img" onclick="tomypage()"></button>
     	</form>
      </div>
      <div class="reload_layout">
      	<button type="button" name="button" onclick="window.location.reload()" class="btn-4 green_button">
        	reload page
      	</button>
      </div>
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
                  	<button type="button" name="button" id="extendTime">Extend</button>
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
    
    <!-- pop up -->
    <div class="reserve_popup_content popup" id="reserve_popup_content">
      <button type="button" class="close_btn close button_noback" aria-label="Closename">
        <span aria-hidden="true" class="close_btn">&times;</span>
      </button>
      <span class="reserve_popup_content_title">Extend time for <%=otheruser.getSeatId() %>th seat</span>
      <div class="reserve_popup_grid">
        <form action="./functions/extendSeatAction.jsp" method="post">
        	<input id="reserve_popup_content1_id" type="number" name="reserveSeatId" style="display:none;">
        	<input type="number" name="reserveSeatTimeNumber"  value="<%= 1 %>" style="display:none;">
        	<input type="text" name="userPhoneNumber"  value="<%= otheruser.getPhoneNumber() %>" style="display:none;">
        	<input type="number" name="userChargedFee"  value="<%= otheruser.getChargedFee() %>" style="display:none;">
        	<input type="number" name="neededFee"  value="<%= 1000 %>" style="display:none;">
        	<input type="text" name="seatEndTime"  value="<%= otheruser.getSeatEndTime().toString() %>" style="display:none;">
        	<button type="submit" name="button" onclick="reserve_seat_hours(1)">
          	<span>1 hours</span>
          	<span>1000won</span>
        	</button>
        </form>
        <form action="./functions/extendSeatAction.jsp" method="post">
        	<input id="reserve_popup_content2_id" type="number" name="reserveSeatId" style="display:none;">
        	<input type="number" name="reserveSeatTimeNumber"  value="<%= 2 %>" style="display:none;">
        	<input type="text" name="userPhoneNumber"  value="<%= otheruser.getPhoneNumber() %>" style="display:none;">
        	<input type="number" name="userChargedFee"  value="<%= otheruser.getChargedFee() %>" style="display:none;">
        	<input type="number" name="neededFee"  value="<%= 2000 %>" style="display:none;">
        	<input type="text" name="seatEndTime"  value="<%= otheruser.getSeatEndTime().toString() %>" style="display:none;">
        	<button type="submit" name="button" onclick="reserve_seat_hours(2)">
          	<span>2 hours</span>
          	<span>2000won</span>
        	</button>
        </form>
        <form action="./functions/extendSeatAction.jsp" method="post">
        	<input id="reserve_popup_content3_id" type="number" name="reserveSeatId" style="display:none;">
        	<input type="number" name="reserveSeatTimeNumber"  value="<%= 3 %>" style="display:none;">
        	<input type="text" name="userPhoneNumber"  value="<%= otheruser.getPhoneNumber() %>" style="display:none;">
        	<input type="number" name="userChargedFee"  value="<%= otheruser.getChargedFee() %>" style="display:none;">
        	<input type="number" name="neededFee"  value="<%= 3000 %>" style="display:none;">
        	<input type="text" name="seatEndTime"  value="<%= otheruser.getSeatEndTime().toString() %>" style="display:none;">
        	<button type="submit" name="button" onclick="reserve_seat_hours(3)">
          	<span>3 hours</span>
          	<span>3000won</span>
        	</button>
        </form>
        <form action="./functions/extendSeatAction.jsp" method="post">
        	<input id="reserve_popup_content4_id" type="number" name="reserveSeatId" style="display:none;">
        	<input type="number" name="reserveSeatTimeNumber"  value="<%= 4 %>" style="display:none;">
        	<input type="text" name="userPhoneNumber"  value="<%= otheruser.getPhoneNumber() %>" style="display:none;">
        	<input type="number" name="userChargedFee"  value="<%= otheruser.getChargedFee() %>" style="display:none;">
        	<input type="number" name="neededFee"  value="<%= 4000 %>" style="display:none;">
        	<input type="text" name="seatEndTime"  value="<%= otheruser.getSeatEndTime().toString() %>" style="display:none;">
        	<button type="submit" name="button" onclick="reserve_seat_hours(4)">
          	<span>4 hours</span>
          	<span>4000won</span>
        	</button>
        </form>
      </div>
      <button type="button" class="btn btn-secondary close_btn" id="close_btn"
      style="margin-right: 10px;">
        close
      </button>
    </div>
  </body>
   <script src="JS/index_manage.js" type="text/javascript"></script>
</html>