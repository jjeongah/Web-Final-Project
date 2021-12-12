<%-- this is a join page of our project --%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Join</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"/>
    <link rel="stylesheet" href="CSS/style_join1.css">
  </head>
  <body>
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Merriweather&display=swap');
    </style>
    <div class="background">
      <div class="window">
        <div class="popup">
          <button id="close" class="btn btn-light ">X</button>
            <Center>
              <div class="service" style="font-size: 10px;"><%-- this is a pop up window for the consenst term--%>
                Article 1 (Purpose)<br>
                The purpose of these terms and conditions is to stipulate rights, obligations and responsibilities between the company and users in relation to the use of digital contents (hereinafter referred to as "contents") and other services provided by the company online. to do.
                <br><br> Article 3 (Provision of identity information, etc.) <br>
                The "Company" shall include the contents of these terms and conditions, trade name, representative name, business address (including the address where consumer complaints can be handled), phone number, facsimile number, E-mail address, business registration number, mail-order business report number, and the person in charge of personal information management are posted on the initial screen of the online service so that users can easily find out. However, the terms and conditions can be viewed by the user through the connection screen.
                <br><br>Article 4 (Publication of Terms and Conditions, etc.)
                <br> (1) "Company" takes technical measures so that "members" can print all of these terms and conditions and check the contents of the terms and conditions during the transaction.
иш "Company" installs technical devices so that "Users" can ask and answer questions about "Company" and the contents of these Terms and Conditions.
              </div>
              <div class="success_con"><br><br><br><br>
                <button cclass="btn-4" id="success" type="button" name="button" onclick ="gotomainpage()">Please Login now</button>
              </div>
          </div><!--popup!-->
      </div><!--window!-->
    </div><!--background!-->


    <div>
      <div class="card"> <%-- All pages have this card class to go to previous page--%>
        <img src=".\img\arrow.png" alt="no_img" onclick="gotomainpage()">
        <img class="img-top" src=".\img\arrow_hover.png" alt="no_img" onclick="gotomainpage()"> <%-- go to previous page--%>
      </div>
      <Center><form method="post" action="joinAction.jsp"> <%-- this is forms for information input --%>
        <div class="form_con">
          <font size="5">User name:</font>
          <input name="userName" id= "input_name" type="text" value=""><i id="icon_name" class="bi bi-check-circle-fill"></i><br>
        </div>
        <div class="alert_name" id="alert_name">Name is invalid</div><br>
        <div class="form_con">
          <font size="5">Phone number:</font>
          <input name="phoneNumber" id= "input_num" type="text" value=""><i id="icon_num" class="bi bi-check-circle-fill"></i><br>
        </div>
        <div class="alert_num" id="alert_num">Number is invalid</div><br>
        <div class="form_con">
          <font size="5">Password:</font>
          <input name="userPassword" id= "input_pw" type="password" value=""><i id="icon_pw" class="bi bi-check-circle-fill"></i><br>
        </div>
       <div class="alert_pw" id="alert_pw">Requirement: at least 6 char, 1 capital letter, 1 lowercase letter, at least 1 digit and 1 special character!</div>
        <br>
        <div class="form_con">
          <font size="5">Password re-enter:</font>
          <input id= "input_repw" type="password" value=""><i id="icon_repw" class="bi bi-check-circle-fill"></i><br>
        </div>
        <div class="alert_repw" id="alert_repw">Password does not match</div><br>
      <div class="container">  <%-- this is consent for using service--%>
        <input type="checkbox" id="agree" name="aggree">
        <label for="agree">Consent to use of service</label>
        <h6 id="term1"> View Terms </h6>
      </div>
      <div class="container">
        <input type="checkbox" id="agree2" name="aggree2">
        <label for="agree2">Consent to use information</label>
        <h6 id="term2"> View Terms </h6>
      </div>
      <button type="submit" id="createbtn" class="btn-4" name="button" onclick="success()">Create new account</button>
    </form>
    </div>
  </body>
   <script src="JS/index_join1.js" type="text/javascript"></script>
</html>
