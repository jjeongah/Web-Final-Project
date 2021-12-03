/*for reserve.html page */
function logout(){
  location.href = "main.html";
}
function gotomypage(){
  location.href = "mypage.jsp";
}

const table_seat1 = document.querySelector('#seat1');
const table_seat2 = document.querySelector('#seat2');
const table_seat3 = document.querySelector('#seat3');
const table_seat4 = document.querySelector('#seat4');
const table_seat5 = document.querySelector('#seat5');
const table_locker1 = document.querySelector('#locker1');
const tab_seat = document.querySelector('#tab_seat');
const tab_locker = document.querySelector('#tab_locker');


function renderSeats(start_num, table_seat){
  table_seat.innerHTML = '';
  if(start_num<40){//2x5
    for(var row_num=0;row_num<5;row_num++){
      const tr = document.createElement('tr');
      for(var col_num=0;col_num<2;col_num++){
        const td = document.createElement('td');
        td.setAttribute('class', 'available');
        td.setAttribute('data-key', start_num+row_num*2+col_num);
        td.innerHTML = `${start_num+row_num*2+col_num}`;
        tr.append(td);
      }
      table_seat.append(tr);
    }
  }else{//10x1
    for(var row_num=0;row_num<1;row_num++){
      const tr = document.createElement('tr');
      for(var col_num=0;col_num<10;col_num++){
        const td = document.createElement('td');
        td.setAttribute('class', 'my');
        td.setAttribute('data-key', start_num+row_num*10+col_num);
        td.innerHTML = `${start_num+row_num*10+col_num}`;
        tr.append(td);
      }
      table_seat.append(tr);
    }
  }
}

function renderLockers(){
  table_locker1.innerHTML = '';
  for(var row_num=0;row_num<4;row_num++){
    const tr = document.createElement('tr');
    for(var col_num=0;col_num<5;col_num++){
      const td = document.createElement('td');
      td.setAttribute('class', 'available');
      // examples
      if(row_num==1 && col_num==1){
        td.setAttribute('class', 'my');
      }
      if(row_num==3 && col_num==4){
        td.setAttribute('class', 'occupied');
      }
      td.setAttribute('data-key', 1+row_num*5+col_num);
      td.innerHTML = `${1+ row_num*5+col_num}`;
      tr.append(td);
    }
    table_locker1.append(tr);
  }
}

// initialize seat content and locker content
//renderSeats(1, table_seat1);
//renderSeats(11, table_seat2);
//renderSeats(21, table_seat3);
//renderSeats(31, table_seat4);
//renderSeats(41, table_seat5);
//grey_background.hide();
$('.grey_background').hide();
$('#locker_content').hide();
$('#reserve_popup_content').hide();
$('#return_popup_content').hide();
$('#reserve_locker_popup_content').hide();
//renderLockers();

$('#tab_seat').click(function(){
  $('#tab_seat').addClass('clicked_tab');
  $('#tab_locker').removeClass('clicked_tab');
  $('#tab_seat_box').addClass('clicked_tab_box');
  $('#tab_locker_box').removeClass('clicked_tab_box');
  $('#seat_content').fadeIn(300);
  $('#locker_content').hide();
});

$('#tab_locker').click(function(){
  $('#tab_locker').addClass('clicked_tab');
  $('#tab_seat').removeClass('clicked_tab');
  $('#tab_locker_box').addClass('clicked_tab_box');
  $('#tab_seat_box').removeClass('clicked_tab_box');
  $('#locker_content').fadeIn(300);
  $('#seat_content').hide();
});

// pop up
function showPopup(content_name, seat_num, todo, type){
  //todo: "Reserve" or "Return"
  //type: "seat" or "locker"
  $('.grey_background').show();
  $('#'+content_name).show();
  if(seat_num != null){
    document.querySelector('.'+content_name+'_title').innerHTML = `${todo} ${seat_num}th ${type}`;
	console.log(seat_num);
	if(content_name=='reserve_popup_content'){//click available seat
		document.getElementById(content_name+'2_id').value = seat_num;
	}else if(content_name=='reserve_locker_popup_content'){//click available locker
		document.getElementById(content_name+'_id').value = seat_num;
	}
	if(todo=="Return" && type=="seat"){
		document.getElementById(content_name+'_title_form').action = "./functions/returnSeatAction.jsp";
	}else if(todo=="Return" && type=="locker"){
		document.getElementById(content_name+'_title_form').action = "./functions/returnLockerAction.jsp";
	}
  }
}

function hidePopup(content_name){
  $('.grey_background').hide();
  $('#'+content_name).hide();
}

//close popup
document.querySelector('#reserve_popup_content').addEventListener('click', function(event) {
  if (event.target.classList.contains('close_btn')) {
    hidePopup('reserve_popup_content');
  }
});

document.querySelector('#return_popup_content').addEventListener('click', function(event) {
  if (event.target.classList.contains('close_btn')) {
    hidePopup('return_popup_content');
  } else if (event.target.classList.contains('return_btn')) {
    //return seat
    console.log("return_btn");
    hidePopup('return_popup_content');
  }
});

document.querySelector('#reserve_locker_popup_content').addEventListener('click', function(event) {
  if (event.target.classList.contains('close_btn')) {
    hidePopup('reserve_locker_popup_content');
  } else if (event.target.classList.contains('return_btn')) {
    //return locker
    console.log("return_btn");
    hidePopup('reserve_locker_popup_content');
  }
});

//click seat
document.querySelector('#seat_content').addEventListener('click', function(event) {
  if (event.target.classList.contains('available')) {
    showPopup('reserve_popup_content', event.target.getAttribute('data-key'), "Reserve","seat");
  } else if (event.target.classList.contains('my')) {
    showPopup('return_popup_content', event.target.getAttribute('data-key'), "Return", "seat");
  }else if (event.target.classList.contains('occupied')) {

  }
});

//click locker
document.querySelector('#locker_content').addEventListener('click', function(event) {
  if (event.target.classList.contains('available')) {
    showPopup('reserve_locker_popup_content', event.target.getAttribute('data-key'), "Reserve","locker");
  } else if (event.target.classList.contains('my')) {
    showPopup('return_popup_content', event.target.getAttribute('data-key'), "Return", "locker");
  }else if (event.target.classList.contains('occupied')) {

  }
});

//reserve ##hours
function reserve_seat_hours(hours){
  console.log(hours);
hidePopup('reserve_popup_content');
}


var user_phone_num;
//local storage로부터 가져오기
function getFromLocalStorage() {
  const reference = localStorage.getItem('phone_num');
  // if reference exists
  if (reference) {
    // converts back to array and store it in todos array
    user_phone_num = reference;
	console.log(user_phone_num);
  }
 	return user_phone_num;
}

getFromLocalStorage();