<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Page</title>
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

table {
	margin: 0 auto;
}

#box {
	width: 250px;
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

.sch_smit:hover {
	background: white;
}
</style>
</head>
<body>
	<form name="loginInfo">
		<header>
		<h1>
			<a class="head" href="http://localhost:8080/miniproject/">Chinsa.</a>
		</h1>

		</header>
		<div class="menu">
			<nav> <span class="search"> <input type='text'
				class='input_text' />
			</span> <a class="join" href="http://localhost:8080/miniproject/user/signup">회원가입</a>
			</nav>
			<hr color=black>
		</div>


		<div id="box">
			<table>
				<tr>
					<td bgcolor="skyblue">아이디</td>
					<td><input type="text" name="uId" id="uId" maxlength="100"
						value="${storedId}"></td>
				</tr>
				<tr>
					<td bgcolor="skyblue">비밀번호</td>
					<td><input type="password" name="uPwd" id="uPwd"
						maxlength="100"></td>
				</tr>
			</table>

			<label for="checkStore">ID저장하기</label>
			<c:choose>
				<c:when test="${checked}">
					<input type="checkbox" name="checkStore" id="checkStore" checked />
					<br />
				</c:when>
				<c:otherwise>
					<input type="checkbox" name="checkStore" id="checkStore" />
					<br />
				</c:otherwise>
			</c:choose>
			<br>
			<button id="loginBtn" type="button">로그인</button>
			<button id="cancel" type="button">취소</button>
		</div>
	</form>


	<script type="text/javascript">
		const btn = document.querySelector("#loginBtn");
		const btn2 = document.querySelector("#cancel");
		const id = document.querySelector("#uId");
		const pwd = document.querySelector("#uPwd");
		const checkStore = document.querySelector("#checkStore");

		const req = new XMLHttpRequest();
		btn2.addEventListener('click', function() {
			location.href = "../";
		});

		btn
				.addEventListener(
						'click',
						function() {
							req.addEventListener('load', function() {
								console.log(this.responseText);
								if (this.responseText === "login")
									location.href = "../";
								else if (this.responseText === "idErr") {
									alert("해당 id가 존재하지 않습니다");
								} else {
									alert("패스워드가 틀립니다");
								}
							});
							req
									.open('post',
											'http://localhost:8080/miniproject/api/user/login');
							req.setRequestHeader("Content-Type",
									"application/json;charset=utf-8");
							req.send(JSON.stringify({
								"user" : {
									"uId" : id.value,
									"uPwd" : pwd.value
								},
								"checkStore" : checkStore.checked
							}));
						});
	</script>

</body>
</html>