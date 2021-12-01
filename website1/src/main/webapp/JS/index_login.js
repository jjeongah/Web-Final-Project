/*for login.html page */
function gotomainpage(){
  location.href = "main.html";
}

function gotoreservepage(){
console.log(document.getElementById("input1").value);
 if(document.getElementById("input1").value =='' && document.getElementById("input2").value !=''){
   alert("Please enter your phone number!");
 }
 else if(document.getElementById("input2").value =='' && document.getElementById("input1").value !=''){
   alert("Please enter your password!");
 }
 else if(document.getElementById("input2").value =='' && document.getElementById("input1").value ==''){
   alert("Please enter your phone number and password!");
 }
 else{
   console.log(document.getElementById("input1").value);
   localStorage.setItem("phone_num", document.getElementById("input1").value);
 }
}
