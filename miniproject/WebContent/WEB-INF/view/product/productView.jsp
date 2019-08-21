<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>제품 상세 페이지</title>
<style>
	body{
		
	}
	header{
		background:#fff;
		height:150px;
		width:100%;
		position:fixed;
		top:0;
		left:0;
		z-index:1;
		text-align:center;
		color:#CC0000;
		font-size:20px;
		font-weight:bolder;
		letter-spacing:0.2em;
	}

	.menu{
		background:#fff;
		margin-top:150px;
		margin-left:0px;
		width:100%;
		position:relative;
		z-index:1;
		text-align:right;
	}
	
</style>
</head>
<script type="text/javascript">

</script>
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
	
	<br><br>
	<table style="margin-left:auto; margin-right:auto;">
	<tr>
		<td>
			<img src="${path}/images/${vo.pImg}" width="340px" height="300"/>
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

</body>
</html>