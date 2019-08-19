<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<style>
body {
	color: black;
	background-color: skyblue;
}

li {
	list-style: none;
}

#form {
	width: 600px;
	height: 800px;
	border: 5px solid black;
	border-radius: 10% 10% 10% 10%;
	background-color: white;
	color: black;
}

#navigation {
	width: 960px;
	margin: 0 auto;
}

#mavigation>ul {
	overflow: hidden;
}

#navigation>ul>li {
	float: right;
}

#navigation>ul>li>a {
	display: block;
	background-color: white;
	color: black;
	padding: 10px 20px;
	border: 1px solid black;
}

#navigation>ul>li:first-child>a {
	border-radius: 0 10px 10px 0;
}

#navigation>ul>li:last-child>a {
	border-radius: 10px 0 0 10px;
}
</style>
</head>
<body>
	<nav id="navigation">
	<ul>
		<li><a href="http://localhost:8080/miniproject/">홈으로</a></li>
		<li><a href="http://localhost:8080/miniproject/user/signin">로그인</a></li>
	</ul>
	</nav>
	<center>
		<form>
			<br> <br> <br>
			<div id='form'>
				<br>
				<h1>연어 먹고 싶다</h1>
				<hr>
				<br> <br> <br>
				<h3>
					아이디 : <input type="text" />
				</h3>
				<br>
				<h3>
					비밀번호 : <input type="password" />
				</h3>
				<br>
				<h3>
					이름 : <input type="text" />
				</h3>
				<br>
				<h3>
					전화번호 : <input type="text" />
				</h3>
				<br>
				<h3>
					주소 : <input type="text" />
				</h3>
				<br>
				<h3>
					이메일 : <input type="text" />
				</h3>
				<br> <br> <br> <input type="submit" value="가입" />
			</div>
		</form>
	</center>
</body>
</html>