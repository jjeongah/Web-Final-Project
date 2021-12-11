/*for join.html page */
function gotomainpage(){
  location.href = "main.jsp";
}
/*functions for popup start*/
function show() {
  document.querySelector(".background").className = "background show";
}

function close() {
  document.querySelector(".background").className = "background";
}

document.querySelector("#term1").addEventListener('click', show);
document.querySelector("#close").addEventListener('click', close);

let article="Article 13 (Publication of contents, etc. of \"Content\") <br> (1) \"Company\" displays the following items on the initial screen of the \"Content\" or its packaging so that \"Users\" can understand it.\" <br> (2) \"Company\" provides \"users\" with information on available devices for each \"content\" and minimum technical specifications required for use in the contract signing process. <br><br>Article 14 (Establishment of the contract of use, etc.)<br> (1) The \"user\" applies for use through the following or similar procedures provided by the \"company\". The \"Company\" provides information so that the \"User\" can accurately understand and transact without mistakes or errors in each subparagraph before the conclusion of the contract. <br><br>Article 16 (Notification of Receipt Acknowledgment, Change and Cancellation of Application for Use) <br>(1) The \"Company\" notifies the \"User\" of the acknowledgment when there is an application for use by the \"User\".";


$("#term2").click(function(){
  console.log("term2 clicked");
  document.querySelector(".service").innerHTML = article;
  document.querySelector(".background").className = "background show";
});

function success(){
  if(document.getElementById("input_name").value =='' && document.getElementById("input_num").value !=''&& document.getElementById("input_pw").value !=''){
    alert("Please enter your name!");
  }
  else if(document.getElementById("input_num").value =='' && document.getElementById("input_name").value !=''&& document.getElementById("input_pw").value !=''){
    alert("Please enter your phone number!");
  }
  else if(document.getElementById("input_pw").value =='' && document.getElementById("input_name").value !='' && document.getElementById("input_num").value !=''){
    alert("Please enter your password!");
  }
  else if(document.getElementById("input_name").value =='' && document.getElementById("input_num").value ==''&& document.getElementById("input_pw").value !=''){
    alert("Please enter your name and phone number!");
  }
  else if(document.getElementById("input_num").value =='' && document.getElementById("input_name").value !=''&& document.getElementById("input_pw").value ==''){
    alert("Please enter your phone number and password!");
  }
  else if(document.getElementById("input_pw").value =='' && document.getElementById("input_name").value =='' && document.getElementById("input_num").value !=''){
    alert("Please enter your name and password!");
  }
  else if(document.getElementById("input_pw").value =='' && document.getElementById("input_name").value =='' && document.getElementById("input_num").value ==''){
    alert("Please enter your name, password, phone number!");
  }
  else{
    console.log("success");
  }

  if(!$('#agree').is(':checked') && $('#agree2').is(':checked')){
    alert("Please consent to use of service!");
  }
  else if(!$('#agree2').is(':checked') && $('#agree').is(':checked')){
    alert("Please consent to use of information!");
  }
  else if(!$('#agree2').is(':checked') && !$('#agree').is(':checked')){
    alert("Please consent to use of service and information!");
  }

  let success_ment ="<h1>You have successfully created an account</h1>";
  if(name_bool == true && num_bool == true && pw_bool == true && repw_bool == true && $('#agree').is(':checked') &&$('#agree2').is(':checked') ){
    console.log("success!");
    document.querySelector(".service").innerHTML = success_ment;
    document.querySelector(".background").className = "background show";
    document.getElementById('success').style.display = 'block';
  }
}

let last_input;
let name_bool = false;
let num_bool = false;
let pw_bool = false;
let repw_bool = false;

/*check entered value is null*/
$("#input_name").on("propertychange change keyup paste input", function() {
  input = $(this).val();
  last_input = input.charCodeAt(input.length-1);
  console.log(last_input);
  if((64<last_input && last_input<91)||(96<last_input && last_input <123)){ /*only alphabet*/
    document.getElementById('icon_name').style.display = 'block';
    document.getElementById('alert_name').style.display = 'none';
    name_bool = true;
  }
  else if(input ==''){
    document.getElementById('alert_name').innerHTML ="Please enter your name"
    document.getElementById('alert_name').style.display = 'block';
    document.getElementById('icon_name').style.display = 'none';
    name_bool = false;
  }
  else{ /*invalid*/
    document.getElementById('alert_name').innerHTML ="Name is invalid. Name only contains aphabet."
    document.getElementById('alert_name').style.display = 'block';
    document.getElementById('icon_name').style.display = 'none';
    name_bool = false;
  }
});

$("#input_num").on("propertychange change keyup paste input", function() {
  input = $(this).val();
  last_input = input.charCodeAt(input.length-1);
  //console.log(last_input);
  if(47<last_input && last_input<58){ /*only alphabet*/
    document.getElementById('icon_num').style.display = 'block';
    document.getElementById('alert_num').style.display = 'none';
    num_bool = true;
  }
  else if(input ==''){
    document.getElementById('alert_num').innerHTML ="Please enter your phone number"
    document.getElementById('alert_num').style.display = 'block';
    document.getElementById('icon_num').style.display = 'none';
    num_bool = false;
  }
  else{ /*invalid*/
    document.getElementById('alert_num').innerHTML ="Phone number is invalid. Phone number only contains numbers.."
    document.getElementById('alert_num').style.display = 'block';
    document.getElementById('icon_num').style.display = 'none';
    num_bool = false;
  }
});

$("#input_pw").on("propertychange change keyup paste input", function() {
  pwinput = $(this).val();
  last_input = pwinput.charCodeAt(pwinput.length-1);
  //console.log(last_input);
  pwinput_valid_len = 0;
  pwinput_valid_c = false;
  pwinput_valid_l = false;
  pwinput_valid_d = false;
  pwinput_valid_s = false;

  for(i=0; i< pwinput.length ; i++){
    //(1) check if input contain 1 capital letter
    if(64< pwinput.charCodeAt(i) && pwinput.charCodeAt(i)<91){
      console.log("capital letter");
      pwinput_valid_len = pwinput_valid_len +1;
      pwinput_valid_c = true;
    }

    //(2) check if input contain 1 lower case
    else if( 96< pwinput.charCodeAt(i) && pwinput.charCodeAt(i)<123){
        console.log("lower letter");
        pwinput_valid_len = pwinput_valid_len +1;
        pwinput_valid_l = true;
    }

    //(3) check if input contain 1 digit
    else if( 47< pwinput.charCodeAt(i) && pwinput.charCodeAt(i)<58){
        console.log("digit");
        pwinput_valid_len = pwinput_valid_len +1;
        pwinput_valid_d = true;
    }

    //(4) check if input contain 1 special char
    else if(32<pwinput.charCodeAt(i) && pwinput.charCodeAt(i)<48 || 57<pwinput.charCodeAt(i) && pwinput.charCodeAt(i)<65
      || 90<pwinput.charCodeAt(i) && pwinput.charCodeAt(i)<97 || 122<pwinput.charCodeAt(i) && pwinput.charCodeAt(i)< 126){
          console.log("special");
          pwinput_valid_len = pwinput_valid_len +1;
          pwinput_valid_s = true;
    }
  }

  if((pwinput_valid_len > 6 || pwinput_valid_len == 6) && pwinput_valid_c ==true && pwinput_valid_l ==true && pwinput_valid_d ==true && pwinput_valid_s ==true ){
    //console.log("Requirement satisfied");
    document.getElementById('icon_pw').style.display = 'block';
    document.getElementById('alert_pw').style.display = 'none';
    pw_bool = true;
  }
  else if(pwinput ==''){
    document.getElementById('alert_pw').innerHTML ="Please enter your password"
    document.getElementById('alert_pw').style.display = 'block';
    document.getElementById('icon_pw').style.display = 'none';
    pw_bool = false;
  }
  else{
    //console.log("not satisfied");
    document.getElementById('alert_pw').innerHTML ="Requirement: at least 6 char, 1 capital letter, 1 lowercase letter, at least 1 digit and 1 special character"
    document.getElementById('alert_pw').style.display = 'block';
    document.getElementById('icon_pw').style.display = 'none';
    pw_bool = false;
  }
});

$("#input_repw").on("propertychange change keyup paste input", function() {
  input = $(this).val();
  if($("#input_repw").val() == $("#input_pw").val()){
    document.getElementById('icon_repw').style.display = 'block';
    document.getElementById('alert_repw').style.display = 'none';
    repw_bool = true;
  }
  else if(input ==''){
    document.getElementById('alert_repw').innerHTML ="Please re-enter your phone password"
    document.getElementById('alert_repw').style.display = 'block';
    document.getElementById('icon_repw').style.display = 'none';
    repw_bool = false;
  }
  else{ /*invalid*/
    document.getElementById('alert_repw').innerHTML ="Password does not match"
    document.getElementById('alert_repw').style.display = 'block';
    document.getElementById('icon_repw').style.display = 'none';
    repw_bool = false;
  }
});
