<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>mainpage</title>

<style>
	body{
		text-align:center;
	}
	header{
		background:#99CC66;
		height:300px;
		width:100%;
		position:fixed;
		top:0;
		left:0;
		z-index:1;
	}
	.main{
		background:#fff;
		margin-top:300px;
		position:relative;
		z-index:3;
	}
	footer{
		background:#99CC66;
		overflow:hidden;
		p{
			margin:0;
			font-size:18px;
			text-decoration:none;
			line-height:100px;
			display:block;
		}
		
	}
	
	.goods{
		width:400px;
		float:left;
		margin:0 13px;
		text-align:center;
	}

</style>

</head>

<body>

	<header>
		<h1>Chinsa mini</h1>
	</header>
	
	<div class="menu">
		<nav>
			<ul>
				<li><a href="#">로그인</a></li>
				<li><a href="#">회원가입</a></li>
			</ul>
		</nav>
	</div>
	
	
	<div class="category">
		<nav>
			<ul>
				<li><a href="#">의류</a></li>
				<li><a href="#">뷰티</a></li>
				<li><a href="#">가구</a></li>
				<li><a href="#">가전</a></li>
				<li><a href="#">악세사리</a></li>
				<li><a href="#">스포츠</a></li>
				<li><a href="#">자동차용품</a></li>
				<li><a href="#">공연/티켓</a></li>
				<li><a href="#">도서</a></li>
			</ul>
		</nav>
	</div>
	
	<div class="goods">
		<img src="WEB-INF/img/item1.jpg" width="350px"/>
			<h3>상품명</h3>
			<p>가격</p>
	</div>
	
	
	
	<footer>
		<p>www.chinsa.co.kr
		</p>
	</footer>
</body>
</html>