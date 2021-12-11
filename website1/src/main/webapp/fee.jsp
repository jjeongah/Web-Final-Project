<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="OtherUser.OtherUserDAO" %>
<%@ page import="java.io.PrintWriter" %> <!-- to write javascript sentence -->
<% request.setCharacterEncoding("UTF-8"); %> <!-- receive all data UTF-8 -->
<jsp:useBean id="currentuser" class="OtherUser.OtherUser" scope="page"/> <!-- use java bean to use otheruser object-->
<jsp:setProperty name="currentuser" property="phoneNumber"/>

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Charge fee</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"/>
    <link rel="stylesheet" href="CSS/style_fee3.css">
  </head>
  <body>
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Merriweather&display=swap');
    </style>
	
	<% 
		//from session, get phone_number of the person who is log in
		if(currentuser.getPhoneNumber()==null){
			String my_phone_number = (String)session.getAttribute("phone_number");
			if(my_phone_number==null){
				//it is not login state
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('Please log in first.')");
				script.println("location.href = 'main.jsp'");
				script.println("</script>");
			}
			currentuser.setPhoneNumber(my_phone_number);
		}
  		OtherUserDAO currentUserDAO = new OtherUserDAO(); 
  		currentuser = currentUserDAO.getOneUser(currentuser.getPhoneNumber());
 	 %>
    <div class="background">
      <div class="window">
        <div class="popup">
          <button id="close" class="btn btn-light">X</button>
            <Center>
              <div class="service" style="font-size: 20px;">
                Charge is successfully payed!
              </div>
              <div class="success_con"><br><br><br><br>
                <button cclass="btn-4" id="success" type="button" name="button" onclick ="gotomypage()">Return to my page</button>
                <button cclass="btn-4" id="success" type="button" name="button" onclick ="gotomainpage()">Logout</button>
              </div>
          </div><!--popup!-->
      </div><!--window!-->
    </div><!--background!-->

    <div>
      <div class="card">
      	<form method="post" action="mypage.jsp">
      		<input type="text" name="phoneNumber"  value="<%= currentuser.getPhoneNumber() %>" style="display:none;">
      		<button type="submit" name="button" class="button_noback" onclick="gotomypage()"><img class="img-down" src=".\img\arrow.png" alt="no_img" onclick="gotomypage()"></button>
      		<button type="submit" name="button" class="button_noback img-top" onclick="gotomypage()"><img class="img-top" src=".\img\arrow_hover.png" alt="no_img" onclick="gotomypage()"></button>
     	</form>
      </div>
      <div class="reload_layout">
      	<button type="button" name="button" onclick="window.location.reload()" class="btn-4 green_button">
        	reload page
      	</button>
      </div>
      <div class="current_layout">
      	<h5>Current fee: </h5><h3 style="color: #719e44"><%=currentuser.getChargedFee()%> won</h3>
      </div>
      
      <br>
      <div class="container">
        <Center><h3>Charge Fee</h3></Center><br><br>
        <form action="./functions/chargeFeeAction.jsp" method="post">
        <!-- if click charge button, go to chargeFeeAction.jsp  -->
          Bank:&nbsp&nbsp&nbsp&nbsp&nbsp
          <select class="bank" name="">
            <option value="Hana">Hana bank</option>
            <option value="KB">KB Kookmin bank</option>
            <option value="Woori">Woori bank</option>
            <option value="Kakao">Kakao bank</option>
            <option value="Shinhan">Shinhan bank</option>
            <option value="Toss">Toss bank</option>
          </select><br><br>
          <div class="form_con">
            Account number:
            <input id= "input_num" type="text" value=""><i id="icon_num" class="bi bi-check-circle-fill"></i><br>
          </div>
          <div class="alert_num" id="alert_num">Number is invalid</div>
          <div class="form_con">
            Account Password:
            <input id= "input_pw" type="password" value=""><i id="icon_pw" class="bi bi-check-circle-fill"></i><br>
          </div>
          <div class="alert_pw" id="alert_pw">Password is invalid</div><br>
          Choose an amount to recharge:
          <select class="cost" name="userChargedFee">
          	<option value=1000>1000won</option>
          	<option value=2000>2000won</option>
            <option value=3000>3000won(2 hours)</option>
            <option value=4000>4000won(3 hours)</option>
            <option value=5000>5000won(4 hours)</option>
            <option value=6000>6000won(5 hours)</option>
            <option value=7000>7000won</option>
            <option value=8000>8000won</option>
            <option value=9000>9000won</option>
            <option value=10000>10000won</option>
          </select><br><br>
          <input type="text" name=userPhoneNumber value="<%= currentuser.getPhoneNumber() %>" style="display:none;">
          <button class="btn-4" type="submit" name="button" onclick="success()" style="align-self: flex-start; width: 120px;">Charge Fee</button>
        </form>
      </div>
   </div>
  </body>
   <script src="JS/index_fee.js" type="text/javascript"></script>
</html>