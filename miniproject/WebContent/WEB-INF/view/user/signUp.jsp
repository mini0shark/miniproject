<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
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

a.home:link {
	color: #CC0000;
	text-decoration: none;
	font-weight: bold;
}

a.home:visited {
	color: #CC0000;
	text-decoration: none;
}

a.home:hover {
	color: black;
	text-decoration: none;
}

#form {
	margin: 0 auto;
}

#table {
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

#button {
	background-color: red;
	margin: 0 auto;
}

a.head:link {
	color: #CC0000;
	text-decoration: none;
	font-weight: bold;
}

a.head:visited {
	color: #CC0000;
	text-decoration: none;
}

.search {
	display: inline-block;
	width: 366px;
	height: 34px;
	border: 3px solid white;
	background: white;
}

.input_text {
	width: 348px;
	height: 21px;
	margin: 6px 0 0 9px;
	border: 0;
	line-height: 21px;
	font-weight: bold;
	font-size: 16px;
	outline: none;
}

.sch_smit {
	width: 54px;
	height: 40px;
	margin: 0;
	border: 0;
	vertical-align: top;
	background: white;
	color: white;
	font-weight: bold;
	border-radius: 1px;
	cursor: pointer;
}
</style>
</head>

<body>
	<header>
	<h1>
		<a class="head" href="http://localhost:8080/miniproject/">Chinsa.</a>
	</h1>
	</header>

	<div class="menu">
		<nav> <span class="search"> <input type='text'
			class='input_text' />
		</span> <a class="home" href="http://localhost:8080/miniproject/">메인</a> <a
			class="login" href="http://localhost:8080/miniproject/user/signin">로그인</a>
		</nav>
	</div>

	<hr style="border: 1px solid black;">
	<br>
	<br>
	<form>
		<div id="form">
			<table id="table">
				<tr>
					<th>아이디 :</th>
					<th><input type="text" name="uId" id="uId" />
					<button id="checkID" type="button">중복확인</button></th>

				</tr>

				<tr>
					<th>비밀번호 :</th>
					<th><input type="password" name="uPwd" id="uPwd" /></th>
				</tr>

				<tr>
					<th>비밀번호 확인:</th>
					<th><input type="password" name="confirmPwd" id="confirmPwd" />
					</th>
				</tr>
				<tr>
					<th>이름 :</th>
					<th><input type="text" name="uName" id="uName" /></th>
				</tr>
				<tr>
					<th>전화번호 :</th>
					<th><input type="tel" name="uPhone" id="uPhone" pattern="\d{2,3}-\d{3,4}-\d{4}"/></th>
				</tr>
				<tr>
					<th>주소 :</th>
					<th><input type="text" name="uAddress" id="uAddress" /></th>
				</tr>
				<tr>
					<th>이메일 :</th>
					<th><input type="email" name="uEmail" id="uEmail" /></th>
				</tr>
			</table>
			<br><br>
			<center>
				<button id="signUpButton" type="button">가입</button>
				<button id="cancelButton" type="button">취소</button>
			</center>
		</div>
	</form>

	<script type="text/javascript">
		const signUpButton = document.querySelector("#signUpButton");
		const cancelButton = document.querySelector("#cancelButton");
		const checkButton = document.querySelector("#checkID");

		const id = document.querySelector("#uId");
		const pwd = document.querySelector("#uPwd");
		const name = document.querySelector("#uName");
		const phone = document.querySelector("#uPhone");
		const address = document.querySelector("#uAddress");
		const email = document.querySelector("#uEmail");

		const req = new XMLHttpRequest();

		// 취소 버튼
		cancelButton.addEventListener('click', function() {
			alert("취소되었습니다.")
			location.href= "../";
		});
		// 중복체크
		const checkReq = new XMLHttpRequest();
		checkButton.addEventListener('click', function(){
			checkReq.addEventListener('load', function(){
				const resultMsg = this.responseText;
				var alertMsg = "";
				if(resultMsg==="duplicateID"){
					alertMsg = "중복된 아이디 입니다.";
				}else if (resultMsg==="fineID") {
					alertMsg = "사용하셔도 좋은 ID입니다.";
				}
				alert(alertMsg);
			});
			checkReq.open("GET",
					"http://localhost:8080/miniproject/api/user/checkId?uId="+id.value);
			checkReq.send();
		})

		// 가입 버튼
		signUpButton.addEventListener('click', function() {
			req.addEventListener('load', function() {
				const resultMsg = this.responseText;
				var alertMsg = "";
				console.log(resultMsg);

				if(resultMsg==="signupErr"){
					alertMsg = "데이터베이스오류 다시 가입해보세요";
				}
				else if(resultMsg==="duplicateID"){
					alertMsg = "ID가 중복됩니다. 다른 ID를 사용하세요.";
				}
				else if(resultMsg==="signup"){
					alertMsg = "회원가입이 완료되었습니다.";
					location.href = "../";
				}
				else{
					alertMsg = resultMsg;
				}
				alert(alertMsg);
			});

			// 데이터 입력된 거 보내기
			req.open("POST",
					"http://localhost:8080/miniproject/api/user/signup");
			req.setRequestHeader("Content-Type",
					"application/json;charset=UTF-8");
			req.send(JSON.stringify({
				"user" : {
					"uId" : id.value, // 아이디
					"uPwd" : pwd.value, // 비밀번호
					"uName" : name.value, // 이름
					"uPhone" : phone.value, // 전화번호
					"uAddress" : address.value, // 주소
					"uEmail" : email.value
				// 이메일
				},
				"confirmPwd" : confirmPwd.value
			}));
		});
	</script>
</body>
</html>
