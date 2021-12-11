/*for main.jsp page */
function tologinpage(){
  location.href = "login.jsp";
}

function tojoinpage(){
  location.href = "join.jsp";
}

/*for image change */
let num = 0;
function changeimg(){
	console.log(num);
	if(num%3== 0){
    	document.getElementById("cafeimg").src = "./img/cafe2.jpg";
	}
	else if(num%3 == 1){
		document.getElementById("cafeimg").src = "./img/cafe3.jpg";
	}
	else if(num%3 == 2){
		document.getElementById("cafeimg").src = "./img/cafe.jpg";
	}
	num++;
}

