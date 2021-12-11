<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="reserve.*" %>
<%@ page import="OtherUser.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
	<title>Reserve</title>
	<meta charset="utf-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="CSS/style_reserve2.css">

</head>
<body>

	<script>
	
	</script>
	<%
		//from session, get phone_number of the person who is log in
		String my_phone_number = (String)session.getAttribute("phone_number");
		if(my_phone_number==null){
			//it is not login state
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Please log in first.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
	%>
	<%
		//make otherUserDAO and reserve object
		OtherUserDAO otherUserDAO = new OtherUserDAO();
		List<OtherUser> list = otherUserDAO.getAllUsers();
		Reserve reserve = new Reserve(list, my_phone_number);
	%>
	<%
		//if user currently reserve seat, make "is_user_reserve_seat value true
		if( reserve.getMyInfo().checkValidSeat()==true ){
			session.setAttribute("is_user_reserve_seat",true);
		}
		//if user currently reserve locker, make "is_user_reserve_locker value true
		if( reserve.getMyInfo().checkValidLocker()==true ){
			session.setAttribute("is_user_reserve_locker",true);
		}
	%>
	<!-- to use these value in javascript file, use hidden input  -->
	<input id='is_user_reserve_seat' type="hidden" value=<%=session.getAttribute("is_user_reserve_seat") %> />
	<input id='is_user_reserve_locker' type="hidden" value=<%=session.getAttribute("is_user_reserve_locker") %> />
	
	
	<!-- grey background when popup show -->
    <div class="grey_background">empty</div>
    
    <!-- header -->
    <div class="header">
      <form method="post" action="./functions/logoutAction.jsp" class="btn-4 green_button">
        <button type="submit" name="button" onclick="logout()"
        class="simple_button">logout</button>
      </form>
      <button type="button" name="button" onclick="window.location.reload()" class="btn-4 green_button">
        reload page
      </button>
      <form method="post" action="mypage.jsp" class="btn-4 green_button">
      	<input type="text" name="phoneNumber"  value="<%= my_phone_number %>" style="display:none;">
        <button type="submit" name="button" onclick="gotomypage()"
        class="simple_button">my page</button>
      </form>
    </div>

    <!-- tab -->
    <div class="tab">
      <div id="tab_seat" class="tab_seat clicked_tab">
        <h3>Seat</h3>
        <h5><%= reserve.getNumOfSeats() %>/50</h5>
        <div class="empty clicked_tab_box" id="tab_seat_box">empty</div>
      </div>
      <div id="tab_locker" class="tab_locker">
        <h3>Locker</h3>
        <h5><%= reserve.getNumOfLockers() %>/20</h5>
        <div class="empty" id="tab_locker_box">empty</div>
      </div>
    </div>

    <!-- seat content -->
    <div class="seat_content" id="seat_content">
      <div class="seat_content_1">
        <div class="seat_col1">
          <table id="seat1">
          <%
        //render seats with classification my, available, occupied seats
          for(int row_num=0;row_num<5;row_num++){
        	%>
          		<tr>
          	<%
        	  for(int col_num=0;col_num<2;col_num++){
        	  if(reserve.reserveSeats.contains(1+row_num*2+col_num)){
        		  if(reserve.getMyInfo().getSeatId()==1+row_num*2+col_num){
        			  %>
        			 <td class="my" data-key="<%=1+row_num*2+col_num %>">
        	 			<%=1+row_num*2+col_num %>
        	 		</td>
        			  <%
        		  }else{
        	 %>
        	 		<td class="occupied" data-key="<%=1+row_num*2+col_num %>">
        	 			<%=1+row_num*2+col_num %>
        	 		</td>
        	 <%
        	 }
        	  }else{
        		%>
        		<td class="available" data-key="<%=1+row_num*2+col_num %>">
    
        			<%=1+row_num*2+col_num %>
        	 	</td>
        		<%
        	  	}
    	      }
        	%>
        		</tr>
        	<%
    	    }
          %>
          </table>
        </div>
        <div class="seat_col2">
          <table id="seat2">
          	<%
          for(int row_num=0;row_num<5;row_num++){
        	%>
    		  <tr>
    		<%
        	  for(int col_num=0;col_num<2;col_num++){
        	  if(reserve.reserveSeats.contains(11+row_num*2+col_num)){
        		  if(reserve.getMyInfo().getSeatId()==11+row_num*2+col_num){
        	 %>
        			 <td class="my" data-key="<%=11+row_num*2+col_num %>">
        	 			<%=11+row_num*2+col_num %>
        	 		</td>
        			  <%
        			  }
        		  else{
        	 %>
        	 		<td class="occupied" data-key="<%=11+row_num*2+col_num %>">
        	 			<%=11+row_num*2+col_num %>
        	 		</td>
        	 <%
        		  }
        	  }else{
        		%>
        		   <td class="available" data-key="<%=11+row_num*2+col_num %>">
        	 			<%=11+row_num*2+col_num %>
        	 		</td>
        		<%
        	  	}
    	      }
        	%>
        	  </tr>
        	<%
    	    }
          %>
          </table>
        </div>
        <div class="seat_col3">
          <table id="seat3">
          	<%
          for(int row_num=0;row_num<5;row_num++){
        	 %>
      			<tr>
      		<%
        	  for(int col_num=0;col_num<2;col_num++){
        	  if(reserve.reserveSeats.contains(21+row_num*2+col_num)){
        	 if(reserve.getMyInfo().getSeatId()==21+row_num*2+col_num){
        	 %>
        			  <td class="my" data-key="<%=21+row_num*2+col_num %>">
        	 			<%=21+row_num*2+col_num %>
        	 		</td>
        			  <%
        			  }
        		  else{
        	 %>
        	 		<td class="occupied" data-key="<%=21+row_num*2+col_num %>">
        	 			<%=21+row_num*2+col_num %>
        	 		</td>
        	 <%
        		  }}else{
        		%>
        		   <td class="available" data-key="<%=21+row_num*2+col_num %>">
        	 			<%=21+row_num*2+col_num %>
        	 		</td>
        		<%
        	  	}
    	      }
      		%>
	  			</tr>
	 	 	<%
    	    }
          %>
          </table>
        </div>
        <div class="seat_col4">
          <table id="seat4">
          	<%
          for(int row_num=0;row_num<5;row_num++){
        	 %>
      			<tr>
      		<%
        	  for(int col_num=0;col_num<2;col_num++){
        	  if(reserve.reserveSeats.contains(31+row_num*2+col_num)){
        		  if(reserve.getMyInfo().getSeatId()==31+row_num*2+col_num){
        	        	 %>
        	        			<td class="my" data-key="<%=31+row_num*2+col_num %>">
        	        			  <%=31+row_num*2+col_num %>
        	        	 		</td>
        	        			  <%
        	        			  }
        	        		  else{
        	        	 %>
        	        	 		<td class="occupied" data-key="<%=31+row_num*2+col_num %>">
        	        	 			<%=31+row_num*2+col_num %>
        	        	 		</td>
        	        	 <%
        	        		  }
        	  }else{
        		%>
        		   <td class="available" data-key="<%=31+row_num*2+col_num %>">
        	 			<%=31+row_num*2+col_num %>
        	 		</td>
        		<%
        	  	}
    	      }
      		%>
	  			</tr>
	 	 	<%
    	    }
          %>
          </table>
        </div>
      </div>
      <div class="seat_content_2">
        <div class="door"></div>
        <table id="seat5">
        	<%
          for(int row_num=0;row_num<1;row_num++){
        	 %>
      			<tr>
      		<%
        	  for(int col_num=0;col_num<10;col_num++){
        	  if(reserve.reserveSeats.contains(41+col_num)){
        	 if(reserve.getMyInfo().getSeatId()==41+row_num*2+col_num){
        	 %>
        			  <td class="my" data-key="<%=41+col_num %>">
        	 			<%=41+col_num %>
        	 		</td>
        			  <%
        			  }
        		  else{
        	 %>
        	 		<td class="occupied" data-key="<%=41+col_num %>">
        	 			<%=41+col_num %>
        	 		</td>
        	 <%
        		  }
        	  }else{
        		%>
        		   <td class="available" data-key="<%=41+col_num %>">
        	 			<%=41+col_num %>
        	 		</td>
        		<%
        	  	}
    	      }
      		%>
	  			</tr>
	 	 	<%
    	    }
          %>
        </table>
      </div>

      <div class="seat_info">
      <!-- seat information widget  -->
        <div>
          <div></div>
          <span>available</span>
        </div>
        <div>
          <div></div>
          <span>occupied</span>
        </div>
        <div>
          <div></div>
          <span>my seat</span>
        </div>
      </div>
    </div>
    
    <!-- locker_content -->
    <div class="locker_content" id="locker_content">
      <div class="">
        <table id="locker1">
        	<%
        	//render lockers with classification my, available, occupied lockers
          for(int row_num=0;row_num<4;row_num++){
        	%>
    		  <tr>
    		<%
        	  for(int col_num=0;col_num<5;col_num++){
        	  if(reserve.reserveLockers.contains(1+row_num*5+col_num)){
        		  if(reserve.getMyInfo().getLockerId()==1+row_num*5+col_num){
        	 %>
        			 <td class="my" data-key="<%=1+row_num*5+col_num %>">
        	 			
        	 			<%=1+row_num*5+col_num %>
        	 		</td>
        			  <%
        			  }
        		  else{
        	 %>
        	 		<td class="occupied" data-key="<%=1+row_num*5+col_num %>">
        	 			<%=1+row_num*5+col_num %>
        	 		</td>
        	 <%
        		  }
        	  }else{
        		%>
        		   <td class="available" data-key="<%=1+row_num*5+col_num %>">
        	 			<%=1+row_num*5+col_num %>
        	 		</td>
        		<%
        	  	}
    	      }
        	%>
        	  </tr>
        	<%
    	    }
          %>
        </table>
      </div>

      <div class="locker_info">
      <!-- locker information widget  -->
        <div>
          <div></div>
          <span>available</span>
        </div>
        <div>
          <div></div>
          <span>occupied</span>
        </div>
        <div>
          <div></div>
          <span>my locker</span>
        </div>
      </div>
    </div>


    <!-- pop up -->
    <div class="reserve_popup_content popup" id="reserve_popup_content">
      <button type="button" class="close_btn close" aria-label="Closename">
        <span aria-hidden="true" class="close_btn">&times;</span>
      </button>
      <span class="reserve_popup_content_title">Reserve 10th seat</span>
      <div class="reserve_popup_grid">
        <form action="./functions/reserveSeatAction.jsp" method="post">
        <!-- to deliver information of reserving seat, use hidden input -->
        <!-- if click reserve button, go to reserveSeatAction.jsp -->
        	<input id="reserve_popup_content2_id" type="number" name="reserveSeatId" style="display:none;">
        	<input type="number" name="reserveSeatTimeNumber"  value="<%= 2 %>" style="display:none;">
        	<input type="text" name="userPhoneNumber"  value="<%= reserve.getMyInfo().getPhoneNumber() %>" style="display:none;">
        	<input type="number" name="userChargedFee"  value="<%= reserve.getMyInfo().getChargedFee() %>" style="display:none;">
        	<input type="number" name="neededFee"  value="<%= 3000 %>" style="display:none;">
        	<button type="submit" name="button" onclick="reserve_seat_hours(2)">
          	<span>2 hours</span>
          	<span>3000won</span>
        	</button>
        </form>
        <form action="./functions/reserveSeatAction.jsp" method="post">
        	<input id="reserve_popup_content3_id" type="number" name="reserveSeatId" style="display:none;">
        	<input type="number" name="reserveSeatTimeNumber"  value="<%= 3 %>" style="display:none;">
        	<input type="text" name="userPhoneNumber"  value="<%= reserve.getMyInfo().getPhoneNumber() %>" style="display:none;">
        	<input type="number" name="userChargedFee"  value="<%= reserve.getMyInfo().getChargedFee() %>" style="display:none;">
        	<input type="number" name="neededFee"  value="<%= 4000 %>" style="display:none;">
        	<button type="submit" name="button" onclick="reserve_seat_hours(3)">
          	<span>3 hours</span>
          	<span>4000won</span>
        	</button>
        </form>
        <form action="./functions/reserveSeatAction.jsp" method="post">
        	<input id="reserve_popup_content4_id" type="number" name="reserveSeatId" style="display:none;">
        	<input type="number" name="reserveSeatTimeNumber"  value="<%= 4 %>" style="display:none;">
        	<input type="text" name="userPhoneNumber"  value="<%= reserve.getMyInfo().getPhoneNumber() %>" style="display:none;">
        	<input type="number" name="userChargedFee"  value="<%= reserve.getMyInfo().getChargedFee() %>" style="display:none;">
        	<input type="number" name="neededFee"  value="<%= 5000 %>" style="display:none;">
        	<button type="submit" name="button" onclick="reserve_seat_hours(4)">
          	<span>4 hours</span>
          	<span>5000won</span>
        	</button>
        </form>
        <form action="./functions/reserveSeatAction.jsp" method="post">
        	<input id="reserve_popup_content5_id" type="number" name="reserveSeatId" style="display:none;">
        	<input type="number" name="reserveSeatTimeNumber"  value="<%= 5 %>" style="display:none;">
        	<input type="text" name="userPhoneNumber"  value="<%= reserve.getMyInfo().getPhoneNumber() %>" style="display:none;">
        	<input type="number" name="userChargedFee"  value="<%= reserve.getMyInfo().getChargedFee() %>" style="display:none;">
        	<input type="number" name="neededFee"  value="<%= 6000 %>" style="display:none;">
        	<button type="submit" name="button" onclick="reserve_seat_hours(5)">
          	<span>5 hours</span>
          	<span>6000won</span>
        	</button>
        </form>
      </div>
      <button type="button" class="btn btn-secondary close_btn" id="close_btn"
      style="margin-right: 10px;">
        close
      </button>
    </div>


    <div class="return_popup_content popup" id="return_popup_content">
      <button type="button" class="close_btn close" aria-label="Closename">
        <span aria-hidden="true" class="close_btn">&times;</span>
      </button>
      <span class="return_popup_content_title">Return 10th seat</span>
      <div class="popup_grid">
      	<form action="./functions/returnSeatAction.jsp" method="post" id="return_popup_content_title_form">
      	<!-- if click return button, go to returnSeatAction.jsp or returnLockerAction.jsp -->
             <input type="text" name="userPhoneNumber"  value="<%= reserve.getMyInfo().getPhoneNumber() %>" style="display:none;">
             <button type="submit" class="btn btn-primary return_btn">return</button>
        </form>
        <button type="button" class="btn btn-secondary close_btn" id="reserve_close_btn">
          close
        </button>
      </div>
    </div>


    <div class="reserve_locker_popup_content popup" id="reserve_locker_popup_content">
      <button type="button" class="close_btn close" aria-label="Closename">
        <span aria-hidden="true" class="close_btn">&times;</span>
      </button>
      <span class="reserve_locker_popup_content_title">Reserve 10th locker</span>
      <div class="popup_grid">
      	<form action="./functions/reserveLockerAction.jsp" method="post">
      	<!-- if click reserve button, go to reserveLockerAction.jsp -->
      		<input type="text" name="userPhoneNumber"  value="<%= reserve.getMyInfo().getPhoneNumber() %>" style="display:none;">
        	<input id="reserve_locker_popup_content_id" type="number" name="reserveLockerId" style="display:none;">
        	<button type="submit" class="btn btn-primary return_btn">reserve</button>
        </form>
        <button type="button" class="btn btn-secondary close_btn" id="reserve_close_btn">
          close
        </button>
      </div>
    </div>


    <!-- JS -->
    <script src="JS/index_reserve2.js" type="text/javascript"></script>

</body>
</html>