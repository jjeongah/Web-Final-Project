/*for manage.html page */
function gotomypage(){
  location.href = "mypage.html";
}
function gotomainpage(){
  location.href = "main.html";
}

let name_bool = false;
let pw_bool = false;
$("#input_num").on("propertychange change keyup paste input", function() {
  input = $(this).val();
  console.log(input);
  last_input = input.charCodeAt(input.length-1);
  //console.log(last_input);
  if(47<last_input && last_input<58){ /*only alphabet*/
    document.getElementById('icon_num').style.display = 'block';
    document.getElementById('alert_num').style.display = 'none';
    num_bool = true;
  }
  else if(input ==''){
    document.getElementById('alert_num').innerHTML ="Please enter your Account number"
    document.getElementById('alert_num').style.display = 'block';
    document.getElementById('icon_num').style.display = 'none';
    num_bool = false;
  }
  else{ /*invalid*/
    document.getElementById('alert_num').innerHTML ="Account number is invalid. Phone number only contains numbers."
    document.getElementById('alert_num').style.display = 'block';
    document.getElementById('icon_num').style.display = 'none';
    num_bool = false;
  }
});

$("#input_pw").on("propertychange change keyup paste input", function() {
  input = $(this).val();
  console.log(input);
  last_input = input.charCodeAt(input.length-1);
  //console.log(last_input);
  if(47<last_input && last_input<58){ /*only alphabet*/
    document.getElementById('icon_pw').style.display = 'block';
    document.getElementById('alert_pw').style.display = 'none';
    pw_bool = true;
  }
  else if(input ==''){
    document.getElementById('alert_pw').innerHTML ="Please enter your Account password"
    document.getElementById('alert_pw').style.display = 'block';
    document.getElementById('icon_pw').style.display = 'none';
    pw_bool = false;
  }
  else{ /*invalid*/
    document.getElementById('alert_pw').innerHTML ="Account password is invalid. Account password only contains numbers."
    document.getElementById('alert_pw').style.display = 'block';
    document.getElementById('icon_pw').style.display = 'none';
    pw_bool = false;
  }
});

/*functions for popup start*/
function show() {
  document.querySelector(".background").className = "background show";
}

function close() {
  document.querySelector(".background").className = "background";
}

//document.querySelector("#term1").addEventListener('click', show);
//document.querySelector("#close").addEventListener('click', close);

function success(){
  if(document.getElementById("input_num").value =='' && document.getElementById("input_pw").value !=''){
    alert("Please enter Account number!");
  }
  else if(document.getElementById("input_pw").value =='' && document.getElementById("input_num").value !=''){
    alert("Please enter Account password!");
  }
  else if(document.getElementById("input_pw").value =='' && document.getElementById("input_num").value ==''){
    alert("Please enter Account number and password!");
  }
  else{
    console.log("success");
  }

  if(num_bool == true && pw_bool == true){
    console.log("success!");
    document.querySelector(".background").className = "background show";
  }
}
