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
		width:200px;
		float:left;
		margin:0 13px;
		margin-top:50px;
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
		border:3px solid #CC0000;
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
		background:#CC0000;
		color:white;
		font-weight:bold;
		border-radius:1px;
		cursor:pointer;
	}
	.sch_smit:hover{
		background:#CC0000;
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
			<button type='submit' class='sch_smit'>검색</button>
				<a class="login" href="http://localhost:8080/miniproject/user/signin">로그인</a>
				<a class="join" href="http://localhost:8080/miniproject/user/signup">회원가입</a>
		</nav>
		<hr color=black>
	</div>

	<!-- 여기 ajex 로 바꿔서 카테고리를 get으로 넘겨주세요
	product/search.jsp 파일로 넘어가서 출력할 겁니다.
	(http://localhost:8080/miniproject/product/search?category=garment 이런식-->
	<div class="category">
		<nav>
			<ul>
				<li class='1'><a href="#" >의류</a></li>

				<li class='2'><a href="#" >뷰티</a></li>

				<li class='3'><a href="#">가구</a></li>

				<li class='4'><a href="#">가전</a></li>

				<li class='5'><a href="#" >악세사리</a></li>

				<li class='6'><a href="#">스포츠</a></li>

				<li class='7'><a href="#" >자동차용품</a></li>

				<li class='8'><a href="#">공연/티켓</a></li>

				<li class='9'><a href="#">도서</a></li>

			</ul>
		</nav>
	</div>

	<div class="goods">
		<img src="resources/images/img/item1.jpg" width="250px"/>
			<h3>티셔츠</h3>
			<p>10000원</p>
	</div>

  <script type="text/javascript">
  init();
  function init(){
    const login = document.querySelector('.login');
    var loginState = true;

    var getCookie = function(name) {
    var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
      return value? value[2] : null;
    };
    var hasStoredId = getCookie("storedId");
    if(hasStoredId==null)
      loginState = false;

    getCookie();
     if(!loginState){
  	   login.setAttribute('href', "http://localhost:8080/miniproject/user/signin");
       login.innerHTML= "로그인";
    }else{
      login.setAttribute('href', "http://localhost:8080/miniproject/user/logout?id="+hasStoredId);
      login.innerHTML= "로그아웃";
    }
  }



  </script>

</body>
</html>
