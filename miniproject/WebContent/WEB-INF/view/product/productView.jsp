<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>제품 상세 페이지</title>
<style>
body {
	
}

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

a.head:link {
	color: #CC0000;
	text-decoration: none;
	font-weight: bold;
}

a.head:visited {
	color: #CC0000;
	text-decoration: none;
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

.menu {
	background: #fff;
	margin-top: 150px;
	margin-left: 0px;
	width: 100%;
	position: relative;
	z-index: 1;
	text-align: right;
}

#pInfo {
	border: 1px solid black;
	margin: 0 auto;
	width: 1000px;
}

#commentTable {
	margin: 0 auto;
	width: 1000px;
	border: 1px solid black;
}

#commentTable > tr{
	border: 1px solid black;
}
</style>
</head>
<script type="text/javascript">

</script>
<body>
	<header>
		<h1>
			<a class="head" href="http://localhost:8080/miniproject/">Chinsa.</a>
		</h1>
	</header>
	
	
	<div class="menu">
		<nav>
				<a class="login" href="http://localhost:8080/miniproject/user/signin">로그인</a>
				<a class="join" href="http://localhost:8080/miniproject/user/signup">회원가입</a>
		</nav>
		<hr color=black>
	</div>
	
	<br><br>
	<div>
	<table style="margin-left:auto; margin-right:auto;">
	<tr>
		<td>
			<img src="${vo.pImg}" width="340px" height="300"/>
		</td>
		<td>
		<table style="height:300px; width:400px;">
			<tr align="center">
				<td>상품명</td>
				<td>${vo.pName}</td>
			</tr>
			<tr align="center">
				<td>가격</td>
				<td>${vo.pPrice}</td>
			</tr>
			<tr align="center">
				<td colspan="2">
				<form name="form1" method="post" action="">
					<input type="hidden" name="productId" value="">
					<select name="amount">
						
					</select>
					<input type="submit" value="장바구니에 담기">
				</form>
				<a href="#">상품목록</a>
				</td>
			</tr>
		</table>
		</td>
	</tr>
	</table>
	<br><br>
	<div id = "pInfo">
		${vo.pInfo}
	</div>
	<!-- 댓글창 만들기 -->
	<!-- 댓글창 만들 때 필요한 것, 댓글 번호(삭제나 수정시 필요), 글 번호(해당 글의 댓글만 가져올 때 필요)
	, 작성날짜(댓글 정렬), 작성자의 이름 -->
	<div>
		<table height = 200 align = center>
			<tr>
				<th><!-- 작성자 이름 --></th>
				<th><!-- 작성 날짜 --></th>
			</tr>
			<tr>
				<td><!-- 작성 텍스트 에리어 --></td>
				<td><!-- 확인 버튼 --></td>
			</tr>
		</table>
		<br>

		<!-- 여기는 해당 글 번호에 존재하는 모든 댓글들을 가져와 출력 -->
		<!-- 작성자 이름, 작성 날짜 -->
		<table id = "commentTable">
			<tr>
				<th>작성자: ${user.getuName}</th>
				<th>작성날짜: </th>
			</tr>
			<tr>
			<!-- 댓글 에리어, 수정 삭제 버튼 -->
				<td>댓글이다</td>
				<td>
					<button>수정</button>
					<button>삭제</button>
				</td>
			</tr>
		</table>
	</div>
	</div>
	
	<script type="text/javascript">

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
				login.setAttribute('href', "http://localhost:8080/miniproject/user/signin");
				login.innerHTML= "로그인";
				join.setAttribute('href', "http://localhost:8080/miniproject/user/signup");
				join.innerHTML="회원가입";
			}

		});
		req.open('post', "http://localhost:8080/miniproject/api/user/checkLogin");
		req.send();

		const initProductListRequest = new XMLHttpRequest();
		initProductListRequest.addEventListener('load', function(){
			const productListJson = this.responseText;
			showList(productListJson);
		});
		initProductListRequest.open('get','http://localhost:8080/miniproject/api/product/initproduct');
		initProductListRequest.send();
	}
	</script>

</body>
</html>