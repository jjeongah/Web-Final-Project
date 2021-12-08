/*for manage.html page */
function tomypage(){
  location.href = "mypage.jsp";
}

$('.grey_background').hide();
$('#reserve_popup_content').hide();

// pop up
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


//click extend button
if(document.querySelector('#extendTime')!=null){
	document.querySelector('#extendTime').addEventListener('click', function(event) {
		//show popup
		$('.grey_background').show();
		$('#reserve_popup_content').show();
	});
}

//extend ##hours
function reserve_seat_hours(hours){
  console.log(hours);
	hidePopup('reserve_popup_content');
}