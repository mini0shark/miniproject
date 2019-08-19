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

#table {
	background-color: black;
	color: white;
}
</style>
</head>

<body>
	<header>
	<h1>Chinsa.</h1>
	</header>

	<div class="menu">
		<nav> <a class="home" href="http://localhost:8080/miniproject/">메인</a>
		<a class="login" href="http://localhost:8080/miniproject/user/signin">로그인</a>
		</nav>
	</div>

	<hr style="border: 1px solid black;">

	<form>
		<div id="form">
			<table id="table">
				<tr>
					<th>아이디 :</th>
					<th><input type="text" name="uId" id="uId" /></th>
				</tr>
				<br>
				<tr>
					<th>비밀번호 :</th>
					<th><input type="password" name="uPwd" id="uPwd" /></th>
				</tr>
				<br>
				<tr>
					<th>비밀번호 확인:</th>
					<th><input type="password" name="confirmPwd" id="confirmPwd" />
					</th>
				</tr>
				<br>
				<br>
				<tr>
					<th>이름 :</th>
					<th><input type="text" name="uName" id="uName" /></th>
				</tr>
				<br>
				<tr>
					<th>전화번호 :</th>
					<th><input type="text" name="uPhone" id="uPhone" /></th>
				</tr>
				<br>
				<tr>
					<th>주소 :</th>
					<th><input type="text" name="uAddress" id="uAddress" /></th>
				</tr>
				<br>
				<tr>
					<th>이메일 :</th>
					<th><input type="text" name="uEmail" id="uEmail" /></th>
				</tr>
			</table>
			<br> <input type="submit" value="가입" id="signUpButton" />
			<button id="cancelButton" type="button">취소</button>
		</div>
	</form>

	<script type="text/javascript">
		const signUpButton = document.querySelector("#signUpButton");
		const cancelButton = document.querySelector("#cancelButton");

		const id = document.querySelector("#uId");
		const pwd = document.querySelector("#uPwd");
		const name = document.querySelector("#uName");
		const phone = document.querySelector("#uPhone");
		const address = document.querySelector("#uAddress");
		const email = document.querySelector("#uEmail");

		const req = new XMLHttpRequest();

		// 취소 버튼
		cancelButton.addEventListener('click', function() {
			location.href("../");
		});

		// 가입 버튼
		signUpButton.addEventListener('click', function() {
			req.addEventListener('load', function() {
				console.log(this.responseText);
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