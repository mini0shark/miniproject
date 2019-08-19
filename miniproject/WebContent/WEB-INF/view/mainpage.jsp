<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>mainpage</title>

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
	
	.goods{
		width:400px;
		float:left;
		margin:0 13px;
		margin-top:100px;
		text-align:center;
	}
	.category{
		
		height:300px;
		width:250px;
		float:left;
		
	}
	
	.category a{
		color:white;
		text-decoration:none;
		display:block;
		cursor:pointer;
		text-transform:uppercase;
		font-size:12px;
		font-weight:500;
		letter-spacing:0.2em;
		padding:10px;
		margin:0 0px;
		background:#000;
	}
	
	.category a:hover{
		background:white;
		color:black;
	}
	.category:after{
		content:'.';
		display:block;
		clear:both;
		visibility:hidden;
		line-height:0;
		height:0;
	}
	
	ul{
		
		list-style:none;
		padding-left:0px;
		
	}
	
	a.login:link{
		color:#CC0000;
		text-decoration:none;
		font-weight:bold;
	}
	a.login:visited{
		color:#CC0000;
		text-decoration:none;
	}
	a.login:hover{
		color:black;
		text-decoration:none;
	}
	a.join:link{
		color:#CC0000;
		text-decoration:none;
		font-weight:bold;
	}
	a.join:visited{
		color:#CC0000;
		text-decoration:none;
	}
	a.join:hover{
		color:black;
		text-decoration:none;
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
				<a class="login" href="#">로그인</a>
				<a class="join" href="#">회원가입</a>
		</nav>
		<hr color=black>
	</div>
	
	
	<div class="category">
		<nav>
			<ul>
				<li class='1'><a href="#" style="color:white">의류</a></li>
				
				<li class='2'><a href="#" style="color:white">뷰티</a></li>
				
				<li class='3'><a href="#" style="color:white">가구</a></li>
				
				<li class='4'><a href="#" style="color:white">가전</a></li>
				
				<li class='5'><a href="#" style="color:white">악세사리</a></li>
				
				<li class='6'><a href="#" style="color:white">스포츠</a></li>
				
				<li class='7'><a href="#" style="color:white">자동차용품</a></li>
				
				<li class='8'><a href="#" style="color:white">공연/티켓</a></li>
				
				<li class='9'><a href="#" style="color:white">도서</a></li>
				
			</ul>
		</nav>
	</div>
	
	<div class="goods">
		<img src="WEB-INF/img/item1.jpg" width="350px"/>
			<h3>상품명</h3>
			<p>가격</p>
	</div>
	
	
</body>
</html>