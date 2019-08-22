<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>개인 상세 정보</title>
<style>
header {
	background: #fff;
	height: 150px;
	width: 100%;
	position: fixed;
	top: 0;
	left: 0;
	z-index: 1;
	text-align: center;
	color: #CC0000;
	font-size: 20px;
	font-weight: bolder;
	letter-spacing: 0.2em;
}

.menu {
	background: #fff;
	margin-top: 150px;
	margin-left: 0px;
	width: 100%;
	position: relative;
	z-index: 1;
	text-align: right;
}

a.login:link {
	color: #CC0000;
	text-decoration: none;
	font-weight: bold;
}

a.login:visited {
	color: #CC0000;
	text-decoration: none;
}

a.login:hover {
	color: black;
	text-decoration: none;
}

a.join:link {
	color: #CC0000;
	text-decoration: none;
	font-weight: bold;
}

a.join:visited {
	color: #CC0000;
	text-decoration: none;
}

a.join:hover {
	color: black;
	text-decoration: none;
}

#table{
	background-color: black;
	padding: 10px;
	color: white;
	margin: 0 auto;
	color: white;
	border-collapse: separate;
	border-spacing: 20px;
}

#table>tr {
	margin: 10px;
}

#box {
	width: 250px;
	margin: 0 auto;
}

.left-box {
  width: 40%;
  float: left;
  border-style: solid;
  margin: 20px;
  padding: 20px;
  height: 500px;
}
.right-box {
  float: right;
  width: 40%;
  border-style: solid;
  margin: 20px;
  padding: 20px;
  height: 500px;
}
a.head:link{
	color:#CC0000;
	text-decoration:none;
	font-weight:bold;
}
a.head:visited{
	color:#CC0000;
	text-decoration:none;
}
.search{
	display:inline-block;
	width:366px; height:34px;
	border:3px solid white;
	background:white;
		
}
.input_text{
	width:348px; height:21px;
	margin:6px 0 0 9px;
	border:0;
	line-height:21px;
	font-weight:bold;
	font-size:16px;
	outline:none;
}
.sch_smit{
	width:54px; height:40px;
	margin:0;
	border:0;
	vertical-align:top;
	background:white;
	color:white;
	font-weight:bold;
	border-radius:1px;
	cursor:pointer;
}
.sch_smit:hover{
	background:white;
}
</style>
</head>
<body>
<header>
		<h1><a class="head" href="http://localhost:8080/miniproject/">Chinsa.</a></h1>
</header>
	
	
	<div class="menu">
		<nav>
		<span class="search">
				<input type='text' class='input_text'/>
		</span>
				<a class="login" href="http://localhost:8080/miniproject/user/signin">로그인</a>
				<a class="join" href="http://localhost:8080/miniproject/user/signup">회원가입</a>
		</nav>
		<hr style="border: 1px solid black;">
	</div>
	
	<form>
		<div id ="box">
			<table id="table">
				<tr>
					<th>이름:</th>
					<th>${user.getuName}</th>
				</tr>
				<tr>
					<th>아이디:</th>
					<th>${user.getuId}</th>
				</tr>
				<tr>
					<th>주소:</th>
					<th>${user.getuAddress}</th>
				</tr>
				<tr>
					<th>상태:</th>
					<th>${user.getuLevel}</th>
				</tr>
			</table>
			<br>
			<center>
				<button id="edit" type="button">회원정보수정</button>
				<button id="out" type="button">회원탈퇴</button>
				<button id="regi" type="button">상품등록</button>
			</center>
		</div>
		
		<div class='left-box' style="text-align:center; font-weight: bolder;">판매내역<br><input type="text"  style="text-align:center; width:600px; height:470px;"/></div>
		<div class='right-box' style="text-align:center; font-weight: bolder;">구매내역<br><input type="text"  style="text-align:center; width:600px; height:470px;"/></div>
	</form>	
	
	<script type="text/javascript">
		const btn = document.querySelector("#edit");
		const btn2 = document.querySelector("#out");
		const btn3 = document.querySelector("#regi");

		const req = new XMLHttpRequest();
		
		btn.addEventListener('click', function() {
			location.href = "../user/update";
		});

		btn2.addEventListener('click', function() {
			location.href= "../";
		});
		
		btn3.addEventListener('click', function() {
			location.href= "http://localhost:8080/miniproject/product/registration";
		});		
		
		
		
		

		init();
		function init(){
			const login = document.querySelector('.login');
			const join = document.querySelector('.join');
			var loginState = true;

			const req = new XMLHttpRequest();
			req.addEventListener('load', function(){
				var hasStoredId = this.responseText;
				if(hasStoredId==="true")
				loginState = true;
				else
				loginState = false;

				if(loginState){
					login.setAttribute('href', "http://localhost:8080/miniproject/user/logout?id="+hasStoredId);
					login.innerHTML= "로그아웃";
					join.setAttribute('href', "http://localhost:8080/miniproject/user/mypage");
					join.innerHTML="마이페이지";
				}
				else{
					alert("로그인이 필요한 서비스 입니다.");
					location.href= "http://localhost:8080/miniproject";
				}

			});
			req.open('post', "http://localhost:8080/miniproject/api/user/checkLogin");
			req.send();
		}
	</script>
</body>
</html>