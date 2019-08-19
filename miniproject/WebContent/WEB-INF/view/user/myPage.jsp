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

table{
	margin: 0 auto;
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

</style>
</head>
<body>
<header>
		<h1>Chinsa.</h1>
</header>
	
	
	<div class="menu">
		<nav>
				<a class="login" href="http://localhost:8080/miniproject/user/signin">로그인</a>
				<a class="join" href="http://localhost:8080/miniproject/user/signup">회원가입</a>
		</nav>
		<hr color=black>
	</div>
	
	<form>
		<div id ="box">
			<table>
				<tr>
					<td bgcolor="skyblue">이름</td>
					<td><input type="text" name="uName" id="uId" maxlength="100"
						value="${storedId}"></td>
				</tr>
				<tr>
					<td bgcolor="skyblue">아이디</td>
					<td><input type="text" name="uId" id="uPwd"
						maxlength="100"></td>
				</tr>
				<tr>
					<td bgcolor="skyblue">주소</td>
					<td><input type="text" name="uAdd" id="uPwd"
						maxlength="100"></td>
				</tr>
				<tr>
					<td bgcolor="skyblue">상태</td>
					<td><input type="text" name="uSta" id="uPwd"
						maxlength="100"></td>
				</tr>
			</table>
			<br>
					<button id="edit">회원정보수정</button>
					<button id="out">회원탈퇴</button>
		</div>
		
		<div class='left-box'>판매내역</div>
		<div class='right-box'>구매내역</div>
	</form>	
	
	<script type="text/javascript">
		const btn = document.querySelector("#edit");
		const btn2 = document.querySelector("#out");


		const req = new XMLHttpRequest();
		btn.addEventListener('click', function() {
			location.href = "#"
		});

		btn2.addEventListener('click', function() {
			location.href = "../"
		});
	</script>
</body>
</html>