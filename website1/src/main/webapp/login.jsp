<%-- this is a login page of our project --%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Login</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"/>
    <link rel="stylesheet" href="CSS/style_login1.css">
  </head>
  <body>
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Merriweather&display=swap');
    </style>
    <div>
      <div class="card"> <%-- going back button --%>
        <img src=".\img\arrow.png" alt="no_img" onclick="gotomainpage()">
        <img class="img-top" src=".\img\arrow_hover.png" alt="no_img" onclick="gotomainpage()"> <%-- check function in index_login.js --%>
      </div>
      <Center><form method="post" action="loginAction.jsp"> <%-- check validation of login action --%>
        <font size="6">Phone number:</font> <%-- enter user information --%>
        <input  id= "input1" type="text" name="phoneNumber"  value=""><br>
        <font size="6">Password        :</font>
        <input id="input2" type="password" name="userPassword" value="">
        <br>
        <button type="submit" class="btn-4" name="button" onclick="gotoreservepage()">Login</button>
        </form>
       </div>
  </body>
   <script src="JS/index_login.js" type="text/javascript"></script>
</html>
